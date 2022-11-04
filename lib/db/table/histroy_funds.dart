import 'package:sqflite/sqlite_api.dart';
import 'package:stock_easy/db/table_define.dart';
import 'package:stock_easy/db/table_operation.dart';
import 'package:stock_easy/models/histroy_model.dart';

class HistroyFundsTable extends TableOperation {
  Future<List<HistroyModel>> query(String tableName) async {
    List<Map<String, Object?>> data =
        await dDatabase.query(tableName);
    return List.generate(data.length, (index) {
      return HistroyModel.fromJson(data[index]);
    });
  }

  insertData(HistroyModel histroyModel, String tableName) async {
    await dDatabase.insert(
          tableName, histroyModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
