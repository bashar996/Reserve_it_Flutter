import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reserve_it/hotel_app_theme.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Icon(
                            Icons.person,
                            color: Colors.grey[500],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Language',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.assignment,
                            color: Colors.grey[500],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payments',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Icon(
                            Icons.account_balance_wallet,
                            color: Colors.grey[500],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Help',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Icon(
                            Icons.help,
                            color: Colors.grey[500],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
