import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserve_it/screens/wrapper.dart';
import 'package:reserve_it/services/auth.dart';
import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
