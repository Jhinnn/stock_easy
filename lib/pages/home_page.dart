import 'package:stock_easy/controller/tab_controller.dart';
import 'package:stock_easy/db/db_helper.dart';
import 'package:stock_easy/lib/const.dart';
import 'package:stock_easy/models/fund/funds_model.dart';
import 'package:stock_easy/models/histroy_model.dart';
import 'package:stock_easy/models/main_funds_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stock_easy/pages/fouds/funds_flow_into_page.dart';
import 'package:stock_easy/pages/fouds/histroy_funds_page.dart';
import 'package:stock_easy/pages/fouds/main_funds_page.dart';
import 'package:stock_easy/pages/line_chart/histroy_funds_line_chart_page.dart';
import 'package:stock_easy/request/api.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MainFundsModel> mfList = [];
  List<FundsModel> mfiList = [];
  List<HistroyModel> histroyList = [];

  int _index = 0;
  @override
  void initState() {
    // TODO: implement initState

    getStockData();
  }

  getStockData() async {
    // await getMFData();
    // await getFData();
    await getHistroyData();
    setState(() {});
  }

  getMFData() async {
    MFModel mfModel = await Api.fetchMainFundsData(CodeString.sanyiString);
    mfList = mfModel.mainFundsModel;
  }

  getFData() async {
    FModel mfModel = await Api.fetchFundsData(CodeString.sanyiString);
    mfiList = mfModel.fundsModel;
  }

  getHistroyData() async {
    //判断数据库是否是最新的
    List<HistroyModel> dbHistroyModelList =
        await DbHelper.instance.histroyFundsTable.query();
    HistroyModel histroyModel = dbHistroyModelList.first;
    DateTime dateTime = DateTime.parse(histroyModel.t);
    Duration duration = DateTime.now().difference(dateTime);
    if (duration.inDays >= 2) {
      print('需要更新最新数据');
      HisModel mfModel = await Api.fetchHistroyData(CodeString.sanyiString);
      insertIntoTable(mfModel.histroyModel);
    } else {
      print('无需更新最新数据');
      histroyList = dbHistroyModelList;
      setState(() {});
    }
  }

  insertIntoTable(List<HistroyModel> histroyList) async {
    for (HistroyModel histroyModel in histroyList) {
      await DbHelper.instance.histroyFundsTable.insertData(histroyModel);
    }
    histroyList = await DbHelper.instance.histroyFundsTable.query();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: ToggleSwitch(
            minHeight: 30,
            minWidth: 60,
            fontSize: 14.0,
            initialLabelIndex: _index,
            activeBgColor: const [Colors.green],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.grey[900],
            totalSwitches: 2,
            labels: const ['Chart', 'Data'],
            onToggle: (index) {
              setState(() {
                _index = index!;
              });
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IndexedStack(
            index: _index,
            children: [
              histroyList.isNotEmpty
                  ? HistroyFundsLineChartPage(
                      histroyList: histroyList,
                    )
                  : Container(),
              Row(
                children: [
                  const MenuWidget(),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: ContentWidget(
                    mFList: mfList,
                    mfiList: mfiList,
                    histroyList: histroyList,
                  ))
                ],
              )
            ],
          ),
        ));
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 10);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () {
              Get.find<TabIndexController>().setIndex(0);
            },
            child: Text('主力资金走势', style: textStyle)),
        TextButton(
            onPressed: () {
              Get.find<TabIndexController>().setIndex(1);
            },
            child: Text('资金流入趋势', style: textStyle)),
        TextButton(
            onPressed: () {
              Get.find<TabIndexController>().setIndex(2);
            },
            child: Text('历史成交分布', style: textStyle))
      ],
    );
  }
}

class ContentWidget extends StatelessWidget {
  final List<MainFundsModel> mFList;
  final List<FundsModel> mfiList;
  final List<HistroyModel> histroyList;

  const ContentWidget(
      {Key? key,
      required this.mFList,
      required this.mfiList,
      required this.histroyList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TabIndexController(),
        builder: (logic) {
          return IndexedStack(
            index: logic.index,
            children: [
              MainFundsPage(mFList: mFList),
              FundsFlowIntoPage(mFList: mfiList),
              HistroyFundsPage(histroyList: histroyList),
            ],
          );
        });
  }
}
