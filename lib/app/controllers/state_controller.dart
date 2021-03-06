import 'package:get/get.dart';
import 'package:multilevel_dropdown_app/app/data/models/state_model.dart';
import 'package:multilevel_dropdown_app/app/data/repositorys/state_repository.dart';

class StateController extends GetxController {
  final _stateRepository = StateRepository();

  var stateList = <StateModel>[].obs;
  var loading = false.obs;

  @override
  void onInit() => this.fetchStates();

  fetchStates() async {
    stateList.clear();
    stateList.addAll(await _stateRepository.fetchStateList());
    print('Total de estados: ' + stateList.length.toString());
    loading.value = false;
    update();
  }

}