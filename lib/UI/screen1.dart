import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fahrenheit/classs/pass.dart';
import 'package:fahrenheit/UI/screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../cart/cart.dart';
import 'request_order.dart';
import '../classs/collection.dart';

class Screen1 extends StatefulWidget {
  @override
  State<Screen1> createState() => _Screen1State();
}

String s1 = '';
String p1 = '';
String s2 = '';
String p2 = '';

class _Screen1State extends State<Screen1> {
  List items1 = [];
  List items2 = [];
  String collection_ar='';
  bool ar=false;
  @override
  void initState() {
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

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final col = ModalRoute.of(context)!.settings.arguments as Collection;
    CollectionReference u = FirebaseFirestore.instance.collection(col.collect);
    if(col.collect=='Hawawshy'){
      collection_ar='حواوشي ايطالي';
    }
    else if(col.collect=='Pizza'){
      collection_ar='بيتزا';
    }else if(col.collect=='Pies'){
      collection_ar='فطير حادق';
    }else if(col.collect=='Sweet Pie'){
      collection_ar='فطير حلو';
    }
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return Scaffold(
              backgroundColor: Colors.orangeAccent,
              appBar: AppBar(
                backgroundColor: Colors.orange,
                title: Center(
                  child: Text(
                    ar==false?'${col.collect}':collection_ar,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(color: Colors.red, blurRadius: 20)
                        ]),
                  ),
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 20,left: 20),
                    child: Badge(
                      badgeColor: Colors.yellowAccent,
                      badgeContent: Consumer<Cart>(
                        builder: (context, cart, child) {
                          return Text('${cart.count}');
                        },
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cartdetails()));
                          },
                          icon: Icon(Icons.shopping_cart_outlined)),
                    ),
                  )
                ],
              ),
              body: StreamBuilder(
                  stream: u.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2 / 3,
                            ),
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, i) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    border: Border.all(
                                        color: Colors.deepOrange, width: 4),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5, color: Colors.white)
                                    ]),
                                child:snapshot.connectionState == ConnectionState.waiting ?Center(child: CircularProgressIndicator(),): InkWell(
                                  child: GridTile(
                                    child: Hero(
                                      tag: snapshot.data?.docs[i]['Name'],
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 27),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          child: snapshot.connectionState == ConnectionState.waiting ? Center(
                                            child: CircularProgressIndicator(),) : Image.network(
                                                  '${snapshot.data?.docs[i]['Image']}',
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    ),
                                    footer: Container(
                                      height: 30,
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        child: Center(
                                            child: FittedBox(child: Text(
                                            ar==false?'${snapshot.data?.docs[i]['Name']}':'${snapshot.data?.docs[i]['الاسم']}',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      items1 = snapshot.data?.docs[i]['Ingredients'];
                                      items2 = snapshot.data?.docs[i]['المكونات'];
                                      List s = snapshot.data?.docs[i]['Price'];
                                      print(s[0]['Size1']);
                                      s1 = s[0]['Size1'];
                                      p1 = s[0]['Price1'];
                                      s2 = s[1]['Size2'];
                                      p2 = s[1]['Price2'];
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Screen2(),
                                        settings: RouteSettings(
                                          arguments: Pass(
                                              name:
                                                  '${snapshot.data?.docs[i]['Name']}',
                                              description:
                                                  '${snapshot.data?.docs[i]['Description']}',
                                              ingredients:
                                                  '${snapshot.data?.docs[i]['Ingredients']}',
                                              size1: s1,
                                              price1: p1,
                                              size2: s2,
                                              price2: p2,
                                              image:'${snapshot.data?.docs[i]['Image']}',
                                              collection: col.collect,
                                              items: items1.toList(),
                                              description_ar:'${snapshot.data?.docs[i]['الوصف']}',
                                              ingredients_ar: items2.toList(),
                                              name_ar: '${snapshot.data?.docs[i]['الاسم']}',),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  Center(
                        child: Text('Loading.......'),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Text('Error for firebase1');
                    }
                    return const Text('Chick your App');
                  }));
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
                                  ' Please Connect to the network......  ',style: TextStyle(color: Colors.blue),)))),
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

