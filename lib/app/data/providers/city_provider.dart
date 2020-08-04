import 'package:multilevel_dropdown_app/app/data/models/city_model.dart';

class CityProvider {

  Future<List<CityModel>> fetchCityList(String id) async {
    await Future.delayed(Duration(seconds: 1));
    if (id == "1")
      return [
        CityModel("1", "Campinas"),
        CityModel("2", "Ribeirão Preto"),
      ];
    if (id == "2")
      return [
        CityModel("3", "Saquarema"),
        CityModel("4", "Maricá"),
      ];
    if (id == "3")
      return [
        CityModel("5", "Ouro Preto"),
        CityModel("6", "Poços de Caldas"),
      ];
    return Iterable.empty();
  }
}