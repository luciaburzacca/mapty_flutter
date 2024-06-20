import 'package:flutter/material.dart';
import 'locale_home.dart';
import 'locale_new.dart';
import 'locale_profile.dart';
import 'package:flutter/material.dart';

class LocaliActivity extends StatefulWidget {
  @override
  _LocaliActivityState createState() => _LocaliActivityState();
}

class _LocaliActivityState extends State<LocaliActivity> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    LocaleHome(),
    LocaleNew(),
    LocaleProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.purple,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}

