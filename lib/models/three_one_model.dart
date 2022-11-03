class RealTimeTradeModel {
  late String _fm;
  late String _h;
  late String _hs;
  late String _lb;
  late String _l;
  late String _lt;
  late String _o;
  late String _pe;
  late String _pc;
  late String _p;
  late String _sz;
  late String _cje;
  late String _ud;
  late String _v;
  late String _yc;
  late String _zf;
  late String _zs;
  late String _sjl;
  late String _zdf60;
  late String _zdfnc;
  late String _t;

  RealTimeTradeModel(
      {required String fm,
      required String h,
      required String hs,
      required String lb,
      required String l,
      required String lt,
      required String o,
      required String pe,
      required String pc,
      required String p,
      required String sz,
      required String cje,
      required String ud,
      required String v,
      required String yc,
      required String zf,
      required String zs,
      required String sjl,
      required String zdf60,
      required String zdfnc,
      required String t}) {
    _fm = fm;
    _h = h;
    _hs = hs;
    _lb = lb;
    _l = l;
    _lt = lt;
    _o = o;
    _pe = pe;
    _pc = pc;
    _p = p;
    _sz = sz;
    _cje = cje;
    _ud = ud;
    _v = v;
    _yc = yc;
    _zf = zf;
    _zs = zs;
    _sjl = sjl;
    _zdf60 = zdf60;
    _zdfnc = zdfnc;
    _t = t;
  }

  String get fm => _fm;
  String get h => _h;
  String get hs => _hs;
  String get lb => _lb;
  String get l => _l;
  String get lt => _lt;
  String get o => _o;
  String get pe => _pe;
  String get pc => _pc;
  String get p => _p;
  String get sz => _sz;
  String get cje => _cje;
  String get ud => _ud;
  String get v => _v;
  String get yc => _yc;
  String get zf => _zf;
  String get zs => _zs;
  String get sjl => _sjl;
  String get zdf60 => _zdf60;
  String get zdfnc => _zdfnc;
  String get t => _t;

  RealTimeTradeModel.fromJson(Map<String, dynamic> json) {
    _fm = json['fm'] ?? '';
    _h = json['h'] ?? '';
    _hs = json['hs'] ?? '';
    _lb = json['lb'] ?? '';
    _l = json['l'] ?? '';
    _lt = json['lt'] ?? '';
    _o = json['o'] ?? '';
    _pe = json['pe'] ?? '';
    _pc = json['pc'] ?? '';
    _p = json['p'] ?? '';
    _sz = json['sz'] ?? '';
    _cje = json['cje'] ?? '';
    _ud = json['ud'] ?? '';
    _v = json['v'] ?? '';
    _yc = json['yc'] ?? '';
    _zf = json['zf'] ?? '';
    _zs = json['zs'] ?? '';
    _sjl = json['sjl'] ?? '';
    _zdf60 = json['zdf60'] ?? '';
    _zdfnc = json['zdfnc'] ?? '';
    _t = json['t'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fm'] = _fm;
    data['h'] = _h;
    data['hs'] = _hs;
    data['lb'] = _lb;
    data['l'] = _l;
    data['lt'] = _lt;
    data['o'] = _o;
    data['pe'] = _pe;
    data['pc'] = _pc;
    data['p'] = _p;
    data['sz'] = _sz;
    data['cje'] = _cje;
    data['ud'] = _ud;
    data['v'] = _v;
    data['yc'] = _yc;
    data['zf'] = _zf;
    data['zs'] = _zs;
    data['sjl'] = _sjl;
    data['zdf60'] = _zdf60;
    data['zdfnc'] = _zdfnc;
    data['t'] = _t;
    return data;
  }
}
