import 'package:expandable/expandable.dart';
import 'package:fahrenheit/UI/home1.dart';
import 'package:fahrenheit/UI/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../classs/user.dart';
import 'home.dart';

class Edit extends StatefulWidget {
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

  late DatabaseHandler1 handler1;
  List a1 = [];
  String _name1 = '';
  String _email1 = '';
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
    this.handler1 = DatabaseHandler1();
    this.handler1.initializeDB().whenComplete(() async {
      //    await this.addUsers();
      setState(() {});
    });
    select(1);
    // updateData(1,'Marwa','0107154854','porsaid_egypt');
    // updateDog(User1(id: 1, name: 'Marwa', address: 'Porsaied', phone: '0107154835', image: 'null'));
  }
  List edit=[];
  Future<void> updateDog(User1 dog) async {
    // Get a reference to the database.
    var db = await handler1.initializeDB();
    // Update the given Dog.
    await db.update(
      'user2',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }
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

  int index = -1;
  int index1 = -1;
  List x_ar = [
    'مدينه نصر',
    'هليوبلس',
    'مصر الجديده',
    'شيرتون',
    'مطار القاهره',
    'العباسيه',
    'المقطم',
    'المنشيه',
    'التجمع الاول',
  ];
  List x1_ar = [
    'زهراء',
    'الحي العاشر',
    'التيه',
    'مدينه الواحة',
    'مسجد السلام',
    'الوفاء والامل',
    'السراج مول',
    'انبي',
    'حديقه الطفل',
    'الحديقه الدوليه',
    'حي السفارات',
    'الحي السابع',
    'الحي السادس',
    'رابعه العدويه',
    'عباس العقاد',
    'مكرم عبيد',
    'احمد فخري',
    'المنهل',
    'الحي الثامن '
  ];
  List x = [
    'Nasr City',
    'Heliopolis',
    'Masr Al_Jadidah',
    'Sheraton',
    'Cairo international AirPort',
    'El-Abaseya',
    'Mansheya Nasir',
    'Al_Muqattam',
    'El_Tagamoa El_Awal',
  ];
  List x1 = ['Zhraa',
    'Al_Hay Al_Asher',
    'El_Waha',
    'El_Taba',
    'El Salam Mosque',
    'Al_Wafaa W Al Amal',
    'Al_Serag Mall',
    'Enppi',
    'The International Park',
    'El_Sefarat',
    'Al_Hay Al_Sab3',
    'Al_Hay Al_Sads',
    'Rabaa Al Adawia',
    'Abbas El_Akkad',
    'Makram Ebeid',
    'Child Park',
    'Ahmed Fakhry',
    'Elmahal',
    'Alhayy Ath Thamin'
  ];
  String y = 'City';
  String y_ar = 'المدينه';
  String y1 = 'Area';
  bool chickarea=false;
  String y1_ar = 'المنطقه';
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();
  TextEditingController n3 = TextEditingController();
  TextEditingController n4 = TextEditingController();
  TextEditingController n5 = TextEditingController();
  String address1 ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formstate,
        child:
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                Colors.indigoAccent,
                Colors.white,
                Colors.white,
                Colors.indigoAccent
              ])),
          child:
          ListView(
            children: [

              Container(
                margin: EdgeInsets.only(top: 90, left: 50, right: 50),
                child: Column(
                  children: [
                    Container(
                      child:  Text(
                       '${ar==false?'Update Profile':'تحديث الملف الشخصي '}' ,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                            shadows: [
                              BoxShadow(color: Colors.white, blurRadius: 15)
                            ]),
                      ),
                    ),
                    FittedBox(
                      child: Container(
                        width:280,
                        margin: EdgeInsets.only(top: 40, bottom: 15),
                        decoration: const BoxDecoration(
                          //  border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(40))),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26, width: 1.5),
                                  borderRadius: BorderRadius.all(Radius.circular(25))),
                              width: 70,
                              margin: const EdgeInsets.only(
                                  left: 5, right: 20, top: 5, bottom: 5),
                              child: Container(
                                margin: EdgeInsets.only(left: 6,right: 6),
                                child: TextFormField(
                                  validator: (text) {
                                    if (text!.isNotEmpty == true) {
                                      if (text!.length < 1) {
                                        return 'your address should be at less 1 number please try again !!!';
                                      } else if (text!.length > 5) {
                                        return 'your address should be at most 5 number please try again !!!';
                                      } else {
                                        return null;
                                      }
                                    } else {
                                      return 'Please enter your home....';
                                    }
                                  },
                                  controller: n1,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration:  InputDecoration(
                                    labelText: '41'.tr,
                                    // hintText:"2/****",
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26, width: 1.5),
                                  borderRadius: BorderRadius.all(Radius.circular(25))),
                              margin: EdgeInsets.only(right: 5,left: 5),
                              width: 70,
                              child: Container(
                                margin: EdgeInsets.only(left: 6,right: 6),
                                child: TextFormField(
                                  validator: (text) {
                                    if (text!.isNotEmpty == true) {
                                      if (text!.length < 1) {
                                        return 'your address should be at less 1 number please try again !!!';
                                      } else if (text!.length > 5) {
                                        return 'your address should be at most 5 number please try again !!!';
                                      } else {
                                        return null;
                                      }
                                    } else {
                                      return 'Please enter your floor....';
                                    }
                                  },
                                  controller: n2,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration:  InputDecoration(
                                    labelText: '40'.tr,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26, width: 1.5),
                                  borderRadius: BorderRadius.all(Radius.circular(25))),
                              margin: EdgeInsets.only(right: 5,left: 12),
                              width: 70,
                              child: Container(
                                margin: EdgeInsets.only(left: 6,right: 6),

                                child: TextFormField(
                                  validator: (text) {
                                    if (text!.isNotEmpty == true) {
                                      if (text!.length < 1) {
                                        return 'your address should be at less 1 number please try again !!!';
                                      } else if (text!.length > 5) {
                                        return 'your address should be at most 5 number please try again !!!';
                                      } else {
                                        return null;
                                      }
                                    } else {
                                      return 'Please enter your flat....';
                                    }
                                  },
                                  controller: n3,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration:  InputDecoration(
                                    // border: OutlineInputBorder(
                                    //     //  borderRadius: BorderRadius.circular(10.0),
                                    //     ),
                                    labelText: '39'.tr,
                                    //  hintText: 'flat',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      decoration:   BoxDecoration(
                        // border: Border.all(color: Colors.black26, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      margin: const EdgeInsets.only(left: 0, right: 0, top: 0,bottom: 15),
                      child: TextFormField(
                        validator: (text) {
                          if (text!.isNotEmpty == true) {
                            if (text!.length < 5) {
                              return 'your address should be at less 5 characters please try again !!!';
                            } else if (text!.length > 50) {
                              return 'your address should be at most 50 characters please try again !!!';
                            } else {
                              return null;
                            }
                          } else {
                            return 'Please enter your address....';
                          }
                        },
                        controller: n4,
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(color: Colors.deepOrange)
                          ),
                          labelText: '42'.tr,
                          // hintText: 'Street',
                          prefixIcon: Icon(Icons.house,),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      decoration:  const BoxDecoration(
                        // border: Border.all(color: Colors.black26, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      margin: const EdgeInsets.only(left: 0, right: 0, top: 0,bottom: 15),
                      child: TextFormField(
                        maxLength: 11,
                        validator: (text) {
                          if (text!.isNotEmpty == true) {
                            if (text!.length < 11) {
                              return 'your Phone should be  11 Number please try again !!!';
                            } else {
                              return null;
                            }
                          } else {
                            return 'Please enter your Phone....';
                          }
                        },
                        controller: n5,
                        keyboardType: TextInputType.number,
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              ),
                          labelText: '34'.tr,
                          prefixIcon: Icon(Icons.phone),
                        ),
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
                                            if (y == "Nasr City") {
                                              chickarea = true;
                                            } else {
                                              chickarea = false;
                                            }
                                            y = x[i].toString();
                                            y1 = 'Area';
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
                                            y1_ar = 'المنظقه';
                                            index1 = -1;
                                            if (y_ar == "مدينه نصر") {
                                              chickarea = true;
                                            } else {
                                              chickarea = false;
                                            }
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
                        expansionCallback: (i, isopen) {
                          setState(() {
                            if (index == i)
                              index = -1;
                            else
                              index = i;
                          });
                        },
                        animationDuration: Duration(seconds: 1),
                        dividerColor: Colors.grey,
                        elevation: 2,
                        children: [
                          ExpansionPanel(
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text('${ar == false ? y1 : y1_ar}',
                                      style: TextStyle(fontSize: 15)),
                                );
                              },
                              canTapOnHeader: true,
                              body: SizedBox(
                                  height: chickarea == false ? 100 : 300,
                                  child: ar == false
                                      ? ListView.builder(
                                    itemCount: chickarea == false
                                        ? 1
                                        : x1.length,
                                    itemBuilder:
                                        (BuildContext context, i) {
                                      return ListTile(
                                          onTap: () {
                                            setState(() {
                                              if (y == 'Nasr City') {
                                                y1 = x1[i].toString();
                                                index = -1;
                                              } else {
                                                y1 = y;
                                                index = -1;
                                              }
                                            });
                                          },
                                          title: y == 'Nasr City'
                                              ? Text('${x1[i]}')
                                              : Text(y));
                                    },
                                  )
                                      : ListView.builder(
                                    itemCount: chickarea == false
                                        ? 1
                                        : x1_ar.length,
                                    itemBuilder:
                                        (BuildContext context, i) {
                                      return ListTile(
                                          onTap: () {
                                            setState(() {
                                              if (y_ar ==
                                                  'مدينه نصر') {
                                                y1_ar = x1_ar[i]
                                                    .toString();
                                                index = -1;
                                              } else {
                                                y1_ar = y_ar;
                                                index = -1;
                                              }
                                            });
                                          },
                                          title: y_ar == 'مدينه نصر'
                                              ? Text('${x1_ar[i]}')
                                              : Text(y_ar));
                                    },
                                  )),
                              isExpanded: index == 0,
                              backgroundColor: Colors.white)
                        ],
                      ),
                    ),
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                          boxShadow: [
                          BoxShadow(color: Colors.black45, blurRadius: 4)]
                      ),
                      height: 45,
                      width: 150,
                      margin: EdgeInsets.only(top: 60),
                      child: RaisedButton(
                        onPressed: () {
                          var form2 = formstate.currentState;
                          if (form2!.validate() && ((y!='City' && y1!='Area')||(y_ar!='المدينه' && y1_ar!='المنظقه'))) {
                           address1 ='${ar==false? '${n1.text}'+'/'+'${n2.text}'+'/'+'${n3.text}'+'/'+'${n4.text}'+'/'+'${y1}'+'/'+'${y}': '${n1.text}'+'/'+'${n2.text}'+'/'+'${n3.text}'+'/'+'${n4.text}'+'/'+'${y1_ar}'+'/'+'${y_ar}'}';
                           print(address1);
                           updateDog(User1(id: 1, address: address1, phone: n5.text, image: 'null', name: _name1 ,email: _email1 ));
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                         }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'choose your city and area .....'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        child:  Text(
                          "55".tr,
                          style: TextStyle(color: Colors.brown,
                              shadows: [
                                BoxShadow(color: Colors.white, blurRadius: 10)
                              ]
                          ),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                      ),
                    )
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
