
import 'package:get/get.dart';

class TabIndexController extends GetxController {
  int _index = 0;
  get index => _index;
  setIndex(int index) {
    _index = index;
    update();
  }
}
