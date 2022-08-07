import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fahrenheit/UI/profile.dart';
import 'package:fahrenheit/cart/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;
import '../classs/myorderclass.dart';
import 'home1.dart';
import 'myorders.dart';

class Cartdetails extends StatefulWidget {
  @override
  State<Cartdetails> createState() => _CartdetailsState();
}

class _CartdetailsState extends State<Cartdetails> {
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
          'notification': <String, dynamic>{
            'body': 'New Order',
            'title': 'Fahrenheit'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to':
              'fJidmealRGeoV2oyKaLicj:APA91bFb0cnB3aN-Mqa-HPL4HCY6OgDaN6Jt2vDmuv1bQbbEm0-uDKB1X29rRaZsEfAoeAV2RyzBGTMtGllP17sXWoMwj7jHUP_cHrctMjsv_RHdOnLS_IKMpQaSpgwBDC2AtpGMl-lg'
        },

      ),
    );
    print('success notification');
  }

  date1() {
    final DateTime now = DateTime.now();
    return formatDate(now, [yyyy, '-', mm, '-', dd]);
  }

  time1() {
    final DateTime now = DateTime.now();
    return formatDate(now, [HH, ':', nn]);
  }

  List z = [];
  late DatabaseHandler handler;
  late DatabaseHandler1 handler1;
  bool ar =false;
  int counter1=1;
  Counter1() async {
    CollectionReference e = FirebaseFirestore.instance.collection('Orders');
    await e.orderBy('id', descending: true).limit(1).get().then((value) => {
      value.docs.forEach((element) {
        counter1 = int.parse(element.id) + 1;
        print(counter1);
      })
    });
  }

  void initState() {

    getlocation();
    date1();
    Counter1();
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
    });
    this.handler1 = DatabaseHandler1();
    this.handler1.initializeDB().whenComplete(() async {

    });
    if("1".tr =="English"){
      setState(() {
        ar=true;
      });
    }
    else{
      setState(() {
        ar=false;
      });
    }
    select(1);
  }

  String total_price = '2';
  String items = '';
  String total_items = '3';
  List a = [];
  String chickcustomer = '';

  Future<int> addOrder() async {
    Order firstUser = Order(
        total_price: total_price,
        items: items,
        date: date1(),
        order_id: counter1.toString(),
        total_items: total_items,
        customer_id: time1());
    List<Order> listOfUsers = [firstUser];
    return await this.handler.insertUser(listOfUsers);
  }

  Future<void> select(int id) async {
    final db = await handler1.initializeDB();
    a = await db.query(
      'user2',
      where: "id == ${id}",
    );
    setState(() {
      a.forEach((element) {
        chickcustomer = element['address'];
      });
    });
    print('================');
    print(a.toString());
  }

  int counter = 1;
  var lat;
  var long;
  Position? c;

  Future<void> getlocation() async {
    c = await Geolocator.getCurrentPosition().then((value) => value);
    lat = c?.latitude;
    long = c?.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue[400],
                title:  Center(
                  child: Text(
                    '24'.tr,
                    style: TextStyle(shadows: [
                      BoxShadow(blurRadius: 7, color: Colors.black)
                    ]),
                  ),
                ),
              ),
              body: Consumer<Cart>(
                builder: (context, cart, child) {
                  return Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.blue[300],
                          child: FittedBox(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    bottom: 10,
                                    right: 20,
                                  ),
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 30,left: 10,right: 10),
                                          child: RaisedButton(
                                            onPressed: () {
                                              if (chickcustomer ==
                                                      'login_google' ||
                                                  chickcustomer == null ||
                                                  chickcustomer == '') {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                  duration: Duration(seconds: 1),
                                                  content: Text(
                                                      "You don't have an address ,because you login by google account ,please add your address or Sign In  new account  "),
                                                  backgroundColor: Colors.red,
                                                ));
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Profile()));
                                              } else {
                                                List p = [];
                                                List p1 = [];
                                                for (int i = 0; i <= cart.basketitems.length - 1; i++) {
                                                  p.add({'item_name': cart.basketitems[i].name,
                                                    'item_price': '${cart.basketitems[i].price}',
                                                    'item_image': cart.basketitems[i].image,
                                                    'item_size': cart.basketitems[i].size
                                                  });
                                                  p1.add({
                                                    cart.basketitems[i].name,
                                                    cart.basketitems[i].size,
                                                    cart.basketitems[i].price
                                                  });
                                                }
                                                var x = FirebaseFirestore.instance.collection('Orders').doc(counter1.toString()).set(
                                               (<String, dynamic>{
                                                  'id': counter1,
                                                  'Customer': a,
                                                  'Date ': '${date1()}',
                                                  'Time ': '${time1()}',
                                                  'Total_Price': '${cart.price}',
                                                  'Quantity ': '${cart.count}',
                                                  'Items': p,
                                                  'lat': lat,
                                                  'long': long
                                                }),);
                                                setState(() {
                                                  items = p1.toString();
                                                  total_price =
                                                      cart.price.toString();
                                                  total_items =
                                                      cart.count.toString();
                                                  send('manger', 'yeah', 'id');
                                                });
                                                addOrder();
                                                counter++;

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(content: Text(
                                                      'The Order is success'),
                                                  backgroundColor: Colors.blue,
                                                ));
                                                for (int j = 0;
                                                    j <=
                                                        cart.basketitems.length -
                                                            1;
                                                    j + 1) {
                                                  cart.remove(cart.basketitems
                                                      .elementAt(j));
                                                }
                                              }
                                            },
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            child:  Text(
                                              '45'.tr,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 30, left: 25),
                                          child: RaisedButton(
                                            onPressed: () {
                                              for (int j = 0;
                                                  j <=
                                                      cart.basketitems.length - 1;
                                                  j + 1) {
                                                cart.remove(cart.basketitems
                                                    .elementAt(j));
                                              }
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content:
                                                    Text('The Order is Remove'),
                                                backgroundColor: Colors.orange,
                                              ));
                                            },
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            child:  Text(
                                              '46'.tr,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10, left: 0),
                                  child: FittedBox(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 0, left: 0),
                                          color: Colors.white38,
                                          width: 160,
                                          height: 40,
                                          child:  Center(
                                              child: FittedBox(
                                            child: Text(
                                             "47".tr,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  shadows: [
                                                    BoxShadow(
                                                        color: Colors.black,
                                                        blurRadius: 1)
                                                  ]),
                                            ),
                                          )),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 0, left: 0),
                                          color: Colors.white,
                                          width: 100,
                                          height: 40,
                                          child:
                                              Center(child: Text('${counter1}')),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 0, left: 0),
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 20, left: 0),
                                          color: Colors.white38,
                                          width: 160,
                                          height: 40,
                                          child:  Center(
                                              child: Text(
                                            '48'.tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.white,
                                                shadows: [
                                                  BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 1)
                                                ]),
                                          )),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 20, left: 0),
                                          color: Colors.white,
                                          width: 100,
                                          height: 40,
                                          child: Center(
                                              child: FittedBox(
                                                  child: Text('${date1()}'))),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 0, left: 0),
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 20, left: 0),
                                          color: Colors.white38,
                                          width: 160,
                                          height: 40,
                                          child:  Center(
                                              child: Text(
                                            '49'.tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.white,
                                                shadows: [
                                                  BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 1)
                                                ]),
                                          )),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 20, left: 0),
                                          color: Colors.white,
                                          width: 100,
                                          height: 40,
                                          child:
                                              Center(child: Text('${time1()}')),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 0, left: 0),
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 20, left: 0),
                                          color: Colors.white38,
                                          width: 160,
                                          height: 40,
                                          child:  Center(
                                              child: Text(
                                            '50'.tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.white,
                                                shadows: [
                                                  BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 1)
                                                ]),
                                          )),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 20, left: 0),
                                          color: Colors.white,
                                          width: 100,
                                          height: 40,
                                          child: Center(
                                              child: Text(
                                                  '${cart.basketitems.length}')),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 0, left: 0,bottom: 180),
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 20, left: 0),
                                          color: Colors.white38,
                                          width: 160,
                                          height: 40,
                                          child:  Center(
                                              child: Text(
                                            '51'.tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.white,
                                                shadows: [
                                                  BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 1)
                                                ]),
                                          )),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 20, left: 0),
                                          color: Colors.white,
                                          width: 100,
                                          height: 40,
                                          child: Center(
                                              child: Text('${cart.price}')),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox.expand(
                        child: DraggableScrollableSheet(
                          maxChildSize: 0.8,
                          builder: (BuildContext context,
                              ScrollController scrollController) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20)),
                                  border:
                                      Border.all(color: Colors.white, width: 5),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 7, color: Colors.black)
                                  ]),
                              child: Container(
                                  margin: EdgeInsets.all(5),
                                  color: Colors.blue[100],
                                  child: ListView.builder(
                                      controller: scrollController,
                                      itemCount: cart.basketitems.length,
                                      itemBuilder: (context, i) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              top: 20, left: 30, right: 30),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurRadius: 8,
                                                    color: Colors.black)
                                              ],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.deepOrange)),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 20,
                                                left: 8,
                                                right: 8,
                                                bottom: 20),
                                            child: ListTile(
                                              leading: Container(
                                                height: 100,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    border: Border.all(
                                                        width: 2,
                                                        color:
                                                            Colors.deepOrange)),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    child: Image.network(
                                                      cart.basketitems[i].image,
                                                      fit: BoxFit.fill,
                                                    )),
                                              ),
                                              tileColor: Colors.white,
                                              title: Center(
                                                  child: FittedBox(
                                                child: Text(
                                                  cart.basketitems[i].name,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              )),
                                              subtitle: FittedBox(
                                                child: Row(
                                                  children: [
                                                    Center(
                                                        child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10),
                                                            child: Text(
                                                              cart
                                                                  .basketitems[
                                                                      i]
                                                                  .size,
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            ))),
                                                    Center(
                                                        child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10),
                                                            child: Text(
                                                              '${cart.basketitems[i].price}',
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            ))),
                                                  ],
                                                ),
                                              ),
                                              trailing: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.blueGrey,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    border: Border.all(
                                                        width: 1,
                                                        color:
                                                            Colors.deepOrange)),
                                                child: IconButton(
                                                  onPressed: () {
                                                    cart.remove(
                                                        cart.basketitems[i]);
                                                  },
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              ));
        } else {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: FittedBox(
                              child: Text(
                                  ' Please Connect to the network......  '
                              ,style: TextStyle(color: Colors.blue),
                              )))),
                  Expanded(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Image.asset(
                          'assets/net.gif',
                          fit: BoxFit.cover,
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                        child: FittedBox(
                      child: Text(
                          "Can't connect to network ,please chick your server"),
                    )),
                  ),
                ],
              ),
            ),
          );
        }
      },
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
