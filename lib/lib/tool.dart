
String tranlation(String value) {
  double doubleValue = double.parse(value);
  if (doubleValue < 0) {
    String string = double.parse(value).toStringAsFixed(0);
    if (string.length > 9) {
      return '${(double.parse(value) / 100000000).toStringAsFixed(2)}亿';
    } else if (string.length >= 5 && string.length <= 9) {
      return '${(double.parse(value) / 10000).toStringAsFixed(2)}万';
    }
    return string;
  } else {
    String string = double.parse(value).toStringAsFixed(0);
    if (string.length >= 9) {
      return '${(double.parse(value) / 100000000).toStringAsFixed(2)}亿';
    } else if (string.length >= 5 && string.length < 9) {
      return '${(double.parse(value) / 10000).toStringAsFixed(2)}万';
    }
    return string;
  }
}