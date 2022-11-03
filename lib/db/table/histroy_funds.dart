import 'package:sqflite/sqlite_api.dart';
import 'package:stock_easy/db/table_define.dart';
import 'package:stock_easy/db/table_operation.dart';
import 'package:stock_easy/models/histroy_model.dart';

class HistroyFundsTable extends TableOperation {
  Future<List<HistroyModel>> query() async {
    List<Map<String, Object?>> data =
        await dDatabase.query(DSTableDefine.historyFundsTable);
    return List.generate(data.length, (index) {
      return HistroyModel.fromJson(data[index]);
    });
  }

  insertData(HistroyModel histroyModel) async {
    List<Map<String, Object?>> data = await dDatabase.query(
        DSTableDefine.historyFundsTable,
        where: 't = ?',
        whereArgs: [histroyModel.t]);
    if (data.isEmpty) {
      await dDatabase.insert(
          DSTableDefine.historyFundsTable, histroyModel.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    
  }
}
