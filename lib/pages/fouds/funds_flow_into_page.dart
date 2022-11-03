import 'package:flutter/material.dart';
import 'package:stock_easy/lib/tool.dart';
import 'package:stock_easy/models/fund/funds_model.dart';

/*
资金流入趋势
API接口：http://api.mairui.club/hsmy/zjlr/股票代码(如000001)/您的licence
备用接口：http://api1.mairui.club/hsmy/zjlr/股票代码(如000001)/您的licence
接口说明：根据《股票列表》得到的股票代码作为参数，得到近十年每天资金流入趋势，按时间倒序。
数据更新：每天20:00开始更新（更新耗时约4小时）
请求频率：1分钟20次

字段名称	数据类型	字段说明
t	string	时间yyyy-MM-dd
zdf	number	涨跌幅(%)
hsl	number	换手率(%)
jlr	number	净流入(元)
jlrl	number	净流入率(%)
zljlr	number	主力净流入(元)
zljlrl	number	主力净流入率(%)
hyjlr	number	行业净流入(元)
hyjlrl	number	行业净流入率(%)

*/

class FundsFlowIntoPage extends StatelessWidget {
  final List<FundsModel> mFList;
  const FundsFlowIntoPage({Key? key, required this.mFList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 10, color: Colors.white);
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: Text("时间", style: style)),
            Expanded(flex: 1, child: Text('涨跌幅(%)', style: style)),
            Expanded(flex: 1, child: Text('换手率(%)', style: style)),
            Expanded(flex: 1, child: Text('净流入(元)', style: style)),
            Expanded(flex: 1, child: Text('静流入率(%)', style: style)),
            Expanded(flex: 1, child: Text('主力净流入(元)', style: style)),
            Expanded(flex: 1, child: Text('主力净流入率(%)', style: style)),
            Expanded(flex: 1, child: Text('行业净流入(元)', style: style)),
            Expanded(flex: 1, child: Text('行业净流入率(%)', style: style)),
          ],
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                  itemCount: mFList.length,
                  itemBuilder: (_, index) {
                    FundsModel e = mFList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Text(e.t, style: style)),
                        Expanded(flex: 1, child: Text(e.zdf, style: style)),
                        Expanded(flex: 1, child: Text(e.hsl, style: style)),
                        Expanded(flex: 1, child: Text(tranlation(e.jlr), style: style)),
                        Expanded(flex: 1, child: Text(e.jlrl, style: style)),
                        Expanded(flex: 1, child: Text(tranlation(e.zljlr), style: style)),
                        Expanded(flex: 1, child: Text(e.zljlrl, style: style)),
                        Expanded(flex: 1, child: Text(tranlation(e.hyjlr), style: style)),
                        Expanded(flex: 1, child: Text(e.hyjlrl, style: style)),
                      ],
                    );
                  })),
        ),
      ],
    );
  }
}
