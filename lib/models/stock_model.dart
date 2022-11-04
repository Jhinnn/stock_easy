class StockModel {
  late String name;
  late String code;

  StockModel({
    required name,
    required code,
  });

  StockModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['code'] = code;

    return data;
  }
}
