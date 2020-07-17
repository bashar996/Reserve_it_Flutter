import 'package:flutter/material.dart';
import 'package:reserve_it/screens/favorites.dart';
import 'package:reserve_it/screens/home/home.dart';
import 'package:reserve_it/screens/settings.dart';

class myBottomNavBar extends StatefulWidget {
  @override
  _myBottomNavBarState createState() => _myBottomNavBarState();
}

class _myBottomNavBarState extends State<myBottomNavBar> {
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
