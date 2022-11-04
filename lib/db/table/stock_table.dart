import 'package:sqflite/sqlite_api.dart';
import 'package:stock_easy/db/table_define.dart';
import 'package:stock_easy/db/table_operation.dart';
import 'package:stock_easy/models/stock_model.dart';

class StockTable extends TableOperation {
  Future<List<StockModel>> query() async {
    List<Map<String, Object?>> data =
        await dDatabase.query(DSTableDefine.stockTable);
    return List.generate(data.length, (index) {
      return StockModel.fromJson(data[index]);
    });
  }

  Future<int> insertData(StockModel stockModel) async {
    return await dDatabase.insert(DSTableDefine.stockTable, stockModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
