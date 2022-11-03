import 'package:flutter/material.dart';
import 'package:stock_easy/lib/const.dart';
import 'package:stock_easy/models/three_one_model.dart';
import 'package:stock_easy/request/api.dart';

class RealTimeTradePage extends StatefulWidget {
  const RealTimeTradePage({Key? key}) : super(key: key);

  @override
  State<RealTimeTradePage> createState() => _RealTimeTradePageState();
}

class _RealTimeTradePageState extends State<RealTimeTradePage> {
  List<RealTimeTradeModel> realTimeTradeModelList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRealTimeTrade();
  }

  getRealTimeTrade() async {
    RealTimeTradeModel realTimeTradeModel =
        await Api.fetchRealTimeTradeData(CodeString.sanyiString);
    realTimeTradeModelList.add(realTimeTradeModel);
    print(realTimeTradeModel);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
