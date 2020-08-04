import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multilevel_dropdown_app/app/routes/app_routes.dart';
import 'package:multilevel_dropdown_app/app/ui/theme/app_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: appThemeData,
      getPages: AppRoutes.routes,
    ),
  );
}
