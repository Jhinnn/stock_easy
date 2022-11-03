import 'package:flutter/material.dart';
import 'package:stock_easy/lib/tool.dart';
import 'package:stock_easy/models/main_funds_model.dart';

/*
API接口：http://api.mairui.club/hsmy/zlzj/股票代码(如000001)/您的licence
备用接口：http://api1.mairui.club/hsmy/zlzj/股票代码(如000001)/您的licence
接口说明：根据《股票列表》得到的股票代码作为参数，得到每分钟主力资金走势，按时间倒序。
数据更新：每天20:00开始更新（更新耗时约4小时）
请求频率：1分钟20次
返回格式：标准Json格式      [{},...{}]
字段名称	数据类型	字段说明
t	string	时间yyyy-MM-dd HH:mm:ss
zdf	number	涨跌幅(%)
lrzj	number	主力流入(元)
lrl	number	主力流入率(%)
lczj	number	主力流出(元)
jlr	number	主力净流入(元)
jlrl	number	主力净流入率(%)
shlrl	number	散户流入率(%)
*/
class MainFundsPage extends StatelessWidget {
  final List<MainFundsModel> mFList;
  const MainFundsPage({Key? key, required this.mFList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 10, color: Colors.white);
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: Text("时间", style: style)),
            Expanded(flex: 1, child: Text('涨跌幅(%)', style: style)),
            Expanded(flex: 1, child: Text('主力流入(元)', style: style)),
            Expanded(flex: 1, child: Text('主力流入率(%)', style: style)),
            Expanded(flex: 1, child: Text('主力流出(元)', style: style)),
            Expanded(flex: 1, child: Text('主力净流入(元)', style: style)),
            Expanded(flex: 1, child: Text('主力净流入率(%)', style: style)),
            Expanded(flex: 1, child: Text('散户流入率(%)', style: style)),
          ],
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                  itemCount: mFList.length,
                  itemBuilder: (_, index) {
                    MainFundsModel e = mFList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Text(e.t.substring(0,16), style: style)),
                        Expanded(flex: 1, child: Text(e.zdf, style: style)),
                        Expanded(flex: 1, child: Text(tranlation(e.lrzj), style: style)),
                        Expanded(flex: 1, child: Text(e.lrl, style: style)),
                        Expanded(flex: 1, child: Text(tranlation(e.lczj), style: style)),
                        Expanded(flex: 1, child: Text(tranlation(e.jlr), style: style)),
                        Expanded(flex: 1, child: Text(e.jlrl, style: style)),
                        Expanded(flex: 1, child: Text(e.shlrl, style: style)),
                      ],
                    );
                  })),
        ),
      ],
    );
  }
}
