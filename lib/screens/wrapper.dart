import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserve_it/screens/authenticate/authenticate.dart';
import 'package:reserve_it/screens/bottom_nav.dart';
import 'package:reserve_it/screens/home/home.dart';
import "package:reserve_it/models/user.dart";
import 'package:reserve_it/screens/landing.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either HotelHomeScreen or authenticate widget
    if (user == null) {
      return Landing();
    } else {
      return myBottomNavBar();
    }
  }
}
