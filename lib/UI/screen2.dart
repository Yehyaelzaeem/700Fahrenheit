import 'package:badges/badges.dart';
import 'package:fahrenheit/cart/cart.dart';
import 'package:fahrenheit/classs/item.dart';
import 'package:fahrenheit/classs/pass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'request_order.dart';

class Screen2 extends StatefulWidget {
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool _value = false;
  int val = -1;
  List ingred = [
    'Sauce',
    'Dough',
    'Mozzarella cheese',
    'Sausage',
    'Tomatoes',
    'Pepper',
    'Olive'
  ];
  String f = 'Dough  / Mozzarella cheese /  Sausage/ Tomatoes / Pepper/ Olive';
  int counter = 0;

  str() {
    for (int i = 0; i <= ingred.length; i++) {
      return ingred[i].toString();
    }
  }

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
    str();
    super.initState();
  }
  List a1_ar = [
    'اضافه سجق',
    'اضافه لحمه',
    'اضافه سوسيس',
    'اضافه فراخ',
    'اضافه بسطرمه',
    'اضافه سلامي',
    'اضافه تونه',
  ];
  List a2_ar = [
    'اضافه رومي',
    'اضافه كيري',
    'اضافه موزيريلا',
    'اضافه خضراوات',
  ];
  List a1=[
    'Extra Sausage',
    'Extra Meat',
    'Extra Hotdog',
    'Extra chicken',
    'Extra pastrami',
    'Extra Salami',
    'Extra tuna',
  ];
  List a2 =[
    'Extra Rome',
    'Extra Kiri',
    'Extra mozzarella',
    'Extra vegetables',
  ];
  String y_ar ='النصف الاول';
  String b1_ar ='اضافه لحوم';
  String b1 ='External meats';
  String b2_ar ='اضافه جبن';
  String b2 ='External cheese';
  String y ='the first half';
  String y1 ='the second half';
  String y1_ar ='النصف الثانى';
  String yy_ar ='النصف الاول';
  String yy ='the first half';
  String yy1 ='the second half';
  String yy1_ar ='النصف الثانى';
  List x_ar = [
    'سجق',
    'لحمه',
    'سوسيس',
    'فراخ',
    'بسطرمه',
    'بسطرمه كيري',
    'سجق كيري',
    'رانش',
    'بياربكيو',
    'كيري',
    'موزيريلا',
    'سلامي',
    'تونه',
    'مشكل لحوم',
    'مشكل جبن',
    'خضراوات',
  ];
  List x1_ar = [
    'سجق',
    'لحمه',
    'سوسيس',
    'فراخ',
    'بسطرمه',
    'بسطرمه كيري',
    'سجق كيري',
    'رانش',
    'بياربكيو',
    'كيري',
    'موزيريلا',
    'سلامي',
    'تونه',
    'مشكل لحوم',
    'مشكل جبن',
    'خضراوات',
  ];
  List x = [
    'Sausage',
    'Meat',
    'Hotdog',
    'chicken',
    'pastrami',
    'pastrami kiri',
    'Sausage Kiri',
    'Ranch',
    'BBQ',
    'Kiri',
    'mozzarella',
    'Salami',
    'tuna',
    'Mix Meat',
    'Mix Cheese',
    'vegetables',
  ];

  List x1 = [
    'Sausage',
    'Meat',
    'Hotdog',
    'chicken',
    'pastrami',
    'pastrami kiri',
    'Sausage Kiri',
    'Ranch',
    'BBQ',
    'Kiri',
    'mozzarella',
    'Salami',
    'tuna',
    'Mix Meat',
    'Mix Cheese',
    'vegetables',
  ];
  List xx_ar = [
    'لوتس',
    'اوريو',
    'مكس شكولاته',
    'توت',
    'شكولاته بيضاء',
    'شكولاته سودا',
    'كاستر',
    'بغاشه',
    'قشطه وعسل',
    'سكر',
  ];
  List xx1_ar = [
    'لوتس',
    'اوريو',
    'مكس شكولاته',
    'توت',
    'شكولاته بيضاء',
    'شكولاته سودا',
    'كاستر',
    'بغاشه',
    'قشطه وعسل',
    'سكر',
  ];
  List xx = [
    'Lotus',
    'Oreo',
    'Mix Chocolate',
    'blueberry',
    'white chocolate',
    'black chocolate',
    'Caster',
    'Baghash',
    'cream and honey',
    'sugar',
  ];

  List xx1 = [
    'Lotus',
    'Oreo',
    'Mix Chocolate',
    'blueberry',
    'white chocolate',
    'black chocolate',
    'Caster',
    'Baghash',
    'cream and honey',
    'sugar',
  ];
  bool sweet =false;
  int index1=-1;
  int index2=-1;
  int index3=-1;
  int index= -1;
  int indexx1=-1;
  int indexx= -1;
  bool chickarea=false;
   bool s1 =true;
   bool s2 =false;
   bool s3 =false;
   bool ar=false;
   String collection_ar='';
  @override
  Widget build(BuildContext context) {
    final rec = ModalRoute.of(context)!.settings.arguments as Pass;
    if('${rec.collection}'=='Hawawshy'){
      collection_ar='حواوشي';
    }
    else if('${rec.collection}'=='Pizza'){
      collection_ar='بيتزا';
    }else if('${rec.collection}'=='Pies'){
      collection_ar='فطير حادق';
    }else if('${rec.collection}'=='Sweet Pie'){
      collection_ar='فطير حلو';
    }
    List<Items> _items = [
      Items(
          name: ar ==false?rec.name:rec.name_ar,
          price: double.parse(rec.price1),
          size: rec.size1,
          image: rec.image)
    ];

    return  OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepOrange[400],
                title: Center(
                  child: FittedBox(
                    child: Text(
                     ar==false ? rec.name:rec.name_ar,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          shadows: [BoxShadow(color: Colors.red, blurRadius: 15)]),
                    ),
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
              backgroundColor: Colors.deepOrange[300],
              body: ListView(
                children: [
                  Container(
                    height: 350,
                    child: Hero(
                      tag: rec.name,
                      child: ClipRRect(
                        child: Image.network(rec.image, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Container(
                    child: const Divider(
                      thickness: 3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 10,right: 10),
                    child:ar==false?  Text(
                      'Description :',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ): Text(
                      'الوصف :',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ar==false?  Container(
                    margin: EdgeInsets.only(right: 300, left: 10),
                    child: const Divider(
                      thickness: 2,
                    ),
                  ): Container(
                  margin: EdgeInsets.only(right: 10, left: 320),
                  child: const Divider(
                    thickness: 2,
                  ),
                ),

                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10,right: 10),
                    child: Text(
                     ar==false? rec.description:rec.description_ar,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [BoxShadow(color: Colors.black, blurRadius: 3)]),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 10,right: 10),
                    child: ar==false? Text(
                      'Ingredients :',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ):Text(
                      'المكونات :',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                 ar==false? Container(
                    margin: EdgeInsets.only(right: 300, left: 10),
                    child: const Divider(
                      thickness: 2,
                    ),
                  ): Container(
                   margin: EdgeInsets.only(right: 10, left: 310),
                   child: const Divider(
                     thickness: 2,
                   ),
                 ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child:
                    ar==false?
                    Wrap(
                      children: [
                        for (var item in rec.items)
                          Padding(
                            padding: const EdgeInsets.only(right: 2 ),
                            child: Chip(
                              avatar: CircleAvatar(
                                child: Text(
                                  item.substring(0, 1),
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.blue[200],
                              ),
                              label: Text(item),
                            ),
                          )
                      ],
                    ):
                    Wrap(
                      children: [
                        for (var item in rec.ingredients_ar)
                          Padding(
                            padding: const EdgeInsets.only(right: 2 ),
                            child: Chip(
                              avatar: CircleAvatar(
                                child: Text(
                                  item.substring(0, 1),
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.blue[200],
                              ),
                              label: Text(item),
                            ),
                          )
                      ],
                    ),
                  ),
                  rec.collection==('Pizza') || rec.collection=='Pies'?
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26, width: 1),
                            ),
                            margin: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 15),
                            child: ExpansionPanelList(
                              expansionCallback: (j, isopen) {
                                setState(() {
                                  if (index2 == j)
                                    index2 = -1;
                                  else
                                    index2 = j;
                                });
                              },
                              animationDuration: Duration(seconds: 1),
                              dividerColor: Colors.blue,
                              elevation: 2,
                              children: [
                                ExpansionPanel(
                                    headerBuilder:
                                        (BuildContext context, bool isExpanded) {
                                      return ListTile(
                                        title: Text(
                                          '${ar == false ? b1 : b1_ar}',
                                          style: const TextStyle(
                                              fontSize: 15, color: Colors.black),
                                        ),
                                      );
                                    },
                                    canTapOnHeader: true,
                                    body: SizedBox(
                                        height: 200,
                                        child: ar == false
                                            ? ListView.builder(
                                          itemCount: a1.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  b1 = a1[i].toString();
                                                  //sy1 = 'Area';
                                                  index2 = -1;
                                                });
                                              },
                                              title: Text('${a1[i]}'),
                                            );
                                          },
                                        )
                                            : ListView.builder(
                                          itemCount: a1_ar.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  b1_ar = a1_ar[i].toString();
                                                  // y1_ar = 'النصف الثاني';
                                                  index2 = -1;

                                                });
                                              },
                                              title: Text('${a1_ar[i]}'),
                                            );
                                          },
                                        )),
                                    isExpanded: index2 == 0,
                                    backgroundColor: Colors.white)
                              ],
                            ),
                          ),
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26, width: 1),
                            ),
                            margin: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 15),
                            child: ExpansionPanelList(
                              expansionCallback: (jj, isopen) {
                                setState(() {
                                  if (index3 == jj)
                                    index3 = -1;
                                  else
                                    index3 = jj;
                                });
                              },
                              animationDuration: Duration(seconds: 1),
                              dividerColor: Colors.blue,
                              elevation: 2,
                              children: [
                                ExpansionPanel(
                                    headerBuilder:
                                        (BuildContext context, bool isExpanded) {
                                      return ListTile(
                                        title: Text(
                                          '${ar == false ? b2 : b2_ar}',
                                          style: const TextStyle(
                                              fontSize: 15, color: Colors.black),
                                        ),
                                      );
                                    },
                                    canTapOnHeader: true,
                                    body: SizedBox(
                                        height: 200,
                                        child: ar == false
                                            ? ListView.builder(
                                          itemCount: a2.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  b2 = a2[i].toString();
                                                  //  y1 = 'Area';
                                                  index3 = -1;
                                                });
                                              },
                                              title: Text('${a2[i]}'),
                                            );
                                          },
                                        )
                                            : ListView.builder(
                                          itemCount: a2_ar.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  b2_ar = a2_ar[i].toString();
                                                  index3 = -1;
                                                });
                                              },
                                              title: Text('${a2_ar[i]}'),
                                            );
                                          },
                                        )),
                                    isExpanded: index3 == 0,
                                    backgroundColor: Colors.white)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):SizedBox(height: 0,),
                  rec.name==('Fahrenheit') || rec.name_ar=='فهرنهايت'?
                  Container(
                    margin: EdgeInsets.only(left: 100,right: 100),
                    child:const Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                  ):SizedBox(height: 0,),
                  rec.name==('Fahrenheit') || rec.name_ar=='فهرنهايت'? Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26, width: 1),
                            ),
                            margin: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 15),
                            child: ExpansionPanelList(
                              expansionCallback: (j, isopen) {
                                setState(() {
                                  if (index1 == j)
                                    index1 = -1;
                                  else
                                    index1 = j;
                                });
                              },
                              animationDuration: Duration(seconds: 1),
                              dividerColor: Colors.blue,
                              elevation: 2,
                              children: [
                                ExpansionPanel(
                                    headerBuilder:
                                        (BuildContext context, bool isExpanded) {
                                      return ListTile(
                                        title: Text(
                                          '${ar == false ? y : y_ar}',
                                          style: const TextStyle(
                                              fontSize: 15, color: Colors.black),
                                        ),
                                      );
                                    },
                                    canTapOnHeader: true,
                                    body: SizedBox(
                                        height: 200,
                                        child: ar == false
                                            ? ListView.builder(
                                          itemCount: x.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  y = x[i].toString();
                                                  //sy1 = 'Area';
                                                  index1 = -1;
                                                });
                                              },
                                              title: Text('${x[i]}'),
                                            );
                                          },
                                        )
                                            : ListView.builder(
                                          itemCount: x.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  y_ar = x_ar[i].toString();
                                                  // y1_ar = 'النصف الثاني';
                                                  index1 = -1;

                                                });
                                              },
                                              title: Text('${x_ar[i]}'),
                                            );
                                          },
                                        )),
                                    isExpanded: index1 == 0,
                                    backgroundColor: Colors.white)
                              ],
                            ),
                          ),
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26, width: 1),
                            ),
                            margin: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 15),
                            child: ExpansionPanelList(
                              expansionCallback: (j, isopen) {
                                setState(() {
                                  if (index == j)
                                    index = -1;
                                  else
                                    index = j;
                                });
                              },
                              animationDuration: Duration(seconds: 1),
                              dividerColor: Colors.blue,
                              elevation: 2,
                              children: [
                                ExpansionPanel(
                                    headerBuilder:
                                        (BuildContext context, bool isExpanded) {
                                      return ListTile(
                                        title: Text(
                                          '${ar == false ? y1 : y1_ar}',
                                          style: const TextStyle(
                                              fontSize: 15, color: Colors.black),
                                        ),
                                      );
                                    },
                                    canTapOnHeader: true,
                                    body: SizedBox(
                                        height: 200,
                                        child: ar == false
                                            ? ListView.builder(
                                          itemCount: x1.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  y1 = x1[i].toString();
                                                //  y1 = 'Area';
                                                  index = -1;
                                                });
                                              },
                                              title: Text('${x[i]}'),
                                            );
                                          },
                                        )
                                            : ListView.builder(
                                          itemCount: x1.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  y1_ar = x_ar[i].toString();
                                                  //   y1_ar = 'النصف الثاني';
                                                  index = -1;

                                                });
                                              },
                                              title: Text('${x1_ar[i]}'),
                                            );
                                          },
                                        )),
                                    isExpanded: index == 0,
                                    backgroundColor: Colors.white)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):SizedBox(height: 0,),
                  rec.name==('Fahrenheit sweet') || rec.name_ar=='فهرنهايت حلو'? Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26, width: 1),
                            ),
                            margin: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 15),
                            child: ExpansionPanelList(
                              expansionCallback: (j, isopen) {
                                setState(() {
                                  sweet=true;
                                  if (indexx1 == j)
                                    indexx1 = -1;
                                  else
                                    indexx1 = j;
                                });
                              },
                              animationDuration: Duration(seconds: 1),
                              dividerColor: Colors.blue,
                              elevation: 2,
                              children: [
                                ExpansionPanel(
                                    headerBuilder:
                                        (BuildContext context, bool isExpanded) {
                                      return ListTile(
                                        title: Text(
                                          '${ar == false ? yy : yy_ar}',
                                          style: const TextStyle(
                                              fontSize: 15, color: Colors.black),
                                        ),
                                      );
                                    },
                                    canTapOnHeader: true,
                                    body: SizedBox(
                                        height: 200,
                                        child: ar == false
                                            ? ListView.builder(
                                          itemCount: xx.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  sweet=true;
                                                  yy = xx[i].toString();
                                                  //yy1 = 'the s';
                                                  indexx1 = -1;
                                                });
                                              },
                                              title: Text('${xx[i]}'),
                                            );
                                          },
                                        )
                                            : ListView.builder(
                                          itemCount: xx.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  yy_ar = xx_ar[i].toString();
                                                  // y1_ar = 'النصف الثاني';
                                                  indexx1 = -1;

                                                });
                                              },
                                              title: Text('${xx_ar[i]}'),
                                            );
                                          },
                                        )),
                                    isExpanded: indexx1 == 0,
                                    backgroundColor: Colors.white)
                              ],
                            ),
                          ),
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26, width: 1),
                            ),
                            margin: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 15),
                            child: ExpansionPanelList(
                              expansionCallback: (j, isopen) {
                                setState(() {
                                  if (indexx == j)
                                    indexx = -1;
                                  else
                                    indexx = j;
                                });
                              },
                              animationDuration: Duration(seconds: 1),
                              dividerColor: Colors.blue,
                              elevation: 2,
                              children: [
                                ExpansionPanel(
                                    headerBuilder:
                                        (BuildContext context, bool isExpanded) {
                                      return ListTile(
                                        title: Text(
                                          '${ar == false ? yy1 : yy1_ar}',
                                          style: const TextStyle(
                                              fontSize: 15, color: Colors.black),
                                        ),
                                      );
                                    },
                                    canTapOnHeader: true,
                                    body: SizedBox(
                                        height: 200,
                                        child: ar == false
                                            ? ListView.builder(
                                          itemCount: xx1.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  yy1 = xx1[i].toString();
                                                 // yy1 = 'Area';
                                                  indexx = -1;
                                                });
                                              },
                                              title: Text('${xx[i]}'),
                                            );
                                          },
                                        )
                                            : ListView.builder(
                                          itemCount: xx1.length,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  yy1_ar = xx_ar[i].toString();
                                                  //   y1_ar = 'النصف الثاني';
                                                  indexx = -1;

                                                });
                                              },
                                              title: Text('${xx1_ar[i]}'),
                                            );
                                          },
                                        )),
                                    isExpanded: indexx == 0,
                                    backgroundColor: Colors.white)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):SizedBox(height: 0,),

                  Container(
                    margin: EdgeInsets.only(left: 100,right: 100),
                    child:const Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                  ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                        children: [
                          InkWell(
                            child:  FittedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: s1==true?Colors.white70:Colors.transparent
                                ),

                                margin: EdgeInsets.only(top: 5, left: 20,right: 20, bottom: 5),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 5, left: 0,bottom: 5),
                                        child: ar==false? Text(
                                          'Size :',
                                          style:
                                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ):Text(
                                          'الحجم :  ',
                                          style:
                                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5, left: 10,bottom: 5),
                                        child: Text(
                                          rec.size1 ,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              shadows: [
                                                BoxShadow(color: Colors.red, blurRadius: 15)
                                              ]),
                                        ),
                                      ),
                                      Container(
                                        child: FittedBox(
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(top: 5, left: 30,bottom: 5),
                                                child: ar==false? Text(
                                                  'Price :',
                                                  style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.bold),
                                                ): Text(
                                                  'السعر  :',
                                                  style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5, left: 10,bottom: 5),
                                                child: Text(
                                                  rec.price1,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                      shadows: [
                                                        BoxShadow(color: Colors.red, blurRadius: 15)
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
                            ),
                            onTap: (){
                              setState(() {
                                s1=true;
                                s2=false;
                              });
                            },
                          ),
                          SizedBox(height: 0,),
                          InkWell(
                            child:  FittedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: s2==true?Colors.white70:Colors.transparent
                                ),

                                margin: EdgeInsets.only(top: 5, left: 20,right: 20, bottom: 5),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0,left: 8.0),

                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 5, left: 0,bottom: 5),
                                        child: ar==false? Text(
                                          'Size :',
                                          style:
                                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ):Text(
                                          'الحجم :',
                                          style:
                                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5, left: 10,bottom: 5),
                                        child: Text(
                                          rec.size2,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              shadows: [
                                                BoxShadow(color: Colors.red, blurRadius: 7)
                                              ]),
                                        ),
                                      ),
                                      Container(
                                        child: FittedBox(
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(top: 5, left: 45,bottom: 5),
                                                child: ar==false? Text(
                                                  'Price :',
                                                  style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.bold),
                                                ): Text(
                                                  'السعر :',
                                                  style: TextStyle(
                                                      fontSize: 16, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5, left: 10,bottom: 5),
                                                child: Text(
                                                  rec.price2,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                      shadows: [
                                                        BoxShadow(color: Colors.red, blurRadius: 7)
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
                            ),
                            onTap: (){
                              setState(() {
                                s1=false;
                                s2=true;
                              });
                            },
                          ),
                        ],
                      )),

                      rec.collection=='Pies'?
                      Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(21),
                              ),
                              border: Border.all(color: Colors.black,width: 0.5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                        children: [
                              FittedBox(
                                child: Row(children: [
                                  Text('وش بيتزا'),
                                  Radio(
                                    value: 1,
                                    groupValue: val,
                                    onChanged: (value1) {
                                      setState(() {
                                        val = 1;
                                      });
                                    },
                                    activeColor: Colors.blue[100],
                                  ),
                                ],),
                              ),
                              FittedBox(
                                child: Row(children: [
                                  Text(' لا شئ   '),
                                  Radio(
                                    value: 2,
                                    groupValue: val,
                                    onChanged: (value1) {
                                      setState(() {
                                        val = 2;
                                      });
                                    },
                                    activeColor: Colors.blue[100],
                                  ),
                                ],),
                              ),
                        ],
                      ),
                            ),
                          )):SizedBox(height: 0,),

                    ],
                  ),
                ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<Cart>(builder: (context, cart, child) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            border: Border.all(color: Colors.white,width: 2),
                            boxShadow:[ BoxShadow(color: Colors.white,blurRadius: 10)],
                            borderRadius: BorderRadius.all(Radius.circular(20)),

                          ),
                          margin: const EdgeInsets.only(
                              left: 10,
                              right: 10
                          ),
                          width: 50,
                          height: 50,
                          child: IconButton(
                            onPressed: () {
                              cart.remove(cart.basketitems.last);
                              setState(() {
                                counter--;
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                        );
                      }),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black,width: 1),
                            boxShadow:[ BoxShadow(color: Colors.white70,blurRadius: 10)],
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        width: 80,
                        height: 50,
                        // margin: EdgeInsets.only(left: 27,right: 27),
                        child: Center(
                            child: Text(
                              counter.toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Consumer<Cart>(builder: (context, cart, child) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              border: Border.all(color: Colors.white,width: 2),
                              boxShadow:[ BoxShadow(color: Colors.white,blurRadius: 10)],
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          margin: const EdgeInsets.only(
                            left: 10,right: 10
                          ),
                          width: 50,
                          height: 50,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                cart.add(Items(
                                    name: '${ar==false?'${rec.collection} ':collection_ar} ' + '${ar==false?rec.name:rec.name_ar}'+' '+
                                        '${ar==false?(b1!='External meats'?b1:''):(b1_ar!='اضافه لحوم'?b1_ar:'')}'+' '+'${ar==false?(b2!='External cheese'?b2:''):(b2_ar!='اضافه جبن'?b2_ar:'')}',
                                    price: s1==true?double.parse('${ar==false?(b1!='External meats'?('${double.parse(rec.price1)+19.0}'):rec.price1):(b1_ar!='اضافه لحوم'?('${double.parse(rec.price1)+19.0}'):rec.price1)}')+double.parse('${ar==false?(b2!='External cheese'?('${16.0}'):0):(b2_ar!='اضافه جبن'?('${16.0}'):0)}')+double.parse('${val==1?10:0}')
                                        :double.parse('${ar==false?(b1!='External meats'?('${double.parse(rec.price2)+16.0}'):rec.price2):(b1_ar!='اضافه لحوم'?('${double.parse(rec.price2)+16.0}'):rec.price2)}')+double.parse('${ar==false?(b2!='External cheese'?('${12.0}'):0):(b2_ar!='اضافه جبن'?('${12.0}'):0)}')+double.parse('${val==1?6:0}')
                                    ,
                                    image: rec.image,
                                    size:sweet==false?'${ rec.name==('Fahrenheit') || rec.name_ar=='فهرنهايت'?(s1==true?'${rec.size1+' '+'${val==1?'وش بيتزا':''}'}'+'  '+
                                        '${ar==false?y +'/'+y1 :y_ar+'/'+y1_ar}':rec.size2+' '+'${val==1?'وش بيتزا':''}'+'  '+
                                        '${ar==false?y +'/'+y1 :y_ar+'/'+y1_ar}'):(s1==true?'${rec.size1+' '+'${val==1?'وش بيتزا':''}'}':'${rec.size2+' '+'${val==1?'وش بيتزا':''}'}')}':
                                    '${ rec.name==('Fahrenheit sweet') || rec.name_ar=='فهرنهايت حلو'?(s1==true?'${rec.size1}'+'  '+
                                        '${ar==false?yy +'/'+yy1 :yy_ar+'/'+yy1_ar}':rec.size2+'  '+
                                        '${ar==false?yy +'/'+yy1 :yy_ar+'/'+yy1_ar}'):(s1==true?rec.size1:rec.size2)}'
                                ));
                                setState(() {
                                  counter++;
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ));
          // rec.name==('Fahrenheit') || rec.name_ar=='فهرنهايت'?
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
                      child: Center(child: FittedBox(child: Text(' Please Connect to the network......  ',style: TextStyle(color: Colors.blue),)))),
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
