import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multilevel_dropdown_app/app/controllers/city_controller.dart';
import 'package:multilevel_dropdown_app/app/controllers/home_controller.dart';
import 'package:multilevel_dropdown_app/app/controllers/state_controller.dart';
import 'package:multilevel_dropdown_app/app/data/models/city_model.dart';
import 'package:multilevel_dropdown_app/app/data/models/state_model.dart';
import 'package:multilevel_dropdown_app/app/ui/widgets/bottom_navigation_bar.dart';
import 'package:multilevel_dropdown_app/app/ui/widgets/build_loading.dart';

class HomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  HomeController _homeController = Get.put(HomeController());
  StateController _stateController = Get.put(StateController());
  CityController _cityController = Get.put(CityController());

  CityModel _selectedCity;
  StateModel _selectedState;

  @override
  Widget build(BuildContext context) {
    _stateController.loading.value = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown com GetX'),
      ),
      body: GetBuilder<StateController>(
        init: StateController(),
        builder: (_) {
          return _.loading.value
              ? BuildLoading(
                      text: 'Carregando dados...', circularIndicatorSize: 20)
                  .showLoading()
              : _body();
        },
      ),
      bottomNavigationBar:
          BottomNavigation(initialSelected: 0).showBottomNavigation(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/images/search.png',
              height: 150,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                GetBuilder<StateController>(
                  init: StateController(),
                  builder: (state) {
                    return DropdownButtonFormField<StateModel>(
                      validator: (value) {
                        if (value.isNull) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      items: state.stateList
                          .map(
                            (itm) => DropdownMenuItem(
                              value: itm,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.indigo[200],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    itm.name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      value: _selectedState,
                      onChanged: _onStateSelected,
                    );
                  },
                ),
                GetBuilder<CityController>(
                  id: 'city',
                  init: CityController(),
                  builder: (city) {
                    return FormField(
                      builder: (FormFieldState formFieldState) {
                        return DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return 'Campo obrigatório';
                            }
                            return null;
                          },
                          items: city.cityList
                              .map((itm) => DropdownMenuItem(
                                    value: itm,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.indigo[200],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          itm.name,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          value: _selectedCity,
                          onChanged: _onCitySelected,
                        );
                      },
                    );
                  },
                ),
                MaterialButton(
                  child: Text('Enviar'),
                  onPressed: () {
                    var valid = _formKey.currentState.validate();
                    if (valid) {
                      _homeController.state.value = _selectedState.name;
                      _homeController.city.value = _selectedCity.name;
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Obx(
                  () => Text(
                    (_homeController.state.string.isNotEmpty
                        ? 'Estado selecionado: ' + _homeController.state.string
                        : ''),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                      () => Text(
                    (_homeController.city.string.isNotEmpty
                        ? 'Cidade selecionada: ' + _homeController.city.string
                        : ''),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _onStateSelected(StateModel selectedState) {
    try {
      _selectedState = selectedState;
      _selectedCity = null;
      _cityController.clearCityList();
      _cityController.fetchCity(selectedState);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  void _onCitySelected(CityModel selectedCity) {
    this._selectedCity = selectedCity;
  }
}
