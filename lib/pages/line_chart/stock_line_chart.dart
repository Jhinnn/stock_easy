import 'package:stock_easy/models/histroy_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:toggle_switch/toggle_switch.dart';

class StockLinePage extends StatefulWidget {
  final List<HistroyModel> histroyList;
  const StockLinePage({Key? key, required this.histroyList}) : super(key: key);

  @override
  State<StockLinePage> createState() => _StockLinePageState();
}

class _StockLinePageState extends State<StockLinePage> {
  List<LineChartBarData> lineBarsData = [];
  List<FlSpot> listFlSpot = [];
  late FlTitlesData flTitlesData;
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
        listFlSpot.add(FlSpot(i.toDouble(), double.parse(element.c)));
      }
    }
    listFlSpot = listFlSpot.reversed.toList();
    lineBarsData.add(LineChartBarData(
        isCurved: false,
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
                      )),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 1,
                          interval: 20,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
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
      ],
    );
  }
}
