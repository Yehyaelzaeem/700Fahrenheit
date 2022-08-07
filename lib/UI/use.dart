import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../classs/user.dart';
import 'profile.dart';

class Use extends StatefulWidget {
  @override
  State<Use> createState() => _UseState();
}

class _UseState extends State<Use> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.lightBlueAccent,
            height: 300,
            child: Image.asset(
              'assets/ddd.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 20),
            child: RichText(
              text: const TextSpan(
                  text: 'Name :  ',
                  style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                  children: [
                    TextSpan(
                      text: 'Yehya mohamed',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    )
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 20),
            child: RichText(
              text: const TextSpan(
                  text: 'Username :  ',
                  style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                  children: [
                    TextSpan(
                      text: 'Yehyamohamed@gmail.com',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    )
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 20),
            child: RichText(
              text: const TextSpan(
                  text: 'Mobile_Phone :  ',
                  style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                  children: [
                    TextSpan(
                      text: '01027362572',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    )
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 20),
            child: RichText(
              text: const TextSpan(
                  text: 'Address :  ',
                  style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                  children: [
                    TextSpan(
                      text: 'nasr city',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    )
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 20),
            child: RichText(
              text: const TextSpan(
                  text: 'ID :  ',
                  style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                  children: [
                    TextSpan(
                      text: '5',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
