import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation{
  int initialSelected;
  BottomNavigation({@required this.initialSelected});

  showBottomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Dashboard'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('DropSetState'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.adjust),
          title: Text('DropGetX'),
        ),
      ],
      currentIndex: this.initialSelected,
      selectedItemColor: Colors.indigoAccent,
      onTap: (index) {
        switch(index) {
          case 0:
            Get.offNamed('/');
            break;
          case 1:
            Get.offNamed('/drop');
            break;
          case 2:
            Get.offNamed('/drop-get');
            break;
        }
      },
    );
  }
}