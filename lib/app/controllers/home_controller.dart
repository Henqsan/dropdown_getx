import 'package:get/get.dart';

class HomeController extends GetxController {
  var state = ''.obs;
  var city = ''.obs;

  changeState(state) {
    this.state = state;
    update();
  }

  changeCity(city) {
    this.city = city;
    update();
  }
}