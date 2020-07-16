import 'package:flutter/material.dart';
import 'package:reserve_it/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either HotelHomeScreen or authenticate widget
    return HotelHomeScreen();
  }
}
