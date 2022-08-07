import 'package:fahrenheit/manger/orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notifaication.dart';

class Mangerhome extends StatefulWidget {
  @override
  State<Mangerhome> createState() => _MangerhomeState();
}

class _MangerhomeState extends State<Mangerhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.blue,width: 2)),
            margin: EdgeInsets.only(top: 50, left: 70, right: 70),
            child: RaisedButton(
              color: Colors.white38,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Notif()));
              },
              child: Column(
                children: [
                  Container(child:
                    Image.asset('assets/n2.png',fit: BoxFit.cover,)
                    ,),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: const Text(
                        'Notifaication',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      )),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.blue,width: 2)),
            margin: EdgeInsets.only(top: 50, left: 70, right: 70),
            child: RaisedButton(
              color: Colors.white38,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Orders()));
              },
              child: Column(
                children: [
                  Container(child:
                  Image.asset('assets/n1.png',fit: BoxFit.cover,)
                    ,),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: const Text(
                        'Orders',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      )),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.blue,width: 2)),
            margin: EdgeInsets.only(top: 50, left: 70, right: 70,bottom: 100),
            child: RaisedButton(
              color: Colors.white38,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Notif()));
              },
              child: Column(
                children: [
                  Container(child:
                  Image.asset('assets/n.jpg',fit: BoxFit.cover,)
                    ,),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Users',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
