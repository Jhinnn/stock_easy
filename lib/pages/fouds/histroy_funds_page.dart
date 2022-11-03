import 'package:flutter/material.dart';
import 'package:stock_easy/lib/tool.dart';
import 'package:stock_easy/models/histroy_model.dart';
import 'package:stock_easy/pages/line_chart/histroy_funds_line_chart_page.dart';

/*
API接口：http://api.mairui.club/hsmy/lscj/股票代码(如000001)/您的licence
备用接口：http://api1.mairui.club/hsmy/lscj/股票代码(如000001)/您的licence
接口说明：根据《股票列表》得到的股票代码作为参数，得到近十年每天历史成交分布，按时间倒序。
数据更新：每天20:00开始更新（更新耗时约4小时）
请求频率：1分钟20次
返回格式：标准Json格式      [{},...{}]
字段名称	数据类型	字段说明
t	string	时间yyyy-MM-dd
c	number	收盘价(元)
zdf	number	涨跌幅(%)
jlrl	number	净流入率(%)
hsl	number	换手率(%)
qbjlr	number	全部净流入(元)
cddlr	number	超大单流入(元)
cddjlr	number	超大单净流入(元)
ddlr	number	大单流入(元)
ddjlr	number	大单净流入(元)
xdlr	number	小单流入(元)
xdjlr	number	小单净流入(元)
sdlr	number	散单流入(元)
sdjlr	number	散单净流入(元)
*/
class HistroyFundsPage extends StatelessWidget {
  final List<HistroyModel> histroyList;
  const HistroyFundsPage({Key? key, required this.histroyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 10, color: Colors.white);
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: Text('时间', style: style)),
            Expanded(flex: 1, child: Text('收盘价(元)', style: style)),
            Expanded(flex: 1, child: Text('涨跌幅(%)', style: style)),
            // Expanded(flex: 1, child: Text('净流入率(%)', style: style)),
            // Expanded(flex: 1, child: Text('换手率(%)', style: style)),
            Expanded(flex: 1, child: Text('全部净流入(元)', style: style)),
            // Expanded(flex: 1, child: Text('超大单流入(元)', style: style)),
            Expanded(flex: 1, child: Text('超大单净流入(元)', style: style)),
            // Expanded(flex: 1, child: Text('大单流入(元)', style: style)),
            Expanded(flex: 1, child: Text('大单净流入(元)', style: style)),
            // Expanded(flex: 1, child: Text('小单流入(元)', style: style)),
            Expanded(flex: 1, child: Text('小单净流入(元)', style: style)),
            // Expanded(flex: 1, child: Text('散单流入(元)', style: style)),
            Expanded(flex: 1, child: Text('散单净流入(元)', style: style)),
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: histroyList.length,
              itemBuilder: (_, index) {
                HistroyModel e = histroyList[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 1, child: Text(e.t, style: style)),
                    Expanded(flex: 1, child: Text(double.parse(e.c).toStringAsFixed(2), style: style)),
                    Expanded(flex: 1, child: Text(e.zdf, style: style)),
                    // Expanded(flex: 1, child: Text(e.jlrl, style: style)),
                    // Expanded(flex: 1, child: Text(e.hsl, style: style)),
                    Expanded(
                        flex: 1,
                        child: Text(tranlation(e.qbjlr), style: style)),
                    // Expanded(flex: 1, child: Text(e.cddlr, style: style)),
                    Expanded(
                        flex: 1,
                        child: Text(tranlation(e.cddjlr), style: style)),
                    // Expanded(flex: 1, child: Text(e.ddlr, style: style)),
                    Expanded(
                        flex: 1,
                        child: Text(tranlation(e.ddjlr), style: style)),
                    // Expanded(flex: 1, child: Text(e.xdlr, style: style)),
                    Expanded(
                        flex: 1,
                        child: Text(tranlation(e.xdjlr), style: style)),
                    // Expanded(flex: 1, child: Text(e.sdlr, style: style)),
                    Expanded(
                        flex: 1,
                        child: Text(tranlation(e.sdjlr), style: style)),
                  ],
                );
              }),
        ),
      ],
    );
  }
}

