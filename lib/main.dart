import 'package:flutter/material.dart';
import 'package:reserve_it/screens/authenticate/authenticate.dart';
import 'package:reserve_it/screens/authenticate/sign_in.dart';
import 'package:reserve_it/screens/home/home.dart';
import 'package:reserve_it/screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authenticate(),
    );
  }
}
