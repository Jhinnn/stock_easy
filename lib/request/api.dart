import 'package:stock_easy/lib/const.dart';
import 'package:stock_easy/models/fund/funds_model.dart';
import 'package:stock_easy/models/histroy_model.dart';
import 'package:stock_easy/models/main_funds_model.dart';
import 'package:stock_easy/models/three_one_model.dart';
import 'package:dio/dio.dart';
import 'package:stock_easy/lib/tool.dart';

class Api {
  static Future<RealTimeTradeModel> fetchRealTimeTradeData(String code) async {
    //http://api.mairui.club/hszbl/fsjy/600031/dh/b887d4403688d5e65a
    
    var data = await Dio()
        .get('http://api.mairui.club/hsrl/ssjy/$code/${CodeString.stockKey}');
    RealTimeTradeModel threeOneModel = RealTimeTradeModel.fromJson(data.data);
    return threeOneModel;
  }

  // static Future<ThreeOneModel> fetchSanyiVData(String code) async {
  //   //http://api.mairui.club/hszbl/fsjy/600031/dh/b887d4403688d5e65a
  //   var data = await Dio()
  //       .get('http://api.mairui.club/hsrl/ssjy/$code/dh/${CodeString.stockKey}');
  //   ThreeOneModel threeOneModel = ThreeOneModel.fromJson(data.data);
  //   return threeOneModel;
  // }

  //1.主力资金走势
  static Future<MFModel> fetchMainFundsData(String code) async {
    var data = await Dio()
        .get('http://api.mairui.club/hsmy/zlzj/$code/${CodeString.stockKey}');
    MFModel mfModel = MFModel.fromJson(data.data);
    return mfModel;
  }


  //2.资金流入趋势
  static Future<FModel> fetchFundsData(String code) async {
    var data = await Dio()
        .get('http://api.mairui.club/hsmy/zjlr/$code/${CodeString.stockKey}');
    FModel fModel = FModel.fromJson(data.data);
    return fModel;
  }

  //3.历史成交分布
  //http://api.mairui.club/hsmy/lscj/600031/b887d4403688d5e65a
  static Future<HisModel> fetchHistroyData(String code) async {
    //http://api.mairui.club/hszbl/fsjy/600031/dh/b887d4403688d5e65a
    // http://api.mairui.club/hsmy/lscj/600031/b887d4403688d5e65a
    var data = await Dio()
        .get('http://api.mairui.club/hsmy/lscj/$code/${CodeString.stockKey}');
    HisModel histroyModel = HisModel.fromJson(data.data);
    return histroyModel;
  }
}
