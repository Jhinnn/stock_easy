import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:stock_easy/db/table/histroy_funds.dart';
import 'package:stock_easy/db/table/three_one.dart';
import 'package:stock_easy/db/table_define.dart';

/// 数据库帮助类
class DbHelper {
  DSTableDefine dsTableDefine = DSTableDefine();

  ThreeOneTable threeOneTable = ThreeOneTable();
  HistroyFundsTable histroyFundsTable = HistroyFundsTable();
  //私有构造
  DbHelper._();
  static DbHelper? _instance;
  static DbHelper get instance => _getInstance();
  factory DbHelper() {
    return instance;
  }
  static DbHelper _getInstance() {
    _instance ??= DbHelper._();
    return _instance ?? DbHelper._();
  }

  /// 数据库默认存储的路径
  /// SQLite 数据库是文件系统中由路径标识的文件。如果是relative，
  /// 这个路径是相对于 获取的路径getDatabasesPath()，
  /// Android默认的数据库目录，
  /// iOS/MacOS的documents目录。

  Future<Database>? _db;

  Future<Database>? getDb() {
    _db ??= _initDb();
    return _db;
  }

  // Guaranteed to be called only once.保证只调用一次
  Future<Database> _initDb() async {
    // 这里是我们真正创建数据库的地方 vserion代表数据库的版本，如果版本改变
    //，则db会调用onUpgrade方法进行更新操作
    Directory path = await getApplicationDocumentsDirectory();
    print(p.join(path.path, 'stock', 'histroy.db'));
    final db = await openDatabase(p.join(path.path, 'stock', 'histroy.db'),
        version: 1, onCreate: (db, version) {
      // 数据库创建完成
      // 创建表 一个自增id 一个text
      db.execute(dsTableDefine.createHistroyFundsTable());
    }, onUpgrade: (db, oldV, newV) {
      // 升级数据库调用
      ///  db 数据库
      ///   oldV 旧版本号
      //   newV 新版本号
      //   升级完成就不会在调用这个方法了
    });
    
    histroyFundsTable.database = db;
    threeOneTable.database = db;
    return db;
  }

// 关闭数据库
  close() async {
    await _db?.then((value) => value.close());
  }
}
