import 'package:flutter/material.dart';
import 'package:multilevel_dropdown_app/app/ui/widgets/bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME PAGE'),
      ),
      bottomNavigationBar: BottomNavigation(initialSelected: 0).showBottomNavigation(),
    );
  }
}
