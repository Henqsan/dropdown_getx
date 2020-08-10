import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomNavigation{
  int initialSelected;
  BottomNavigation({@required this.initialSelected});

  showBottomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.adjust),
          title: Text('This Project'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('GetX'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('GetX Snippets'),
        ),
      ],
      currentIndex: this.initialSelected,
      selectedItemColor: Colors.indigoAccent,
      onTap: (index) {
        switch(index) {
          case 0:
            launch('https://github.com/Henqsan/dropdown_getx');
            break;
          case 1:
            launch('https://pub.dev/packages/get');
            break;
          case 2:
            launch('https://marketplace.visualstudio.com/items?itemName=get-snippets.get-snippets');
            break;
        }
      },
    );
  }
}