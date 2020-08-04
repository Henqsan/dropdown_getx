import 'package:get/get.dart';
import 'package:multilevel_dropdown_app/app/data/models/city_model.dart';
import 'package:multilevel_dropdown_app/app/data/repositorys/city_repository.dart';

class CityController extends GetxController {
  final _cityRepository = CityRepository();

  var cityList = <CityModel>[].obs ?? null;
  var loading = false.obs;

  fetchCity(state) async {
    this.cityList.addAll(await this._cityRepository.fetchCityList(state.id));
    print('Total de cidades: ' + this.cityList.length.toString());
    update(['city']);
  }

  void clearCityList() {
    this.cityList.clear();
    update(['city']);
  }
}