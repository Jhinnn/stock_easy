import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

class DioFactory {
  static Future<String> getHtml(
      {String baseUrl = '',
      String param = '',
      String startStr = '',
      String endStr = ''}) async {
    var dio = Dio();

    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 60000; //5s
    dio.options.receiveTimeout = 60000;

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback = (cert, host, port) {
        return true; // 返回true强制通过
      };
    };
    try {
      Response response = await dio.get(param);
      String responseStr = response.data.toString();
      int startIndex = responseStr.indexOf(startStr);
      int endIndex = responseStr.indexOf(endStr);
      String realString = responseStr.substring(startIndex, endIndex);
      return realString;
    } catch (e) {
      return '';
    }
  }
}
