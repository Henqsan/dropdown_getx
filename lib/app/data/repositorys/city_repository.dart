import 'package:multilevel_dropdown_app/app/data/providers/city_provider.dart';

class CityRepository {
  final _cityProvider = CityProvider();

  fetchCityList(idState) {
    return _cityProvider.fetchCityList(idState);
  }
}