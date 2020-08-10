import 'package:get/get.dart';
import 'package:multilevel_dropdown_app/app/ui/android/home_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => HomePage(),
    ),
  ];
}