import 'package:flutter/material.dart';
import 'package:reserve_it/hotel_app_theme.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:reserve_it/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  //text field state

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person_add),
                label: Text("Sign up")),
          ],
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
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                  color: Colors.purple[600],
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
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
