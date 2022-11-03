class HisModel {
  late List<HistroyModel> histroyModel;

  HisModel({required histroyModel});

  HisModel.fromJson(List data) {
    histroyModel = <HistroyModel>[];
    for (var v in data) {
      histroyModel.add(HistroyModel.fromJson(v));
    }
  }
}

class HistroyModel {
  late String t;
  late String c;
  late String zdf;
  late String jlrl;
  late String hsl;
  late String qbjlr;
  late String cddlr;
  late String cddjlr;
  late String ddlr;
  late String ddjlr;
  late String xdlr;
  late String xdjlr;
  late String sdlr;
  late String sdjlr;

  HistroyModel(
      {required t,
      required c,
      required zdf,
      required jlrl,
      required hsl,
      required qbjlr,
      required cddlr,
      required cddjlr,
      required ddlr,
      required ddjlr,
      required xdlr,
      required xdjlr,
      required sdlr,
      required sdjlr});

  HistroyModel.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    c = json['c'];
    zdf = json['zdf'];
    jlrl = json['jlrl'];
    hsl = json['hsl'];
    qbjlr = json['qbjlr'];
    cddlr = json['cddlr'];
    cddjlr = json['cddjlr'];
    ddlr = json['ddlr'];
    ddjlr = json['ddjlr'];
    xdlr = json['xdlr'];
    xdjlr = json['xdjlr'];
    sdlr = json['sdlr'];
    sdjlr = json['sdjlr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['t'] = t;
    data['c'] = c;
    data['zdf'] = zdf;
    data['jlrl'] = jlrl;
    data['hsl'] = hsl;
    data['qbjlr'] = qbjlr;
    data['cddlr'] = cddlr;
    data['cddjlr'] = cddjlr;
    data['ddlr'] = ddlr;
    data['ddjlr'] = ddjlr;
    data['xdlr'] = xdlr;
    data['xdjlr'] = xdjlr;
    data['sdlr'] = sdlr;
    data['sdjlr'] = sdjlr;
    return data;
  }
}
