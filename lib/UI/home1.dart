import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fahrenheit/UI/request_order.dart';
import 'package:fahrenheit/classs/class.dart';
import 'package:fahrenheit/classs/collection.dart';
import 'package:fahrenheit/UI/login.dart';
import 'package:fahrenheit/UI/offers.dart';
import 'package:fahrenheit/UI/screen1.dart';
import 'package:fahrenheit/UI/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../cart/cart.dart';
import '../classs/user.dart';
import '../locale_controller.dart';
import 'detail.dart';
import '../manger/mangerhome.dart';
import '../manger/orders.dart';
import 'location.dart';
import 'myorders.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Home2 extends StatefulWidget {
  @override
  State<Home2> createState() => _Home2State();
}

//   Text Animation************************************
Widget animated() {
  return DefaultTextStyle(
    style: const TextStyle(
      fontSize: 20.0,
    ),
    child: AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText('700 Fahrenhiet',
            textStyle: const TextStyle(color: Colors.white,
                // fontWeight: FontWeight.bold,
                shadows: [BoxShadow(color: Colors.black26, blurRadius: 3)])),
      ],
      isRepeatingAnimation: true,
      onTap: () {
        print("Tap Event");
      },
    ),
  );
}
class _Home2State extends State<Home2> {


  bool e = false;
// Categories**********************************************
  Widget categories(String img, String nam) {
    return Container(
      margin: const EdgeInsets.only(right: 0, left: 10, top: 11, bottom: 10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 220,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(300.0)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black])),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Text(
                  nam,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Offer 12%',
                  style: TextStyle(fontSize: 10, color: Colors.yellow),
                ),
              ],
            ),
          )
        ],
      ),
      height: 20,
      width: 160,
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 15, color: Colors.white)],
          borderRadius: const BorderRadius.all(Radius.circular(300.0)),
          border: Border.all(color: Colors.white, width: 5)),
    );
  }
  bool sw = false;

// Recommended Meals *******************************************
  Widget Meals(
      String y1,
      String y2,
      String y3,
      String s1,
      String p1,
      String s2,
      String p2,
      String y6,
      ) {
    return FittedBox(
      child: Container(
          margin: const EdgeInsets.all(20),
          height: 190,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            border: Border.all(color: Colors.orange, width: 3),
            boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 12)],
          ),
          child: FittedBox(
            child: Row(
              children: [
                FittedBox(
                  child: Container(
                    height: 180,
                    width: 190,
                    margin: const EdgeInsets.only(top: 0, bottom: 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: y6.isEmpty || y6 == null
                            ? const Center(
                          child: Center(child: CircularProgressIndicator()),
                        )
                            : Image.network(
                          y6,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                FittedBox(
                  child: Container(
                    width: 200,
                    height: 180,
                    margin: EdgeInsets.only(left: 05),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin:
                            const EdgeInsets.only(left: 0, top: 0, right: 0),
                            child: FittedBox(
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 0, top: 0, right: 10),
                                    child: FittedBox(
                                      child: Text(
                                        '${sw==false?'Pizza ':'بيتزا '}' + y1,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            shadows: [
                                              BoxShadow(
                                                  color: Colors.orange,
                                                  blurRadius: 1)
                                            ]),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    margin: const EdgeInsets.only(right: 45,left: 45, bottom: 0),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite_border,
                                          size: 25,
                                        )),
                                  )
                                ],
                              ),
                            )),
                        sw==false?Container(
                          margin: EdgeInsets.only(left: 0, top: 0, right: 80),
                          child: Text(
                            'Description : ',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                            maxLines: 1,
                          ),
                        ): Container(
                          margin: EdgeInsets.only(left: 80, top: 0, right: 5),
                          child: Text(
                            'الوصف : ',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          // width: 100,
                          margin:
                          const EdgeInsets.only(left: 10, top: 3, right: 10),
                          child: Text(
                            y2,
                            textAlign: TextAlign.left,
                            style:
                            const TextStyle(fontSize: 7, color: Colors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        sw==false?  Container(
                          margin:
                          const EdgeInsets.only(left: 0, top: 3, right: 80),
                          child: Text(
                            'Ingredients : ',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ):Container(
                          margin:
                          const EdgeInsets.only(left: 80, top: 3, right: 5),
                          child: Text(
                            'المكونات : ',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            width: 170,
                            margin:
                            const EdgeInsets.only(left: 10, top: 3, right: 10),
                            child: Text(
                              y3,
                              style: const TextStyle(
                                  fontSize: 7, color: Colors.black),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0, left: 10,right: 10, bottom: 0),
                          child: FittedBox(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 0, left: 0,right: 10),
                                  child: Text(
                                    '${sw == false?'Size :':'الحجم  :  '}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 0, left: 5,right: 5),
                                  child: Text(
                                    s1,
                                    style: const TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 1)
                                        ]),
                                  ),
                                ),
                                Container(
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                          EdgeInsets.only(top: 0, left: 10,right: 5),
                                          child: Text(
                                            "${sw==false? 'Price :':'السعر :'}",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                          EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            p1,
                                            style: const TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                shadows: [
                                                  BoxShadow(
                                                      color: Colors.black26,
                                                      blurRadius: 1)
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0, left: 10,right: 10, bottom: 10),
                          child: FittedBox(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 0, left: 0,right: 10),
                                  child: Text(
                                    '${sw==false?'Size :':'الحجم  :  '}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 0, left: 5,right: 5),
                                  child: Text(
                                    s2,
                                    style: const TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 1)
                                        ]),
                                  ),
                                ),
                                Container(
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                          EdgeInsets.only(top: 0, left: 12,right: 5),
                                          child:  Text(
                                            "${sw==false? 'Price :':'السعر :'}",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                          EdgeInsets.only(top: 0, left: 5),
                                          child: Text(
                                            p2,
                                            style: const TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                shadows: [
                                                  BoxShadow(
                                                      color: Colors.black26,
                                                      blurRadius: 1)
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  var fdm = FirebaseMessaging.instance;
  initialmessage() async {
    var x = await FirebaseMessaging.instance.getInitialMessage();
    if (x != null) {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  int r1 = 0;
  bool r = false;
  FirebaseAuth instance = FirebaseAuth.instance;
  late DatabaseHandler1 handler1;
  List a1 = [];
  String _name1 = '';
  String _email1 = '';
bool ar =false;
  @override
  void initState() {
    if("1".tr =="English"){
      setState(() {
        sw=true;
      });
    }
    else{
      setState(() {
        sw=false;
      });
    }
    instance.authStateChanges().listen((event) {
      print('niceeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      if (event == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        print('not found user');
      }
    });
    initialmessage();
    //get token
    // print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    // fdm.getToken().then((value) => {print(value)});
    // print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      if (event.notification?.body == 'New Order') {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Orders()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Offers()));
      }
    });
    FirebaseMessaging.onMessage.listen((event) {
      setState(() {
        r = true;
        r1++;
      });
    });

    this.handler1 = DatabaseHandler1();
    this.handler1.initializeDB().whenComplete(() async {
     //  await this.addUsers();
      setState(() {});
    });
    select(1);
    super.initState();
  }
  // Future<int> addUsers() async {
  //   User1 firstUser = User1(
  //       name: 'username', phone: 'phone', address: 'address', image: 'null', email: 'example@gmailcom');
  //   List<User1> listOfUsers = [firstUser];
  //   return await this.handler1.insertUser(listOfUsers);
  // }
  Future<void> select(int id) async {
    final db = await handler1.initializeDB();
    a1 = await db.query(
      'user2',
      where: "id == ${id}",
    );
    a1.forEach((element) {
      setState(() {
        _name1 = element['name'];
        _email1 = element['email'];
      });
    });
  }

  final ph = '01027362572';
  final ph_res = '01554846177';
  TextEditingController n10 = TextEditingController();
  bool _show = false;

  @override
  Widget build(BuildContext context) {
     MylocaleController controller = Get.put(MylocaleController());
    const String tolunch = "https://www.facebook.com/700Fahrenheit/";
    const String tolunch_in = "https://www.instagram.com/700_fahrenheit/";
    CollectionReference  use1 = FirebaseFirestore.instance.collection('Items') ;
    final col = ModalRoute.of(context)!.settings.arguments as Collection;

    // return OfflineBuilder(
    //   connectivityBuilder: (
    //     BuildContext context,
    //     ConnectivityResult connectivity,
    //     Widget child,
    //   ) {
    //     final bool connected = connectivity != ConnectivityResult.none;
    //     if (connected) {
    //       return Scaffold(
    //           backgroundColor: Colors.orange[300],
    //           appBar: AppBar(
    //             backgroundColor: Colors.orangeAccent,
    //             title: FittedBox(
    //               child: Center(
    //                 child: animated(),
    //               ),
    //             ),
    //             actions: [
    //               Container(
    //                 margin: EdgeInsets.only(top: 10, right: 0),
    //                 child: Badge(
    //                   badgeColor:
    //                       r == true ? Colors.yellowAccent : Colors.orangeAccent,
    //                   badgeContent: Consumer<Cart>(
    //                     builder: (context, cart, child) {
    //                       return r == true
    //                           ? Container(child: Center(child: Text('${r1}'))) : const SizedBox(height: 0,);
    //                     },
    //                   ),
    //                   child: IconButton(
    //                       onPressed: () {
    //                         setState(() {
    //      r = false;
    //                           r1 = 0;
    //                         });
    //                         Navigator.push(context, MaterialPageRoute(builder: (context) => Offers()));
    //                       },
    //                       icon: const Icon(
    //                         Icons.notifications_active_outlined,
    //                         color: Colors.white,
    //                       ),
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only(top: 10, right: (sw==false?20:0),left:(sw==false?0:20) ),
    //                 child: Badge(
    //                   badgeColor: Colors.yellowAccent,
    //                   badgeContent: Consumer<Cart>(
    //                     builder: (context, cart, child) {
    //                       return Text('${cart.count}');
    //                     },
    //                   ),
    //                   child: IconButton(
    //                       onPressed: () {
    //                         Navigator.push(context, MaterialPageRoute(builder: (context) => Cartdetails()));
    //                       },
    //                       icon: Icon(Icons.shopping_cart_outlined)),
    //                 ),
    //               )
    //             ],
    //           ),
    //           // drawer: Drawer(
    //           //     backgroundColor: Colors.blue[50],
    //           //     child: SafeArea(
    //           //       child: ListView(
    //           //         children: [
    //           //           UserAccountsDrawerHeader(
    //           //             decoration: BoxDecoration(color: Colors.blue[400]),
    //           //             accountName: Container(child: Text('${_name1}')),
    //           //             accountEmail: Container(
    //           //               child: FittedBox(child: Text('${_email1}')),
    //           //             ),
    //           //             currentAccountPicture: Padding(
    //           //               padding: const EdgeInsets.all(3.0),
    //           //               child: Container(
    //           //                 decoration: BoxDecoration(
    //           //                     borderRadius:
    //           //                         const BorderRadius.all(Radius.circular(50)),
    //           //                     border:
    //           //                         Border.all(color: Colors.white, width: 3),
    //           //                     boxShadow: const [
    //           //                       BoxShadow(color: Colors.white, blurRadius: 7)
    //           //                     ]),
    //           //                 child: ClipRRect(
    //           //                   child: Image.asset('assets/ddd.jpg'),
    //           //                   borderRadius:
    //           //                       const BorderRadius.all(Radius.circular(40)),
    //           //                 ),
    //           //               ),
    //           //             ),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () {
    //           //               setState(() {
    //           //                 if ("1".tr == "عربي") {
    //           //                   setState(() {
    //           //                     sw = true;
    //           //                   });
    //           //                   controller.Changelocale("ar");
    //           //                 } else {
    //           //                   setState(() {
    //           //                     sw = false;
    //           //                   });
    //           //                   controller.Changelocale("en");
    //           //                 }
    //           //               });
    //           //
    //           //             },
    //           //             title: Container(
    //           //                 child: Row(
    //           //               children: [
    //           //                 Container(
    //           //                   margin:  EdgeInsets.only(left: 5),
    //           //                   child:  Icon(
    //           //                     Icons.language,
    //           //                       color:sw==false? Colors.blue:Colors.red
    //           //                   ),
    //           //                 ),
    //           //                 Container(
    //           //                     margin: EdgeInsets.only(left: 10, top: 0),
    //           //                     child:  Text(
    //           //                       "1".tr,
    //           //                       style: TextStyle(fontWeight: FontWeight.bold),
    //           //                     )),
    //           //               ],
    //           //             )),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () {
    //           //               Navigator.push(
    //           //                   context,
    //           //                   MaterialPageRoute(
    //           //                       builder: (context) => Profile()));
    //           //             },
    //           //             title: Container(
    //           //                 child: Row(
    //           //               children: [
    //           //                 Container(
    //           //                   margin: const EdgeInsets.only(left: 5),
    //           //                   child: const Icon(
    //           //                     Icons.person,
    //           //                     color: Colors.blue,
    //           //                   ),
    //           //                 ),
    //           //                 Container(
    //           //                     margin: EdgeInsets.only(left: 10, top: 3),
    //           //                     child:  Text(
    //           //                       "23".tr,
    //           //                       style: TextStyle(fontWeight: FontWeight.bold),
    //           //                     )),
    //           //               ],
    //           //             )),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () {
    //           //               Navigator.push(
    //           //                   context,
    //           //                   MaterialPageRoute(
    //           //                       builder: (context) => Cartdetails()));
    //           //             },
    //           //             title: Container(
    //           //                 child: Row(children: [Container(
    //           //                 margin: EdgeInsets.only(left: 5),
    //           //                 child: const Icon(
    //           //                   Icons.shopping_cart_outlined,
    //           //                   color: Colors.blue,
    //           //                 ),
    //           //               ), Container(
    //           //                 margin: EdgeInsets.only(left: 10),
    //           //                 child:  Text('24'.tr,
    //           //                     style: TextStyle(fontWeight: FontWeight.bold)),
    //           //               )
    //           //             ])),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () {
    //           //               Navigator.push(
    //           //                   context,
    //           //                   MaterialPageRoute(
    //           //                       builder: (context) => Myorders()));
    //           //             },
    //           //             title: Container(
    //           //                 child: Row( children: [
    //           //                   Container(
    //           //                    margin: EdgeInsets.only(left: 5, top: 0),
    //           //                    child: const Icon(
    //           //                     Icons.delivery_dining,
    //           //                     color: Colors.blue,
    //           //                   ),
    //           //                 ),
    //           //                   Container(
    //           //                     margin: EdgeInsets.only(
    //           //                       left: 10,
    //           //                     ),
    //           //                     child:  Text(
    //           //                       '25'.tr,
    //           //                       style: TextStyle(fontWeight: FontWeight.bold),
    //           //                     )),
    //           //               ],
    //           //             )),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () {
    //           //               Navigator.push(
    //           //                   context,
    //           //                   MaterialPageRoute(builder: (context) => Mylocation()));
    //           //             },
    //           //             title: Container(
    //           //                 child: Row(children: [Container(
    //           //                  margin: EdgeInsets.only(left: 5),
    //           //                   child: const Icon(
    //           //                   Icons.location_on_outlined,
    //           //                   color: Colors.blue,
    //           //                 ),
    //           //               ), Container(
    //           //                 margin: EdgeInsets.only(left: 10),
    //           //                 child:  Text('26'.tr,
    //           //                     style: TextStyle(fontWeight: FontWeight.bold)),
    //           //               )
    //           //             ])),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () {
    //           //               showDialog<String>(
    //           //                   context: context,
    //           //                   builder: (BuildContext context) => AlertDialog(
    //           //                         title: Text('Enter your password'),
    //           //                         content: TextField(
    //           //                           controller: n10,
    //           //                           keyboardType: TextInputType.number,
    //           //                           decoration:
    //           //                               InputDecoration(hintText: "password"),
    //           //                         ),
    //           //                         actions: <Widget>[
    //           //                           FlatButton(
    //           //                             color: Colors.green,
    //           //                             textColor: Colors.white,
    //           //                             child: Text('OK'),
    //           //                             onPressed: () {
    //           //                               setState(() {
    //           //                                 if (n10.text == '1237890') {
    //           //                                   Get.to(Mangerhome());
    //           //                                 } else {
    //           //                                   Get.back();
    //           //                                 }
    //           //                               });
    //           //                             },
    //           //                           ),
    //           //                         ],
    //           //                       ));
    //           //             },
    //           //             title: Container(
    //           //                 child: Row(
    //           //               children: [
    //           //                 Container(
    //           //                   margin: EdgeInsets.only(
    //           //                     left: 5,
    //           //                   ),
    //           //                   child: const Icon(
    //           //                     Icons.manage_accounts,
    //           //                     color: Colors.blue,
    //           //                   ),
    //           //                 ),
    //           //                 Container(
    //           //                     margin: EdgeInsets.only(
    //           //                       left: 10,
    //           //                     ),
    //           //                     child:  Text(
    //           //                       "27".tr,
    //           //                       style: TextStyle(fontWeight: FontWeight.bold),
    //           //                     )),
    //           //               ],
    //           //             )),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () async {
    //           //               print(ph);
    //           //               if (await canLaunch('tel:$ph')) {
    //           //                 launch(('tel:$ph'));
    //           //                 //await FlutterPhoneDirectCaller.callNumber(ph);
    //           //               } else {
    //           //                 print('can"t');
    //           //               }
    //           //             },
    //           //             title: Container(
    //           //                 child: Row(
    //           //               children: [
    //           //                 Container(
    //           //                   margin: EdgeInsets.only(
    //           //                     left: 5,
    //           //                   ),
    //           //                   child: const Icon(
    //           //                     Icons.support_agent_sharp,
    //           //                     color: Colors.blue,
    //           //                   ),
    //           //                 ),
    //           //                 Container(
    //           //                     margin: EdgeInsets.only(
    //           //                       left: 10,
    //           //                     ),
    //           //                     child:  Text(
    //           //                       "28".tr,
    //           //                       style: TextStyle(fontWeight: FontWeight.bold),
    //           //                     )),
    //           //               ],
    //           //             )),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () async {
    //           //               print(ph_res);
    //           //               if (await canLaunch('tel:$ph_res')) {
    //           //                 launch(('tel:$ph_res'));
    //           //                 //await FlutterPhoneDirectCaller.callNumber(ph);
    //           //               } else {
    //           //                 print('can"t');
    //           //               }
    //           //             },
    //           //             title: Container(
    //           //                 child: Row(
    //           //               children: [
    //           //                 Container(
    //           //                   margin: EdgeInsets.only(
    //           //                     left: 5,
    //           //                   ),
    //           //                   child: const Icon(
    //           //                     Icons.phone,
    //           //                     color: Colors.blue,
    //           //                   ),
    //           //                 ),
    //           //                 Container(
    //           //                     margin: EdgeInsets.only(
    //           //                       left: 10,
    //           //                     ),
    //           //                     child:  Text(
    //           //                       "29".tr,
    //           //                       style: TextStyle(fontWeight: FontWeight.bold),
    //           //                     )),
    //           //               ],
    //           //             )),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () async {
    //           //               if (await canLaunch(tolunch)) {
    //           //                 await launch(
    //           //                   tolunch,
    //           //                   forceWebView: false,
    //           //                 );
    //           //               } else {
    //           //                 throw 'Could not launch';
    //           //               }
    //           //             },
    //           //             title: Container(
    //           //                 child: Row(
    //           //               children: [
    //           //                 Container(
    //           //                   margin: EdgeInsets.only(
    //           //                     left: 5,
    //           //                   ),
    //           //                   child: const Icon(
    //           //                     Icons.facebook,
    //           //                     color: Colors.blue,
    //           //                   ),
    //           //                 ),
    //           //                 Container(
    //           //                     margin: EdgeInsets.only(
    //           //                       left: 10,
    //           //                     ),
    //           //                     child:  Text(
    //           //                      "30".tr,
    //           //                       style: TextStyle(fontWeight: FontWeight.bold),
    //           //                     )),
    //           //               ],
    //           //             )),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () async {
    //           //               if (await canLaunch(tolunch_in)) {
    //           //                 await launch(
    //           //                   tolunch_in,
    //           //                   forceWebView: false,
    //           //                 );
    //           //               } else {
    //           //                 throw 'Could not launch';
    //           //               }
    //           //             },
    //           //             title: Container(
    //           //                 child: Row(
    //           //               children: [
    //           //                 Container(
    //           //                   margin: EdgeInsets.only(
    //           //                     left: 5,
    //           //                   ),
    //           //                   child: const Icon(
    //           //                     Icons.book,
    //           //                     color: Colors.blue,
    //           //                   ),
    //           //                 ),
    //           //                 Container(
    //           //                     margin: EdgeInsets.only(
    //           //                       left: 10,
    //           //                     ),
    //           //                     child:  Text(
    //           //                       "31".tr,
    //           //                       style: TextStyle(fontWeight: FontWeight.bold),
    //           //                     )),
    //           //               ],
    //           //             )),
    //           //           ),
    //           //           ListTile(
    //           //             onTap: () {
    //           //               instance.signOut();
    //           //             },
    //           //             title: Container(
    //           //                 child: Row(
    //           //               children: [
    //           //                 Container(
    //           //                   margin: EdgeInsets.only(
    //           //                     left: 5,
    //           //                   ),
    //           //                   child: const Icon(
    //           //                     Icons.login_outlined,
    //           //                     color: Colors.blue,
    //           //                   ),
    //           //                 ),
    //           //                 Container(
    //           //                     margin: EdgeInsets.only(
    //           //                       left: 10,
    //           //                     ),
    //           //                     child:  Text(
    //           //                      "32".tr,
    //           //                       style: TextStyle(fontWeight: FontWeight.bold),
    //           //                     )),
    //           //               ],
    //           //             )),
    //           //           ),
    //           //           SizedBox(height: 100,)
    //           //         ],
    //           //       ),
    //           //     )),
    //           body: ListView(
    //             children: [
    //               Container(
    //                 height: 40,
    //                 color: Colors.orange[300],
    //                 margin: EdgeInsets.only(top: 7, bottom: 0),
    //                 child: FittedBox(
    //                   child: Row(
    //                     children: [
    //                       Container(
    //                         margin:  EdgeInsets.only(left: 30,right: 20),
    //                         child:  Text(
    //                           "15".tr,
    //                           style: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                               shadows: [
    //                                 BoxShadow(
    //                                     color: Colors.black, blurRadius: 5)
    //                               ]),
    //                         ),
    //                       ),
    //                       Container(
    //                         margin: const EdgeInsets.only(left: 210),
    //                         child: const Icon(
    //                           Icons.arrow_right,
    //                           color: Colors.white,
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               const Divider(
    //                 thickness: 1,
    //               ),
    //               Container(
    //                 color: Colors.orange[300],
    //                 height: 180,
    //                 child: ListView(
    //                   scrollDirection: Axis.horizontal,
    //                   children: [
    //                     InkWell(
    //                       child: categories('assets/pizza.jpg', "17".tr),
    //                       onTap: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => Screen1(),
    //                                 settings: RouteSettings(
    //                                     arguments:
    //                                         Collection(collect: 'Pizza'))));
    //                       },
    //                     ),
    //                     InkWell(
    //                       child: categories('assets/pies.webp', "18".tr),
    //                       onTap: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => Screen1(),
    //                                 settings: RouteSettings(
    //                                     arguments:
    //                                         Collection(collect: 'Pies'))));
    //                       },
    //                     ),
    //                     InkWell(
    //                       child: categories('assets/haw.jpg', "19".tr),
    //                       onTap: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => Screen1(),
    //                                 settings: RouteSettings(
    //                                     arguments:
    //                                         Collection(collect: 'Hawawshy'))));
    //                       },
    //                     ),
    //                     categories('assets/rol.webp',"20".tr),
    //                     InkWell(
    //                       child: categories('assets/s5.jpg', "21".tr),
    //                       onTap: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => Screen1(),
    //                                 settings: RouteSettings(
    //                                     arguments:
    //                                         Collection(collect: 'Sweet Pie'))));
    //                       },
    //                     ),
    //                     categories('assets/pep.jpg',"22".tr),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 height: 40,
    //                 margin: EdgeInsets.only(top: 0, bottom: 0),
    //                 child: FittedBox(
    //                   child: Row(
    //                     children: [
    //                       Container(
    //                         margin: EdgeInsets.only(bottom: 0, left: 12,right: 12),
    //                         child:  Text(
    //                           "16".tr,
    //                           style: TextStyle(
    //                               fontSize: 16,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.black,
    //                               shadows: [
    //                                 BoxShadow(
    //                                     color: Colors.white, blurRadius: 10)
    //                               ]),
    //                         ),
    //                       ),
    //                       Container(
    //                         margin: const EdgeInsets.only(left: 170),
    //                         child: const Icon(Icons.arrow_forward_ios),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               const Divider(
    //                 thickness: 1,
    //               ),
    //               // StreamBuilder(
    //               //     stream: use1.snapshots(),
    //               //     builder: (context,
    //               //         AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    //               //       if (snapshot.hasData) {
    //               //         return Container(
    //               //             height: 1000,
    //               //             child: ListView.builder(
    //               //                 physics: NeverScrollableScrollPhysics(),
    //               //                 itemCount: snapshot.data?.docs.length,
    //               //                 itemBuilder: (context, i) {
    //               //                   return InkWell(
    //               //                       child: Meals(
    //               //                         '${sw==false? '${snapshot.data?.docs[i]['Name']}': '${snapshot.data?.docs[i]['الاسم']}'}',
    //               //                         '${sw==false? '${snapshot.data?.docs[i]['Description']}': '${snapshot.data?.docs[i]['الوصف']}'}',
    //               //                         '${sw==false? '${snapshot.data?.docs[i]['Ingredients']}': '${snapshot.data?.docs[i]['المكونات']}'}',
    //               //                         '${snapshot.data?.docs[i]['Price'][0]['Size1']}',
    //               //                         '${snapshot.data?.docs[i]['Price'][0]['Price1']}',
    //               //                         '${snapshot.data?.docs[i]['Price'][1]['Size2']}',
    //               //                         '${snapshot.data?.docs[i]['Price'][1]['Price2']}',
    //               //                         '${snapshot.data?.docs[i]['Image']}',
    //               //                       ),
    //               //                       onTap: () {
    //               //                         Navigator.push(
    //               //                           context,
    //               //                           MaterialPageRoute(
    //               //                             builder: (context) => Details(),
    //               //                             settings: RouteSettings(
    //               //                               arguments: Recomm(
    //               //                                 name:
    //               //                                     '${snapshot.data?.docs[i]['Name']}',
    //               //                                 description:
    //               //                                     '${snapshot.data?.docs[i]['Description']}',
    //               //                                 ingredients:
    //               //                                     '${snapshot.data?.docs[i]['Ingredients']}',
    //               //                                 size1:
    //               //                                     '${snapshot.data?.docs[i]['Price'][0]['Size1']}',
    //               //                                 price1:
    //               //                                     '${snapshot.data?.docs[i]['Price'][0]['Price1']}',
    //               //                                 size2:
    //               //                                     '${snapshot.data?.docs[i]['Price'][1]['Size2']}',
    //               //                                 price2:
    //               //                                     '${snapshot.data?.docs[i]['Price'][1]['Price2']}',
    //               //                                 image:
    //               //                                     '${snapshot.data?.docs[i]['Image']}',
    //               //                                 collection: "Pizza",
    //               //                                 description_ar:'${snapshot.data?.docs[i]['الوصف']}',
    //               //                                 ingredients_ar:'${snapshot.data?.docs[i]['المكونات']}',
    //               //                                 name_ar: '${snapshot.data?.docs[i]['الاسم']}',
    //               //                               ),
    //               //                             ),
    //               //                           ),
    //               //                         );
    //               //                       });
    //               //                 }));
    //               //       }
    //               //       if (snapshot.connectionState ==
    //               //           ConnectionState.waiting) {
    //               //         return const Center(
    //               //           child: Text('Loading.....'),
    //               //         );
    //               //       }
    //               //       return const Text('Erorr');
    //               //     })
    //             ],
    //           ));
    //     } else {
    //       return Container(
    //         width: MediaQuery.of(context).size.width,
    //         height: MediaQuery.of(context).size.height,
    //         color: Colors.white,
    //         child: Padding(
    //           padding: const EdgeInsets.all(12.0),
    //           child: Column(
    //             children: [
    //               Expanded(
    //                   flex: 1,
    //                   child: Center(
    //                       child: FittedBox(
    //                           child: Text(
    //                     ' Please Connect to the network......  ',
    //                     style: TextStyle(color: Colors.blue),
    //                   )))),
    //               Expanded(
    //                   flex: 5,
    //                   child: Container(
    //                     width: MediaQuery.of(context).size.width,
    //                     height: MediaQuery.of(context).size.height,
    //                     child: Image.asset(
    //                       'assets/net.gif',
    //                       fit: BoxFit.cover,
    //                     ),
    //                   )),
    //               Expanded(
    //                 flex: 1,
    //                 child: Container(
    //                     child: FittedBox(
    //                   child: Text(
    //                       "Can't connect to network ,please chick your server"),
    //                 )),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     }
    //   },
    //   child: Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    return Scaffold(
        backgroundColor: Colors.orange[300],
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: FittedBox(
            child: Center(
              child: animated(),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(top: 10, right: 0),
              child: Badge(
                badgeColor:
                r == true ? Colors.yellowAccent : Colors.orangeAccent,
                badgeContent: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return r == true
                        ? Container(child: Center(child: Text('${r1}'))) : const SizedBox(height: 0,);
                  },
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      r = false;
                      r1 = 0;
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Offers()));
                  },
                  icon: const Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: (sw==false?20:0),left:(sw==false?0:20) ),
              child: Badge(
                badgeColor: Colors.yellowAccent,
                badgeContent: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Text('${cart.count}');
                  },
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Cartdetails()));
                    },
                    icon: Icon(Icons.shopping_cart_outlined)),
              ),
            )
          ],
        ),
        drawer: Drawer(
            backgroundColor: Colors.blue[50],
            child: SafeArea(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue[400]),
                    accountName: Container(child: Text('${_name1}')),
                    accountEmail: Container(
                      child: FittedBox(child: Text('${_email1}')),
                    ),
                    currentAccountPicture: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            border:
                                Border.all(color: Colors.white, width: 3),
                            boxShadow: const [
                              BoxShadow(color: Colors.white, blurRadius: 7)
                            ]),
                        child: ClipRRect(
                          child: Image.asset('assets/ddd.jpg'),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        if ("1".tr == "عربي") {
                          setState(() {
                            sw = true;
                          });
                          controller.Changelocale("ar");
                        } else {
                          setState(() {
                            sw = false;
                          });
                          controller.Changelocale("en");
                        }
                      });

                    },
                    title: Container(
                        child: Row(
                      children: [
                        Container(
                          margin:  EdgeInsets.only(left: 5),
                          child:  Icon(
                            Icons.language,
                              color:sw==false? Colors.blue:Colors.red
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, top: 0),
                            child:  Text(
                              "1".tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile()));
                    },
                    title: Container(
                        child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: const Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, top: 3),
                            child:  Text(
                              "23".tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cartdetails()));
                    },
                    title: Container(
                        child: Row(children: [Container(
                        margin: EdgeInsets.only(left: 5),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.blue,
                        ),
                      ), Container(
                        margin: EdgeInsets.only(left: 10),
                        child:  Text('24'.tr,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ])),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Myorders()));
                    },
                    title: Container(
                        child: Row( children: [
                          Container(
                           margin: EdgeInsets.only(left: 5, top: 0),
                           child: const Icon(
                            Icons.delivery_dining,
                            color: Colors.blue,
                          ),
                        ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child:  Text(
                              '25'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Mylocation()));
                    },
                    title: Container(
                        child: Row(children: [Container(
                         margin: EdgeInsets.only(left: 5),
                          child: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.blue,
                        ),
                      ), Container(
                        margin: EdgeInsets.only(left: 10),
                        child:  Text('26'.tr,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ])),
                  ),
                  ListTile(
                    onTap: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: Text('Enter your password'),
                                content: TextField(
                                  controller: n10,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(hintText: "password"),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    color: Colors.green,
                                    textColor: Colors.white,
                                    child: Text('OK'),
                                    onPressed: () {
                                      setState(() {
                                        if (n10.text == '1237890') {
                                          Get.to(Mangerhome());
                                        } else {
                                          Get.back();
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ));
                    },
                    title: Container(
                        child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          child: const Icon(
                            Icons.manage_accounts,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child:  Text(
                              "27".tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                  ),
                  ListTile(
                    onTap: () async {
                      print(ph);
                      if (await canLaunch('tel:$ph')) {
                        launch(('tel:$ph'));
                        //await FlutterPhoneDirectCaller.callNumber(ph);
                      } else {
                        print('can"t');
                      }
                    },
                    title: Container(
                        child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          child: const Icon(
                            Icons.support_agent_sharp,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child:  Text(
                              "28".tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                  ),
                  ListTile(
                    onTap: () async {
                      print(ph_res);
                      if (await canLaunch('tel:$ph_res')) {
                        launch(('tel:$ph_res'));
                        //await FlutterPhoneDirectCaller.callNumber(ph);
                      } else {
                        print('can"t');
                      }
                    },
                    title: Container(
                        child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          child: const Icon(
                            Icons.phone,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child:  Text(
                              "29".tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                  ),
                  ListTile(
                    onTap: () async {
                      if (await canLaunch(tolunch)) {
                        await launch(
                          tolunch,
                          forceWebView: false,
                        );
                      } else {
                        throw 'Could not launch';
                      }
                    },
                    title: Container(
                        child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          child: const Icon(
                            Icons.facebook,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child:  Text(
                             "30".tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                  ),
                  ListTile(
                    onTap: () async {
                      if (await canLaunch(tolunch_in)) {
                        await launch(
                          tolunch_in,
                          forceWebView: false,
                        );
                      } else {
                        throw 'Could not launch';
                      }
                    },
                    title: Container(
                        child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          child: const Icon(
                            Icons.book,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child:  Text(
                              "31".tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                  ),
                  ListTile(
                    onTap: () {
                      instance.signOut();
                    },
                    title: Container(
                        child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          child: const Icon(
                            Icons.login_outlined,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child:  Text(
                             "32".tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                  ),
                  SizedBox(height: 100,)
                ],
              ),
            )),
        body: ListView(
          children: [
            Container(
              height: 40,
              color: Colors.orange[300],
              margin: EdgeInsets.only(top: 7, bottom: 0),
              child: FittedBox(
                child: Row(
                  children: [
                    Container(
                      margin:  EdgeInsets.only(left: 30,right: 20),
                      child:  Text(
                        "15".tr,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              BoxShadow(
                                  color: Colors.black, blurRadius: 5)
                            ]),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 210),
                      child: const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Container(
              color: Colors.orange[300],
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    child: categories('assets/pizza.jpg', "17".tr),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Screen1(),
                              settings: RouteSettings(
                                  arguments:
                                  Collection(collect: 'Pizza'))));
                    },
                  ),
                  InkWell(
                    child: categories('assets/pies.webp', "18".tr),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Screen1(),
                              settings: RouteSettings(
                                  arguments:
                                  Collection(collect: 'Pies'))));
                    },
                  ),
                  InkWell(
                    child: categories('assets/haw.jpg', "19".tr),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Screen1(),
                              settings: RouteSettings(
                                  arguments:
                                  Collection(collect: 'Hawawshy'))));
                    },
                  ),
                  categories('assets/rol.webp',"20".tr),
                  InkWell(
                    child: categories('assets/s5.jpg', "21".tr),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Screen1(),
                              settings: RouteSettings(
                                  arguments:
                                  Collection(collect: 'Sweet Pie'))));
                    },
                  ),
                  categories('assets/pep.jpg',"22".tr),
                ],
              ),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 0, bottom: 0),
              child: FittedBox(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 0, left: 12,right: 12),
                      child:  Text(
                        "16".tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: [
                              BoxShadow(
                                  color: Colors.white, blurRadius: 10)
                            ]),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 170),
                      child: const Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            // StreamBuilder(
            //     stream: use1.snapshots(),
            //     builder: (context,
            //         AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            //       if (snapshot.hasData) {
            //         return Container(
            //             height: 1000,
            //             child: ListView.builder(
            //                 physics: NeverScrollableScrollPhysics(),
            //                 itemCount: snapshot.data?.docs.length,
            //                 itemBuilder: (context, i) {
            //                   return InkWell(
            //                       child: Meals(
            //                         '${sw==false? '${snapshot.data?.docs[i]['Name']}': '${snapshot.data?.docs[i]['الاسم']}'}',
            //                         '${sw==false? '${snapshot.data?.docs[i]['Description']}': '${snapshot.data?.docs[i]['الوصف']}'}',
            //                         '${sw==false? '${snapshot.data?.docs[i]['Ingredients']}': '${snapshot.data?.docs[i]['المكونات']}'}',
            //                         '${snapshot.data?.docs[i]['Price'][0]['Size1']}',
            //                         '${snapshot.data?.docs[i]['Price'][0]['Price1']}',
            //                         '${snapshot.data?.docs[i]['Price'][1]['Size2']}',
            //                         '${snapshot.data?.docs[i]['Price'][1]['Price2']}',
            //                         '${snapshot.data?.docs[i]['Image']}',
            //                       ),
            //                       onTap: () {
            //                         Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                             builder: (context) => Details(),
            //                             settings: RouteSettings(
            //                               arguments: Recomm(
            //                                 name:
            //                                     '${snapshot.data?.docs[i]['Name']}',
            //                                 description:
            //                                     '${snapshot.data?.docs[i]['Description']}',
            //                                 ingredients:
            //                                     '${snapshot.data?.docs[i]['Ingredients']}',
            //                                 size1:
            //                                     '${snapshot.data?.docs[i]['Price'][0]['Size1']}',
            //                                 price1:
            //                                     '${snapshot.data?.docs[i]['Price'][0]['Price1']}',
            //                                 size2:
            //                                     '${snapshot.data?.docs[i]['Price'][1]['Size2']}',
            //                                 price2:
            //                                     '${snapshot.data?.docs[i]['Price'][1]['Price2']}',
            //                                 image:
            //                                     '${snapshot.data?.docs[i]['Image']}',
            //                                 collection: "Pizza",
            //                                 description_ar:'${snapshot.data?.docs[i]['الوصف']}',
            //                                 ingredients_ar:'${snapshot.data?.docs[i]['المكونات']}',
            //                                 name_ar: '${snapshot.data?.docs[i]['الاسم']}',
            //                               ),
            //                             ),
            //                           ),
            //                         );
            //                       });
            //                 }));
            //       }
            //       if (snapshot.connectionState ==
            //           ConnectionState.waiting) {
            //         return const Center(
            //           child: Text('Loading.....'),
            //         );
            //       }
            //       return const Text('Erorr');
            //     })
          ],
        ));
  }
}
