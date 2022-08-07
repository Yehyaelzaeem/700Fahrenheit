import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fahrenheit/UI/profile.dart';
import 'package:fahrenheit/UI/register1.dart';
import 'package:fahrenheit/classs/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../classs/user.dart';
import 'home1.dart';
import 'login.dart';

class Register2 extends StatefulWidget {
  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  int counter1 = 1;
  late DatabaseHandler1 handler1;
  List chick = [];
  String xx1 = '';
  String xx2 = '';
  String xx3 = '';
  String xx4 = '';

  Counter() async {
    CollectionReference e = FirebaseFirestore.instance.collection('Customer');
    await e.orderBy('id', descending: true).limit(1).get().then((value) => {
          value.docs.forEach((element) {
            counter1 = int.parse(element.id) + 1;
          })
        });
  }

  bool chickarea = false;

  Future<int> addUsers() async {
    if (chick == [] || chick.isEmpty || chick == null) {
      User1 firstUser = User1(
          id: 1,
          name: xx1,
          phone: xx2,
          address: address1,
          image: 'null',
          email: xx3);
      List<User1> listOfUsers = [firstUser];
      return await this.handler1.insertUser(listOfUsers);
    } else {
      User1 firstUser = User1(
          name: xx1, phone: xx2, address: address1, image: 'null', email: xx3);
      List<User1> listOfUsers = [firstUser];
      return await this.handler1.insertUser(listOfUsers);
    }
  }

  bool ar = false;

  @override
  void initState() {
    getlocation();
    Counter();
    if ("1".tr == "English") {
      setState(() {
        ar = true;
      });
    } else {
      setState(() {
        ar = false;
      });
    }
    super.initState();
    this.handler1 = DatabaseHandler1();
    this.handler1.initializeDB().whenComplete(() async {
      chick = await this.handler1.retrieveUsers();
      //    await this.addUsers();
      setState(() {});
    });
  }

  //************************
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

  List x1 = [
    'Zhraa',
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
    'Elmanhal',
    'Alhayy Ath Thamin'
  ];
  String y = 'City';
  String y_ar = 'المدينه';
  String y1 = 'Area';
  String y1_ar = 'المنطقه';
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();
  TextEditingController n3 = TextEditingController();
  TextEditingController n4 = TextEditingController();
  TextEditingController n5 = TextEditingController();
  String address1 = '';
  FirebaseAuth instance1 = FirebaseAuth.instance;
  var lat;
  var long;
  Position? c;

  Future<void> getlocation() async {
    c = await Geolocator.getCurrentPosition().then((value) => value);
    lat = c?.latitude;
    long = c?.longitude;
  }

  bool f = false;

  @override
  Widget build(BuildContext context) {
    final reg = ModalRoute.of(context)!.settings.arguments as Registerclass;
    setState(() {
      xx1 = reg.name;
      xx2 = reg.phone;
      xx3 = reg.email;
      xx4 = reg.password;
    });
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: ClipPath(
                        clipper: WaveClipperOne(
                          flip: true,
                        ),
                        child: Container(
                          color: Colors.lightBlueAccent[400],
                          child: Center(child: animated()),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 4, child: Container()),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 50,
                            child: WaveWidget(
                              //user Stack() widget to overlap content and waves
                              config: CustomConfig(
                                colors: [
                                  Colors.blue[800]!.withOpacity(0.3),
                                  Colors.white.withOpacity(0.3),
                                  Colors.blue[600]!.withOpacity(0.3),
                                ],
                                durations: [4000, 5000, 7000],
                                heightPercentages: [0.01, 0.05, 0.03],
                                blur: MaskFilter.blur(BlurStyle.solid, 5),
                              ),
                              waveAmplitude: 35.00,
                              //depth of curves
                              waveFrequency: 1,
                              //number of curves in waves
                              backgroundColor: Colors.blue[50],
                              //background colors
                              size: const Size(
                                double.infinity,
                                double.infinity,
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: 30, left: 0, right: 0),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Form(
                  key: formstate,
                  child: FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 280,
                          margin: EdgeInsets.only(top: 15, bottom: 15),
                          decoration: const BoxDecoration(
                              //  border: Border.all(color: Colors.black, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black26, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                width: 70,
                                margin: EdgeInsets.only(
                                    left: 5, right: 12, top: 5, bottom: 5),
                                child: Container(
                                  margin: EdgeInsets.only(left: 6, right: 6),
                                  child: TextFormField(
                                    validator: (text) {
                                      if (text!.isNotEmpty == true) {
                                        if (text!.length > 5) {
                                          return 'your address should be at most 5 number please try again !!!';
                                        } else {
                                          return null;
                                          git add .                }
                                      } else {
                                        return (ar == false
                                            ? 'Please enter your home....'
                                            : "اخل رقم المنزل");
                                      }
                                    },
                                    controller: n1,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      labelText: "41".tr,
                                      // hintText:"2/****",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black26, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                margin: EdgeInsets.only(right: 5, left: 5),
                                width: 70,
                                child: Container(
                                  margin: EdgeInsets.only(left: 6, right: 6),
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
                                        return (ar == false
                                            ? 'Please enter your floor....'
                                            : "اخل رقم الدور..");
                                      }
                                    },
                                    controller: n2,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     //  borderRadius: BorderRadius.circular(10.0),
                                      //     ),
                                      labelText: '40'.tr,
                                      //hintText: 'floor',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black26, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                margin: EdgeInsets.only(right: 5, left: 12),
                                width: 70,
                                child: Container(
                                  margin: EdgeInsets.only(left: 6, right: 6),
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
                                        return (ar == false
                                            ? 'Please enter your flat....'
                                            : "اخل رقم الشقه");
                                      }
                                    },
                                    controller: n3,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
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
                        Container(
                          width: 250,
                          decoration: const BoxDecoration(
                              // border: Border.all(color: Colors.black26, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          margin: const EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 15),
                          child: TextFormField(
                            validator: (text) {
                              if (text!.isNotEmpty == true) {
                                if (text!.length < 5) {
                                  return (ar == false
                                      ? 'your address should be at less 5 characters please try again !!!'
                                      : "يجب ان يكون اسم الشارع على الاقل من 5 حروف حاول مره اخري  ");
                                } else if (text!.length > 50) {
                                  return (ar == false
                                      ? 'your address should be at most 50 characters please try again !!!'
                                      : "يجب ان يكون اسم الشارع/العنوان اقل من 50 حرف حاول مره اخري ....");
                                } else {
                                  return null;
                                }
                              } else {
                                return (ar == false
                                    ? 'Please enter your street....'
                                    : "ادخل اسم الشارع ....");
                              }
                            },
                            controller: n4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  borderSide:
                                      BorderSide(color: Colors.deepOrange)),
                              labelText: '42'.tr,
                              // hintText: 'Street',
                              prefixIcon: Icon(
                                Icons.house,
                              ),
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
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: const Divider(
                                  thickness: 1,
                                  color: Colors.black12,
                                ),
                                width: 100,
                              ),
                              Container(
                                child: Text('  OR  '),
                              ),
                              Container(
                                child: const Divider(
                                  thickness: 1,
                                  color: Colors.black12,
                                ),
                                width: 100,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              //  color: Colors.blue
                            ),
                            width: 150,
                            child: FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.location_on,
                                        size: 30,
                                        color: Colors.blue[800],
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: FittedBox(
                                        child: Text(
                                          "43".tr,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.blue[800]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () async {
                            f = true;
                            List<Placemark> pc =
                                await placemarkFromCoordinates(lat, long);
                            address1 = 'Location' +
                                ":" +
                                '${pc[0].subThoroughfare}' +
                                "/" +
                                "${pc[0].street}" +
                                '/' +
                                '${pc[0].subLocality}' +
                                '/' +
                                '${pc[0].locality}' +
                                '/' +
                                '${pc[0].subAdministrativeArea}' +
                                '/' +
                                '${pc[0].administrativeArea}';

                            if (address1 == '' || address1 == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text(
                                      'Error for Location now please enter your address'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('location is success'),
                                  backgroundColor: Colors.blue,
                                ),
                              );
                            }
                            print(address1);
                            print(lat);
                            print(long);
                          },
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 2)
                              ]),
                          height: 45,
                          width: 180,
                          margin: EdgeInsets.only(top: 60, bottom: 50),
                          child: RaisedButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            onPressed: () async {
                              var form2 = formstate.currentState;
                              if (f == false) {
                                print('yes');
                                if (form2!.validate() &&
                                    ((y != 'City' && y1 != 'Area') ||
                                        (y_ar != 'المدينه' &&
                                            y1_ar != 'المنطقه'))) {
                                  print('yes');
                                  address1 = ar == false
                                      ? '${n1.text}' +
                                          '/' +
                                          '${n2.text}' +
                                          '/' +
                                          '${n3.text}' +
                                          '/' +
                                          '${n4.text}' +
                                          '/' +
                                          '${y1}' +
                                          '/' +
                                          '${y}'
                                      : '${'${n1.text}' + '/' + '${n2.text}' + '/' + '${n3.text}' + '/' + '${n4.text}' + '/' + '${y1_ar}' + '/' + '${y_ar}'}';
                                  print(address1);
                                  Counter();
                                  try {
                                    if (counter1 != null) {
                                      print(counter1);
                                      UserCredential userCredential =
                                          await instance1
                                              .createUserWithEmailAndPassword(
                                                  email: reg.email,
                                                  password: reg.password);
                                      FirebaseFirestore.instance
                                          .collection('Customer')
                                          .doc(counter1.toString())
                                          .set(<String, dynamic>{
                                        'Name': reg.name,
                                        'Mobile_phone': reg.phone,
                                        'Address': address1,
                                        'Username': reg.email,
                                        'Password': reg.password,
                                        'Image': 'null',
                                        'id': counter1,
                                        'lat': lat,
                                        'long': long
                                      });
                                      addUsers();

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => Login()));
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1), content: Text('Sign Up S uccess'),
                                        backgroundColor: Colors.blue,
                                      ));
                                      await FirebaseMessaging.instance
                                          .subscribeToTopic('yehya');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1),
                                        content: Text('Waiting please......'),
                                        backgroundColor: Colors.yellowAccent,
                                      ));
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1),
                                        content: Text(
                                            'The password provided is too weak.'),
                                        backgroundColor: Colors.red,
                                      ));
                                      Navigator.pop(context);
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(duration: Duration(seconds: 1), content: Text(
                                            'The account already exists for that email'),
                                        backgroundColor: Colors.red,
                                      ));
                                      Navigator.pop(context);
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(seconds: 1),
                                    content: Text(
                                        ' Please choose your address n/n/n and street city and area .....'),
                                    backgroundColor: Colors.red,
                                  ));
                                }
                              } else {
                                Counter();
                                try {

                                  if (counter1 != null) {
                                    print(counter1);
                                    UserCredential userCredential =
                                        await instance1.createUserWithEmailAndPassword(
                                                email: reg.email.trim(),
                                                password: reg.password.trim());
                                    FirebaseFirestore.instance
                                        .collection('Customer')
                                        .doc(counter1.toString())
                                        .set(<String, dynamic>{
                                      'Name': reg.name,
                                      'Mobile_phone': reg.phone,
                                      'Address': address1,
                                      'Username': reg.email,
                                      'Password': reg.password,
                                      'Image': 'null',
                                      'id': counter1,
                                      'lat': lat,
                                      'long': long
                                    });
                                    addUsers();
                                    await FirebaseMessaging.instance
                                        .subscribeToTopic('yehya');
                                    Get.off(Login());
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text('Sign Up success'),
                                      backgroundColor: Colors.blue,
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text('Waiting please......'),
                                      backgroundColor: Colors.yellowAccent,
                                    ));
                                  }
                                }
                                on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                          'The password provided is too weak.'),
                                      backgroundColor: Colors.red,
                                    ));
                                    Navigator.pop(context);
                                  }
                                  else if (e.code == 'email-already-in-use') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                          'The account already exists for that email'),
                                      backgroundColor: Colors.red,
                                    ));
                                    Navigator.pop(context);
                                  }
                                  else{
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                          'This email or password is failed , please try again'),
                                      backgroundColor: Colors.red,
                                    ));
                                    Navigator.pop(context);
                                  }
                                } catch (e) {
                                  print(e);

                                }
                              }
                            },
                            child: Text(
                              '44'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.black26, blurRadius: 5)
                                  ]),
                            ),
                            color: Colors.lightBlueAccent[400],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
