import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fahrenheit/UI/login.dart';
import 'package:fahrenheit/UI/register2.dart';
import 'package:fahrenheit/classs/register.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../classs/user.dart';
import 'myorders.dart';
import 'profile.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Widget animated() {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 20.0,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(
            'Sign In',
            textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Colors.white,
                shadows: [BoxShadow(color: Colors.black26, blurRadius: 4)]),
          )
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }

  //*******************************************************
  late File file;
  late String path1;
  String path2 = 'null';
  var imagepicker = ImagePicker();
  uploadimage() async {
    var x = await imagepicker.getImage(source: ImageSource.gallery);
    if (x != null) {
      file = File(x.path);
      var nameimage = basename(x.path);
      var r = Random().nextInt(1000000);
      var refstorge =
          FirebaseStorage.instance.ref('Customer_Images/${n1.text}$r');
      await refstorge.putFile(file);
      path1 = await refstorge.getDownloadURL();
      setState(() {
        path2 = path1;
      });
      return path1;
      print('=======================');
      print(path1);
    } else {
      return null;
      print('choose image');
    }
  }

  // uploadimage2() async {
  //   var x = await imagepicker.getImage(source: ImageSource.camera);
  //   if (x != null) {
  //     file = File(x.path);
  //     var nameimage = basename(x.path);
  //     var r = Random().nextInt(1000000);
  //     var refstorge =
  //         FirebaseStorage.instance.ref('Customer_Images/${n1.text}$r');
  //     await refstorge.putFile(file);
  //     path1 = await refstorge.getDownloadURL();
  //     print('=======================');
  //     print(path1);
  //     if (path1 != '' || path1 != null || path1.isNotEmpty) {
  //       setState(() {
  //         f1 = true;
  //       });
  //     }
  //   } else {
  //     print('choose image');
  //   }
  // }
//***************************************
  bool ar =false;
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
    }}
  TextEditingController n2 = TextEditingController();
  TextEditingController n1 = TextEditingController();
  TextEditingController n3 = TextEditingController();
  TextEditingController n4 = TextEditingController();
  TextEditingController n5 = TextEditingController();
  TextEditingController n6 = TextEditingController();
  TextEditingController n7 = TextEditingController();
  TextEditingController n8 = TextEditingController();
  String x = 'yes';
  bool _show = false;
  bool f = false;
  bool f1 = false;
  GlobalKey<FormState> formstate = GlobalKey();
  FirebaseAuth instance1 = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
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
                            color: Colors.blue[400],
                            child: Center(child: animated()
                                ),
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
                                    Colors.blue[300]!.withOpacity(0.3),
                                    Colors.blue[400]!.withOpacity(0.3),
                                    Colors.blue[800]!.withOpacity(0.3),
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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formstate,
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 280,
                              margin: EdgeInsets.only(left: 0, right: 0, top: 120),
                              child: TextFormField(
                                validator: (text) {
                                  if (text!.isNotEmpty == true) {
                                    if (text!.length < 4) {
                                      return (ar==false?'your name should be at less 4 characters please try again !!!':"يجب ان يكون الاسم اقل شئ 4 حروف حاول مره اخري ..");
                                    } else if (text!.length > 16) {
                                      return (ar==false?'your name should be at most 16 characters please try again !!!':"يجب ان يكون الاسم اكبر شئ 16 حرف حاول مره اخري....");
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return (ar==false?'Please enter your name....':" ادخل الاسم.... ");
                                  }
                                },
                                controller: n1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  labelText: '33'.tr,
                                  prefixIcon: const Icon(Icons.person),
                                ),
                              ),
                            ),
                            Container(
                              width: 280,
                              margin:
                                  const EdgeInsets.only(left: 0, right: 0, top: 20),
                              child: TextFormField(
                                maxLength: 11,
                                validator: (text) {
                                  if (text!.isNotEmpty == true) {
                                    if (text!.length < 11) {
                                      return (ar==false?'your Phone should be  11 Number please try again !!!':"يجب ان يكون رقم الموبيل لا يقل عن 11 رقم ولا يكثر حاول مره اخري....");
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return (ar==false?'Please enter your Phone....':"ادخل رقم الموبيل...");
                                  }
                                },
                                controller: n2,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  labelText: '34'.tr,
                                  prefixIcon: const Icon(Icons.phone),
                                ),
                              ),
                            ),
                            Container(
                              width: 280,
                              margin:
                                  const EdgeInsets.only(left: 0, right: 0, top: 0),
                              child: TextFormField(
                                validator: (text) {
                                  if (text!.isNotEmpty == true) {
                                    if (text!.length < 15) {
                                      return (ar==false? 'your Email should be at less  15 char please try again !!!':"يجب ان يكون الايميل على الاقل 15 حرف حاول مره اخري");
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return (ar==false?'Please enter your Email....':"ادخل الايميل ....");
                                  }
                                },
                                controller: n3,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  labelText: "35".tr,
                                  prefixIcon: const Icon(Icons.email),
                                ),
                              ),
                            ),
                            Container(
                              width: 280,
                              margin:
                                  const EdgeInsets.only(left: 0, right: 0, top: 20),
                              child: TextFormField(
                                validator: (text) {
                                  if (text!.isNotEmpty == true) {
                                    if (text!.length < 8) {
                                      return (ar==false?'your Password should be at less 8 Number please try again !!!':"يجب ان يكون الرقم السري على الاقل 8 ارقام حاول مره اخري ....");
                                    } else if (text!.length > 15) {
                                      return (ar==false?'your Password should be at most 15 Number please try again !!!':"يجب ان يكون الرقم السري على الاكثر 15 رقم حاول مره اخري....");
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return (ar==false?'Please enter your Password....':"ادخل الرقم السري من فضلك...");
                                  }
                                },
                                controller: n4,
                                keyboardType: TextInputType.number,
                                obscureText: !this._show,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    labelText: '36'.tr,
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            this._show = !this._show;
                                          });
                                        },
                                        icon: const Icon(Icons.remove_red_eye),
                                        color: this._show
                                            ? Colors.blue
                                            : Colors.grey)),
                              ),
                            ),
                            Container(
                              width: 280,
                              margin:
                                  const EdgeInsets.only(left: 0, right: 0, top: 20),
                              child: TextFormField(
                                validator: (text) {
                                  if (text!.isNotEmpty == true) {
                                    if (text != n4.text) {
                                      return (ar==false?'your password not matching please try again !!!':"عفوا هذا الرقم لا ينطبق مع الرقم السري حاول مره اخري ....");
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return(ar==false? 'Please enter your Password....':"ادخل الرقم السري من فضلك...");
                                  }
                                },
                                controller: n5,
                                keyboardType: TextInputType.number,
                                obscureText: !this._show,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    labelText: '37'.tr,
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            this._show = !this._show;
                                          });
                                        },
                                        icon: const Icon(Icons.remove_red_eye),
                                        color: this._show
                                            ? Colors.blue
                                            : Colors.grey)),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black, blurRadius: 5)
                                  ]),
                              width: 200,
                              margin: const EdgeInsets.only(
                                  left: 0, right: 0, top: 60, bottom: 0),
                              child: RaisedButton(
                                onPressed: () async {
                                  if ( formstate.currentState!.validate()) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Register2(),
                                        settings:RouteSettings(
                                          arguments: Registerclass(password: n5.text , phone: n2.text, name: n1.text, email: n3.text)
                                        ) ));
                                  }
                                },
                                child:  Text(
                                  '38'.tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  //     side: BorderSide(color: Colors.white),
                                ),
                                color: Colors.blue,
                              ),
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
