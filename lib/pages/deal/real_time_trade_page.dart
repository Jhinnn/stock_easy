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
  List<String> codeList = [
    CodeString.sanyiString,
    CodeString.pinganString,
    CodeString.changanString,
    CodeString.renbaoString
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRealTimeTrade();
  }

  getRealTimeTrade() async {
    for (String code in codeList) {
      RealTimeTradeModel realTimeTradeModel =
          await Api.fetchRealTimeTradeData(code);
      realTimeTradeModelList.add(realTimeTradeModel);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: realTimeTradeModelList
            .map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(e.p),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${e.pc}%'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(e.v)
                  ],
                ))
            .toList(),
      ),
    ));
  }
}
