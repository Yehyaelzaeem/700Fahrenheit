import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  late String id;

  late List orderid = [];
  List Items = [];
  List customerid = [];

  // getcustomerdata(int n) {
  //   var y = FirebaseFirestore.instance.collection('Customer');
  //   y.where('id', isEqualTo: n.toString()).get().then((value) => {
  //         value.docs.forEach((element) {
  //           print('================cus name ===========');
  //           print('${element.data()['Name']}');
  //           print('${element.data()['id']}');
  //           setState(() {
  //             customerid.add({
  //               'Customer id': element.data()['id'],
  //               'Customer name': element.data()['Name'],
  //               'Customer Phone': element.data()['Mobile_phone'],
  //               'Customer Address': element.data()['Address'],
  //             });
  //           });
  //         })
  //       });
  // }
  //
  // get_order_data() async {
  //   var a = FirebaseFirestore.instance.collection('Orders');
  //   await a.get().then((value) => {
  //         value.docs.forEach((element) {
  //          print(element["id"]);
  //          print(element["items"]);
  //          print(element["total_price"]);
  //          print(element["date"]);
  //         })
  //       });
  // }

  bool flag = false;
  bool flag1 = false;

  void initState() {
    //getorderdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference x = FirebaseFirestore.instance.collection('Orders');
    //CollectionReference xx = FirebaseFirestore.instance.collection('Customer');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Container(
            margin: EdgeInsets.only(left: 100),
            child: Text('Show all data'),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 90),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    print(customerid);
                    print(orderid);
                    flag = true;
                    flag1 = true;
                  });
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[400],
        body: StreamBuilder(
          stream: x.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          boxShadow: [
                            BoxShadow(color: Colors.white, blurRadius: 7)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.black, width: 3)),
                      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        color: Colors.blue[100],
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 3, right: 0, left: 0),
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 0),
                                      width: 110,
                                      child: FittedBox(
                                        child: Text(
                                          'Customer Details',
                                          style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            top: 0,
                                            right: 0,
                                            left: 0,
                                            bottom: 16),
                                        height: 20,
                                        width: 20,
                                        child: Center(
                                            child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              flag1 = true;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.person,
                                            size: 20,
                                          ),
                                        ))),
                                  ],
                                ),
                              ),
                            ),
                            flag1 == true
                                ? Container(
                                    margin:
                                        EdgeInsets.only(top: 15, bottom: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[400],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        border: Border.all(
                                            color: Colors.white, width: 3),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 7)
                                        ]),
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      width: 250,
                                      height: 200,
                                      color: Colors.blue[400],
                                      child: ListView.builder(
                                          itemCount: snapshot
                                              .data?.docs[i]['Customer'].length,
                                          itemBuilder: (context, x) {
                                            return Container(
                                              width: 200,
                                              margin: EdgeInsets.all(5),
                                              // color: Colors.blue[100],
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: FittedBox(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 70,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 8),
                                                            child: Text(
                                                              'Name :   ',
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 170,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 8),
                                                            child: Text(
                                                              '${snapshot.data?.docs[i]['Customer'][x]['name']}  ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .blue[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12),
                                                            ),
                                                          )
                                                        ],
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: FittedBox(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 70,
                                                            margin:
                                                                EdgeInsets.only(
                                                              top: 10,
                                                            ),
                                                            child: Text(
                                                              'Phone:  ',
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 170,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 20,
                                                                    right: 0),
                                                            child: Text(
                                                                '${snapshot.data?.docs[i]['Customer'][x]['phone']}  ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .blue[
                                                                        100],
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        12)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: FittedBox(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 80,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10),
                                                            child: Text(
                                                              'Address :  ',
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 190,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 20),
                                                            child: Text(
                                                                '${snapshot.data?.docs[i]['Customer'][x]['address']}  ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .blue[
                                                                        100],
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        12),
                                                                // maxLines: 10
                                                                //overflow: TextOverflow.ellipsis,
                                                                ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: FittedBox(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 70,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 20,
                                                                    bottom: 20),
                                                            child: Text(
                                                              'Email :  ',
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 170,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 20),
                                                            child: Text(
                                                              '${snapshot.data?.docs[i]['Customer'][x]['email']}  ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .blue[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12),
                                                              maxLines: 3,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Row(
                                children: [
                                  Container(
                                    width: 70,
                                    child: FittedBox(
                                      child: Text(
                                        'Order_id :',
                                        style: TextStyle(
                                            color: Colors.blue[800],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,

                                      child: Text(
                                          '${snapshot.data?.docs[i]['id']}'),
                                    
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    child: FittedBox(
                                      child: Text(
                                        'Date : ',
                                        style: TextStyle(
                                            color: Colors.blue[800],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    child: FittedBox(
                                      child: Text(
                                          '${snapshot.data?.docs[i]['Date ']}'),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 40,
                                    child: FittedBox(
                                      child: Text(
                                          '${snapshot.data?.docs[i]['Time ']}'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 3, right: 0, left: 0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 0),
                                    width: 38,
                                    child: FittedBox(
                                      child: Text(
                                        'Items',
                                        style: TextStyle(
                                            color: Colors.blue[800],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 0,
                                          right: 0,
                                          left: 0,
                                          bottom: 10),
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                          child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            flag1 = true;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.checklist_sharp,
                                          size: 20,
                                          color: Colors.deepOrange,
                                        ),
                                      ))),
                                ],
                              ),
                            ),
                            flag1 == true
                                ? Container(
                                    margin:
                                        EdgeInsets.only(top: 15, bottom: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[400],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        border: Border.all(
                                            color: Colors.white, width: 3),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 7)
                                        ]),
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      width: 250,
                                      height: 200,
                                      color: Colors.blue[400],
                                      child: ListView.builder(
                                          itemCount: snapshot
                                              .data?.docs[i]['Items'].length,
                                          itemBuilder: (context, x) {
                                            return Container(
                                              margin: EdgeInsets.only(top: 8),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue[100],
                                                  border: Border.all(
                                                    color: Colors.black,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(13))),
                                              child: Container(
                                                margin: EdgeInsets.all(5),
                                                color: Colors.blue[100],
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: FittedBox(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Text(
                                                                  '(${x + 1})  '),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                  '${snapshot.data?.docs[i]['Items'][x]['item_name']}  '),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: FittedBox(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.only(
                                                                      left: 40),
                                                              child: Text(
                                                                  'size :  '),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                  '${snapshot.data?.docs[i]['Items'][x]['item_size']}  '),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: FittedBox(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.only(
                                                                      left: 40),
                                                              child: Text(
                                                                  'price : '),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                  '${snapshot.data?.docs[i]['Items'][x]['item_price']}  '),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  )
                                : Text(''),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Row(
                                children: [
                                  Container(
                                    width: 85,
                                    child: FittedBox(
                                      child: Text(
                                        'Total_Items :',
                                        style: TextStyle(
                                            color: Colors.blue[800],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                        '${snapshot.data?.docs[i]['Quantity ']}'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    child: FittedBox(
                                      child: Text(
                                        'Total Price : ',
                                        style: TextStyle(
                                            color: Colors.blue[800],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                        '${snapshot.data?.docs[i]['Total_Price']}'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text("Errors in snapshot"));
            } else if (snapshot.connectionState == ConnectionState) {
              return Center(child: Text("Loading....."));
            }
            return Center(child: Text("Loading....."));
          },
        ));
  }
}
