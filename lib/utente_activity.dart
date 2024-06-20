import 'package:flutter/material.dart';
import 'utente_home.dart';
import 'utente_wishlist.dart';
import 'utente_profile.dart';

class UtenteActivity extends StatefulWidget {
  @override
  _UtenteActivityState createState() => _UtenteActivityState();
}

class _UtenteActivityState extends State<UtenteActivity> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    UtenteHome(),
    UtenteWishlist(),
    UtenteProfile(),
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
            icon: Icon(Icons.favorite),
            label: 'Favorite',
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
