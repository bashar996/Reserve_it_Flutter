import 'package:flutter/material.dart';
import 'package:reserve_it/hotel_app_theme.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:reserve_it/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Sign in',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: RaisedButton(
            onPressed: signIn,
            child: Text(
              'Sign in anon',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    dynamic result = await _auth.signInAnon();
    if (result == null) {
      print('error signin in');
    } else {
      print('signed in');
      print(result);
    }
  }
}
