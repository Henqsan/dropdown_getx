import 'package:multilevel_dropdown_app/app/data/providers/state_provider.dart';

class StateRepository {
  final _stateProvider = StateProvider();

  fetchStateList() async {
    return _stateProvider.fetchStateList();
  }
}
