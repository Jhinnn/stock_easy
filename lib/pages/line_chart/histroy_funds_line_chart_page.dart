import 'package:stock_easy/models/histroy_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HistroyFundsLineChartPage extends StatefulWidget {
  final List<HistroyModel> histroyList;
  const HistroyFundsLineChartPage({Key? key, required this.histroyList})
      : super(key: key);

  @override
  State<HistroyFundsLineChartPage> createState() =>
      _HistroyFundsLineChartPageState();
}

class _HistroyFundsLineChartPageState extends State<HistroyFundsLineChartPage> {
  List<LineChartBarData> lineBarsData = [];
  List<FlSpot> listFlSpot = [];
  late FlTitlesData flTitlesData;
  int _index = 2;
  double _bottomInterval = 10;
  @override
  void initState() {
    super.initState();

    getHistroyData(100);
  }

  getHistroyData(int days) async {
    listFlSpot.clear();
    lineBarsData.clear();
    int i = days;

    for (HistroyModel element in widget.histroyList) {
      if (i >= 1) {
        i--;
        DateTime dateTime = DateTime.parse(element.t);
        double dateTimeDouble = dateTime.millisecondsSinceEpoch / 100000;
        print('$i $dateTimeDouble ${DateTime.now()}');
        listFlSpot.add(FlSpot(dateTimeDouble, double.parse(element.c)));
      }
    }
    listFlSpot = listFlSpot.reversed.toList();
    lineBarsData.add(LineChartBarData(
        isCurved: true,
        color: Colors.black,
        barWidth: 0.5,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: listFlSpot));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: LineChart(
              LineChartData(
                  lineBarsData: lineBarsData,
                  lineTouchData: LineTouchData(
                      handleBuiltInTouches: true,
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Colors.white,
                        // tooltipRoundedRadius: 30
                        // tooltipBorder:
                        //     BorderSide(color: Colors.red, width: 2),
                        // tooltipPadding: EdgeInsets.all(4),
                        // tooltipMargin: 2,
                        // maxContentWidth: 40,
                      )),
                  // gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text('data'),
                      sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 1,
                          interval: 10,
                          getTitlesWidget: (value, meta) {
                            double val = value * 100000;
                            DateTime dateTime =
                                DateTime.fromMillisecondsSinceEpoch(
                                    val.toInt());
                            String dateTimeStr =
                                dateTime.toString().substring(0, 10);
                           print('$dateTimeStr ${DateTime.now()}');
                            const style = TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );

                            return Text(
                              dateTimeStr,
                              style: style,
                            );
                          }),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  )),
            ),
          ),
        ),
        ToggleSwitch(
          minHeight: 28,
          minWidth: 60,
          fontSize: 14.0,
          initialLabelIndex: _index,
          activeBgColor: const [Colors.green],
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.grey,
          inactiveFgColor: Colors.grey[900],
          totalSwitches: 5,
          labels: const ['10', '30', '100', '1000', '全部'],
          onToggle: (index) {
            if (index! == 0) {
              getHistroyData(10);
              _bottomInterval = 1;
            } else if (index == 1) {
              getHistroyData(30);
              _bottomInterval = 3;
            } else if (index == 2) {
              getHistroyData(100);
              _bottomInterval = 10;
            } else if (index == 3) {
              getHistroyData(1000);
              _bottomInterval = 100;
            } else {
              getHistroyData(widget.histroyList.length);
              _bottomInterval = 300;
            }
            setState(() {
              _index = index;
            });
          },
        )
      ],
    );
  }
}
