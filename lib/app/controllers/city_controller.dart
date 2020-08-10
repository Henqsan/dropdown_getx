import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multilevel_dropdown_app/app/data/models/city_model.dart';
import 'package:multilevel_dropdown_app/app/data/repositorys/city_repository.dart';
import 'package:multilevel_dropdown_app/app/ui/widgets/show_loading_dialog.dart';

class CityController extends GetxController {
  final _cityRepository = CityRepository();

  var cityList = <CityModel>[].obs;

  fetchCity(state) async {
    _showLoading();
    cityList.addAll(await this._cityRepository.fetchCityList(state.id));
    print('Total de cidades: ' + this.cityList.length.toString());
    Get.back();
    update(['city']);
  }

  void clearCityList() {
    this.cityList.clear();
    update(['city']);
  }

  _showLoading() {
    return ShowLoadingDialog(
        context: Get.context, willPop: false, circularIndicatorSize: 30)
        .showLoadingDialog();
  }
}