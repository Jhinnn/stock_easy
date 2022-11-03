class MFModel {
  late List<MainFundsModel> mainFundsModel;

  MFModel({required this.mainFundsModel});

  MFModel.fromJson(List data) {
    mainFundsModel = <MainFundsModel>[];
      for (var v in data) {
        mainFundsModel.add(MainFundsModel.fromJson(v));
      }
  }
}

class MainFundsModel {
  late String t;
  late String zdf;
  late String lrzj;
  late String lrl;
  late String lczj;
  late String jlr;
  late String jlrl;
  late String shlrl;

  MainFundsModel(
      {required t,
      required zdf,
      required lrzj,
      required lrl,
      required lczj,
      required jlr,
      required jlrl,
      required shlrl});

  MainFundsModel.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    zdf = json['zdf'];
    lrzj = json['lrzj'];
    lrl = json['lrl'];
    lczj = json['lczj'];
    jlr = json['jlr'];
    jlrl = json['jlrl'];
    shlrl = json['shlrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['t'] = t;
    data['zdf'] = zdf;
    data['lrzj'] = lrzj;
    data['lrl'] = lrl;
    data['lczj'] = lczj;
    data['jlr'] = jlr;
    data['jlrl'] = jlrl;
    data['shlrl'] = shlrl;
    return data;
  }
}
