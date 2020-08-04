import 'package:multilevel_dropdown_app/app/data/models/state_model.dart';

class StateProvider {

  Future<List<StateModel>> fetchStateList() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      StateModel("1", "Estado de São Paulo"),
      StateModel("2", "Estado do Rio de Janeiro"),
      StateModel("3", "Estado de Minas Gerais"),
    ];
  }

}