import 'package:multilevel_dropdown_app/app/data/models/city_model.dart';

class CityProvider {

  Future<List<CityModel>> fetchCityList(String id) async {
    await Future.delayed(Duration(seconds: 1));
    if (id == "1")
      return [
        CityModel("1", "São Paulo"),
        CityModel("2", "Campinas"),
        CityModel("3", "Ribeirão Preto"),
      ];
    if (id == "2")
      return [
        CityModel("4", "Rio de Janeiro"),
        CityModel("5", "Saquarema"),
        CityModel("6", "Maricá"),
      ];
    if (id == "3")
      return [
        CityModel("7", "Minas Gerais"),
        CityModel("8", "Ouro Preto"),
        CityModel("9", "Poços de Caldas"),
      ];
    return Iterable.empty();
  }
}