import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 50,
          ),
          CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage('assets/images/pv.jpg'),
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'My Name is',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '''Description''',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
