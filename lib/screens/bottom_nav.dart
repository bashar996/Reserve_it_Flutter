import 'package:flutter/material.dart';
import 'package:reserve_it/screens/favorites.dart';
import 'package:reserve_it/screens/home/home.dart';
import 'package:reserve_it/screens/settings.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _currIndex = 0;
  final List<Widget> _children = [HotelHomeScreen(), Favorites(), Settings()];
  void onItemTap(int index) {
    setState(() {
      _currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTap,
        currentIndex: _currIndex,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), title: Text("Favorites")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings")),
        ],
      ),
    );
  }
}
