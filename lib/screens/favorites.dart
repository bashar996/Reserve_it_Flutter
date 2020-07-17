import 'package:flutter/material.dart';
import 'package:reserve_it/hotel_app_theme.dart';
import 'package:reserve_it/hotel_list_view.dart';
import 'package:reserve_it/models/hotel_list_data.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text(
            'Favorites',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Center(child: Image.asset('assets/images/empty.jpg')),
            ),
            Text(
              'You didnt favorite any hotels yet',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
