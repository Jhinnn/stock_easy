
import 'package:sqflite/sqlite_api.dart';
import 'package:stock_easy/db/table_define.dart';
import 'package:stock_easy/db/table_operation.dart';
import 'package:stock_easy/models/three_one_model.dart';

class ThreeOneTable extends TableOperation {
  Future<List<RealTimeTradeModel>> query() async {
    List<Map<String, Object?>> data =
        await dDatabase.query(DSTableDefine.threeOneTable);
    return List.generate(data.length, (index) {
      return RealTimeTradeModel.fromJson(data[index]);
    });
  }


  Future<int> insertData(RealTimeTradeModel threeOneModel) async {
    return await dDatabase.insert(
        DSTableDefine.threeOneTable, threeOneModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
