import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notif extends StatefulWidget {
  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  var serverToken =
      'AAAAyXgqUSc:APA91bHllP2Y9RTDu-br6wJq5sBYQvtIMbDjn-gpO3tDf-QyhO2n7AwFb9ZatuiipAhT9ONf2LZpYv60TGbpY_G2mdvAOfNKSFjl_K4UOHmcrqcNvVbm18JAlZHWu3CRb-vnYdzZp8LZ';

  send(String title, String body, String id) async {
    await http.post(
      Uri.parse(
        'https://fcm.googleapis.com/fcm/send',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{'body': n2.text, 'title': n1.text},
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': '/topics/yehya'
        },
      ),
    );
  }

  get() async {
    FirebaseMessaging.onMessage.listen((event) {
      print(event.notification!.title);
      print(event.notification!.body);
    });
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50, top: 50),
            child: TextField(
              controller: n1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: 'Send Notification title',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50, top: 50),
            child: TextField(
              controller: n2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: 'Send Notification body',
              ),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 60, left: 120, right: 120),
            child: RaisedButton(
              color: Colors.blue[600],
              onPressed: () {
                send('ahmed', 'yejhya', '12');
              },
              child: const Text(
                'Send',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
// RaisedButton(
// onPressed: () async {
// await FirebaseMessaging.instance.subscribeToTopic('yehya');
// },
// child: Text('Topic all '),
// ),
// RaisedButton(
// onPressed: () async {
// await FirebaseMessaging.instance.unsubscribeFromTopic('yehya');
// },
// child: Text('unTopic all '),
// )
