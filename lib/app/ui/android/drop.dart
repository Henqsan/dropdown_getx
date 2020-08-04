import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multilevel_dropdown_app/app/ui/widgets/bottom_navigation_bar.dart';

class DropPage extends StatefulWidget {
  @override
  _DropPageState createState() => _DropPageState();
}

class _DropPageState extends State<DropPage> {
  Future<void> _initForm;
  final _stateList = <StateModel>[];
  final _cityList = <City>[];

  StateModel selectedState;
  City selectedCity;

  @override
  void initState() {
    super.initState();
    _initForm = _initStateAsync();
  }

  Future<void> _initStateAsync() async {
    _stateList.clear();
    _stateList.addAll(await _fetchStateList());
  }

  Future<List<StateModel>> _fetchStateList() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      StateModel("1", "State1"),
      StateModel("2", "State2"),
    ];
  }

  Future<List<City>> _fetchCityList(String id) async {
    await Future.delayed(Duration(seconds: 2));
    if (id == "1")
      return [
        City("1", "City 1.1"),
        City("2", "City 1.2"),
      ];
    if (id == "2")
      return [
        City("3", "City 2.1"),
        City("4", "City 2.2"),
      ];
    return Iterable.empty();
  }

  void _onStateSelected(StateModel selectedState) async {
    try {
      _showLoadingDialog();
      final cityList = await _fetchCityList(selectedState.id);
      setState(() {
        this.selectedState = selectedState;
        selectedCity = null;
        _cityList.clear();
        _cityList.addAll(cityList);
      });
      Navigator.pop(context);
    } catch (e) {
      //TODO: handle error
      rethrow;
    }
  }

  void _onCitySelected(City selectedCity) {
    setState(() {
      this.selectedCity = selectedCity;
    });
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: CupertinoActivityIndicator(animating: true),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropdownButtonFormField'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: FutureBuilder<void>(
            future: _initForm,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return _buildLoading();
              else if (snapshot.hasError)
                return _buildError(snapshot.error);
              else
                return _buildBody();
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(initialSelected: 1).showBottomNavigation(),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoActivityIndicator(animating: true),
          SizedBox(height: 10.0),
          Text("Initilizing Form Data"),
        ],
      ),
    );
  }

  Widget _buildError(dynamic error) {
    return Center(
      child: Text("Error occured: $error"),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DropdownButtonFormField<StateModel>(
          items: _stateList
              .map((itm) => DropdownMenuItem(
                    child: Text(itm.name),
                    value: itm,
                  ))
              .toList(),
          value: selectedState,
          onChanged: _onStateSelected,
        ),
        DropdownButtonFormField<City>(
          items: _cityList
              .map((itm) => DropdownMenuItem(
                    child: Text(itm.name),
                    value: itm,
                  ))
              .toList(),
          value: selectedCity,
          onChanged: _onCitySelected,
        ),
      ],
    );
  }
}

class StateModel {
  final String id;
  final String name;

  StateModel(this.id, this.name);
}

class City {
  final String id;
  final String name;

  City(this.id, this.name);
}
