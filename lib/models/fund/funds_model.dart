class FModel {
  late List<FundsModel> fundsModel;

  FModel({required fundsModel});

  FModel.fromJson(List data) {
    fundsModel = <FundsModel>[];
    for (var v in data) {
      fundsModel.add(FundsModel.fromJson(v));
    }
  }
}

class FundsModel {
  late String t;
  late String zdf;
  late String hsl;
  late String jlr;
  late String jlrl;
  late String zljlr;
  late String zljlrl;
  late String hyjlr;
  late String hyjlrl;

  FundsModel(
      {required t,
      required zdf,
      required hsl,
      required jlr,
      required jlrl,
      required zljlr,
      required zljlrl,
      required hyjlr,
      required hyjlrl});

  FundsModel.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    zdf = json['zdf'];
    hsl = json['hsl'];
    jlr = json['jlr'];
    jlrl = json['jlrl'];
    zljlr = json['zljlr'];
    zljlrl = json['zljlrl'];
    hyjlr = json['hyjlr'];
    hyjlrl = json['hyjlrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['t'] = t;
    data['zdf'] = zdf;
    data['hsl'] = hsl;
    data['jlr'] = jlr;
    data['jlrl'] = jlrl;
    data['zljlr'] = zljlr;
    data['zljlrl'] = zljlrl;
    data['hyjlr'] = hyjlr;
    data['hyjlrl'] = hyjlrl;
    return data;
  }
}
