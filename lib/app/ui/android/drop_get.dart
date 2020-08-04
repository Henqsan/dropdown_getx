import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multilevel_dropdown_app/app/controllers/city_controller.dart';
import 'package:multilevel_dropdown_app/app/controllers/state_controller.dart';
import 'package:multilevel_dropdown_app/app/data/models/city_model.dart';
import 'package:multilevel_dropdown_app/app/data/models/state_model.dart';
import 'package:multilevel_dropdown_app/app/ui/widgets/bottom_navigation_bar.dart';
import 'package:multilevel_dropdown_app/app/ui/widgets/show_loading_dialog.dart';

class DropGetPage extends StatelessWidget {
  StateController stateController = Get.put(StateController());
  CityController cityController = Get.put(CityController());

  CityModel _selectedCity;
  StateModel _selectedState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dropdown com GetX'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              GetBuilder<StateController>(
                init: StateController(),
                builder: (state) {
                  return DropdownButtonFormField<StateModel>(
                    items: state.stateList
                        .map(
                          (itm) => DropdownMenuItem(
                            value: itm,
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.arrow_forward),
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
                builder: (city) => DropdownButtonFormField(
                  items: city.cityList
                      .map((itm) => DropdownMenuItem(
                            value: itm,
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.arrow_forward),
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
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            BottomNavigation(initialSelected: 2).showBottomNavigation());
  }

  _onStateSelected(StateModel selectedState) {
    try {
      this._selectedState = selectedState;
      this._selectedCity = null;
      this.cityController.clearCityList();
      this.cityController.fetchCity(selectedState);
      print('Estado selecionado: ' + selectedState.name);
    } catch (e) {
      //TODO: handle error
      rethrow;
    }
  }

  void _onCitySelected(CityModel selectedCity) {
    this._selectedCity = selectedCity;
    print('Cidade selecionada: ' + selectedCity.name);
  }

  _showLoading(context) {
    return ShowLoadingDialog(
        context: context, willPop: false, circularIndicatorSize: 30);
  }
}
