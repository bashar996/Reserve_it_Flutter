import 'package:flutter/material.dart';
import 'package:reserve_it/hotel_app_theme.dart';
import 'package:reserve_it/services/auth.dart';
import 'package:reserve_it/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  //text field state
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Theme(
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
                backgroundColor: Colors.white,
                title: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
              body: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Image.asset(
                        'assets/images/hotel/log.jpg',
                        height: 80,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration:
                            inputDecoration().copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an Email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration:
                            inputDecoration().copyWith(hintText: 'Password'),
                        validator: (val) => val.length < 6
                            ? 'the password is less thn 5 characters'
                            : null,
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
                          dynamic result =
                              _auth.signInWithEmailAndPassword(email, password);
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            if (result == null) {
                              setState(() {
                                error = 'Worng credentials';
                                loading = false;
                              });
                            }
                          }
                        },
                        color: Colors.purple[600],
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 16.0),
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

InputDecoration inputDecoration() {
  return InputDecoration(
    fillColor: Colors.grey[200],
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[400], width: 0.5),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.purple[600], width: 0.5),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
  );
}
