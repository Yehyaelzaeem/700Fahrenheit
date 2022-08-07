import 'package:fahrenheit/UI/request_order.dart';
import 'package:fahrenheit/forget_password/forget_phone.dart';
import 'package:fahrenheit/UI/register1.dart';
import 'package:fahrenheit/locale_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../classs/user.dart';
import '../forget_password/forget.dart';
import 'home.dart';
import 'profile.dart';
import 'home1.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth instance = FirebaseAuth.instance;
  bool _show = false;
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  FirebaseAuth instance1 = FirebaseAuth.instance;
  late DatabaseHandler1 handler1;
  String _email = 'null';
  String _name = 'null';
  String _phone = 'null';
  List chick = [];

  @override
  void initState() {
    if(mounted){
      setState(() {
        getpermission();
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

  Future<int> addUsers() async {
    if (chick == [] || chick.isEmpty || chick == null) {
      User1 firstUser = User1(
          id: 1,
          name: _name,
          phone: _phone,
          address: 'login_google',
          image: 'login_google',
          email: _email);
      List<User1> listOfUsers = [firstUser];
      return await this.handler1.insertUser(listOfUsers);
    } else {
      User1 firstUser = User1(
          name: _name,
          phone: _phone,
          address: 'login_google',
          image: 'login_google',
          email: _email);
      List<User1> listOfUsers = [firstUser];
      return await this.handler1.insertUser(listOfUsers);
    }
  }


  Future getpermission() async {
    bool services;
    LocationPermission permission;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      print('false');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      return permission;
    }
  }

  GlobalKey<FormState> formstate = GlobalKey();
  bool e = false;

  @override
  Widget build(BuildContext context) {
    MylocaleController controller = Get.put(MylocaleController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white,
                    Colors.white,
                    Colors.lightBlueAccent
                  ])),
            ),
            Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  child: Form(
                    key: formstate,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Translation*********************************************
                          Container(
                            width: MediaQuery.of(context).size.width,
                             alignment: e==false?Alignment.topRight:Alignment.topLeft,
                            margin: EdgeInsets.only(top: 30,right: 10,left: 10),
                            child: TextButton(
                              child: Text("1".tr,style: TextStyle(color: Colors.black,fontSize: 20),),
                              onPressed: () {
                                if("1".tr =="عربي"){
                                  setState(() {
                                    e=true;
                                  });
                                  controller.Changelocale("ar");
                                }
                                else{
                                  setState(() {
                                    e=false;
                                  });
                                  controller.Changelocale("en");
                                }


                              }
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 90, right: 90),
                            child: Container(
                                child: Image.asset(
                              'assets/ff.jpg',
                              fit: BoxFit.cover,
                            )),
                          ),
                          Container(
                            width: 280,
                            margin: EdgeInsets.only(left: 0, right: 0, top: 50),
                            child: TextFormField(
                              validator: (text) {
                                if (text!.isNotEmpty == true) {
                                  if (text!.length < 15) {
                                    return 'your Email should be at less  15 char please try again !!!';
                                  } else {
                                    return null;
                                  }
                                } else {
                                  return 'Please enter your Email....';
                                }
                              },
                              controller: n1,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  labelText: "2".tr,
                                  prefixIcon: const Icon(Icons.email)),
                            ),
                          ),
                          Container(
                            width: 280,
                            margin: const EdgeInsets.only(
                                left: 0, right: 0, top: 30),
                            child: TextFormField(
                              validator: (text) {
                                if (text!.isNotEmpty == true) {
                                  if (text!.length < 8) {
                                    return 'your Password should be at less 8 Number please try again !!!';
                                  } else if (text!.length > 15) {
                                    return 'your Password should be at most 15 Number please try again !!!';
                                  } else {
                                    return null;
                                  }
                                } else {
                                  return 'Please enter your Password....';
                                }
                              },
                              controller: n2,
                              keyboardType: TextInputType.number,
                              obscureText: !this._show,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          width: 1, style: BorderStyle.solid)),
                                  labelText: "3".tr,
                                  prefixIcon: const Icon(Icons.lock),
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
                            width: 200,
                            margin: const EdgeInsets.only(
                                left: 0, right: 0, top: 10),
                            child: TextButton(
                              onPressed: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Center(child: Text('Reset Password')),
                                          content: Container(
                                            height: 330,
                                            child: FittedBox(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Image.asset(
                                                      'assets/forget.gif',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      'Choose the way of the reset password for Email or Phone ?',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(30))
                                              ),
                                              color: Colors.green,
                                              textColor: Colors.white,
                                              child: Text('Email'),
                                              onPressed: () {
                                                setState(() {
                                                //  Get.to(Forget());
                                                  Get.to(Forget());
                                                });
                                              },
                                            ),
                                            FlatButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(30))
                                              ),
                                              color: Colors.green,
                                              textColor: Colors.white,
                                              child: Text('Phone'),
                                              onPressed: () {
                                                setState(() {
                                                  Get.to(Forget_mobile());
                                                });
                                              },
                                            ),

                                          ],
                                        ));
                              },
                              child: Text("4".tr,style: TextStyle(
                              //  fontSize: ScreenUtil.getInstance().setSp(24),
                              ),),
                            ),
                          ),
                          Container(
                            width: 180,
                            margin: const EdgeInsets.only(
                                left: 0, right: 0, top: 20),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 20)
                                ]),
                            child: RaisedButton(
                              onPressed: () async
                              {
                                // try {
                                //   UserCredential cre = await instance1.signInWithEmailAndPassword(
                                //       email: n1.text.trim(),
                                //       password: n2.text.trim()
                                //   );
                                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                                //   await FirebaseMessaging.instance
                                //       .subscribeToTopic('yehya');
                                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The Login is success'),
                                //     backgroundColor: Colors.blue,
                                //   ));
                                //
                                // } on FirebaseAuthException catch (e) {
                                //   if (e.code == 'user-not-found') {
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(const SnackBar(content: Text('the user not found'),
                                //       backgroundColor: Colors.red,
                                //     ));
                                //   } else if (e.code == 'wrong-password') {
                                //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                //       content: Text('The account already exists but the password unveiled'),
                                //       backgroundColor: Colors.red,
                                //     ));
                                //   } else if (e.code == 'user-disabled') {
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(const SnackBar(
                                //       content:
                                //       Text('The account is not found'),
                                //       backgroundColor: Colors.red,
                                //     ));
                                //   } else if (e.code == 'invalid-email') {
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(const SnackBar(content: Text('The account is not found'),
                                //       backgroundColor: Colors.red,
                                //     ));
                                //   }
                                // } catch (e) {
                                //   print(e);
                                // }

                                if (formstate.currentState!.validate()) {

                                  try {
                                       UserCredential cre = await instance1.signInWithEmailAndPassword(
                                           email: n1.text.trim(),
                                           password: n2.text.trim()
                                       );
                                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));

                                       ScaffoldMessenger.of(context)
                                           .showSnackBar( SnackBar(
                                         duration: Duration(seconds: 1),
                                         content: Text('The Login is success'),
                                         backgroundColor: Colors.blue,
                                       ));
                                       await FirebaseMessaging.instance
                                           .subscribeToTopic('yehya');

                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1),
                                        content: Text('the user not found'),
                                        backgroundColor: Colors.red,
                                      ));
                                    } else if (e.code == 'wrong-password') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1),

                                        content: Text(
                                            'The account already exists but the password unveiled'),
                                        backgroundColor: Colors.red,
                                      ));
                                    } else if (e.code == 'user-disabled') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1),

                                        content:
                                            Text('The account is not found'),
                                        backgroundColor: Colors.red,
                                      ));
                                    } else if (e.code == 'invalid-email') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1),

                                        content:
                                            Text('The account is not found'),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                }
                              },
                              child: Text("5".tr,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                side: BorderSide(color: Colors.white, width: 2),
                              ),
                              color: Colors.blue[400],
                            ),
                            height: 50,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text("6".tr),
                                ),
                                Container(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Register()));
                                    },
                                    child: Text(
                                      "7".tr,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                )
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
                                  child: Text('  ${"8".tr}  '),
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
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                left: 80, right: 80, top: 20, bottom: 60),
                            height: 45,
                            child: RaisedButton(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  side: BorderSide(color: Colors.blue)),
                              highlightColor: Colors.lightBlueAccent,
                              onPressed: () async {
                                try {
                                  UserCredential us = await signInWithGoogle();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));

                                  _name = us.user!.displayName.toString();
                                  _email = us.user!.email.toString();
                                  _phone = us.user!.phoneNumber.toString();
                                  print(us.user);
                                  print(
                                      'google login=============================');
                                  addUsers();
                                  await FirebaseMessaging.instance
                                      .subscribeToTopic('yehya');
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                              color: Colors.white,
                              child: Container(
                                //margin: EdgeInsets.only(left: 75),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '9'.tr,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '10'.tr,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '11'.tr,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '12'.tr,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '13'.tr,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '14'.tr,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ));
  }
}
