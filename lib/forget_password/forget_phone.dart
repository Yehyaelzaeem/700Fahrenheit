import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../UI/home.dart';
import '../UI/home1.dart';

enum MobileVerificationState { SHOW_MOBILE_FROM_STATE, SHOW_OTP_FROM_STATE }

class Forget_mobile extends StatefulWidget {
  @override
  State<Forget_mobile> createState() => _Forget_mobileState();
}

class _Forget_mobileState extends State<Forget_mobile> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FROM_STATE;

  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();
  bool x = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  bool showloading = false;
  String t = '';
  final GlobalKey<ScaffoldState> _scaffolfkey = GlobalKey();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  TextEditingController n3 = TextEditingController();

  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneauthcredential) async {
    setState(() {
      showloading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneauthcredential);
      setState(() {
        showloading = false;
      });
      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showloading = false;
      });
      _scaffolfkey.currentState
          ?.showSnackBar(SnackBar(content: Text('${e.message}')));
    }
  }

  Widget pin(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            borderWidth: 1,
            activeColor: Colors.blue,
            inactiveColor: Colors.blue,
            inactiveFillColor: Colors.white,
            activeFillColor: Colors.lightBlueAccent,
            selectedColor: Colors.blue,
            selectedFillColor: Colors.white),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (v) {
          print("Completed");
        },
        onChanged: (value) {
          t = value;
          print(t);
        },
        appContext: context,
      ),
    );
  }

  getcode() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 10),
            child: const Text(
              'Verify your Phone number ',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 60),
            child: RichText(
              text: TextSpan(
                  text: 'Enter your 6 digit code numbers sent to ',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${n1.text}',
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: pin(context),
          ),
          Container(
            width: 100,
            margin: EdgeInsets.only(top: 50),
            child: ElevatedButton(
              onPressed: () {
                PhoneAuthCredential phoneauthcredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode: t);
                signInWithPhoneAuthCredential(phoneauthcredential);
              },
              child: Text('Verify'),
            ),
          )
        ],
      ),
    );
  }

  getmobilewidget() {
    return ListView(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 150, left: 30, right: 50, bottom: 10),
          child: const Text(
            'What is your Phone number ? ',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 0),
          child: RichText(
            text: const TextSpan(
                text: 'Please enter your phone number to verify your account ',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '+2011********',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  )
                ]),
          ),
        ),
        Form(
          key: formstate,
          child: Container(
            margin: EdgeInsets.only(left: 50, right: 50, top: 50),
            child: TextFormField(
              // validator: (text) {
              //   if (text!.length < 11) {
              //     return 'the phone number at less 11 digit not available ';
              //   }
              // },
              // maxLength: 11,
              keyboardType: TextInputType.number,
              controller: n1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Enter your mobile phone ',
                  prefixIcon: const Icon(
                    Icons.phone_android,
                    color: Colors.lightBlueAccent,
                  )),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50, left: 110, right: 110),
          child: ElevatedButton(
            onPressed: () async {
              setState(() {
                showloading = true;
              });
              await _auth.verifyPhoneNumber(
                  timeout: const Duration(seconds: 120),
                  phoneNumber: '+2${n1.text}',
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      showloading = false;
                    });
                  },
                  verificationFailed: (verificationFailed) async {
                    setState(() {
                      showloading = false;
                    });
                    _scaffolfkey.currentState?.showSnackBar(SnackBar(
                        content: Text('${verificationFailed.message}')));
                    print(verificationFailed.message);
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      showloading = false;
                      currentState =
                          MobileVerificationState.SHOW_OTP_FROM_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) {});
              // var fromstat = formstate.currentState;
              // if (fromstat!.validate()) {
              //   setState(() {
              //     showloading = true;
              //   });
              //   await _auth.verifyPhoneNumber(
              //       timeout: const Duration(seconds: 120),
              //       phoneNumber: '+2${n1.text}',
              //       verificationCompleted: (phoneAuthCredential) async {
              //         setState(() {
              //           showloading = false;
              //         });
              //       },
              //       verificationFailed: (verificationFailed) async {
              //         setState(() {
              //           showloading = false;
              //         });
              //         _scaffolfkey.currentState?.showSnackBar(SnackBar(
              //             content: Text('${verificationFailed.message}')));
              //         print(verificationFailed.message);
              //       },
              //       codeSent: (verificationId, resendingToken) async {
              //         setState(() {
              //           showloading = false;
              //           currentState =
              //               MobileVerificationState.SHOW_OTP_FROM_STATE;
              //           this.verificationId = verificationId;
              //         });
              //       },
              //       codeAutoRetrievalTimeout: (verificationId) {});
              // }
            },
            child: Text('Send'),
          ),
        )
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffolfkey,
        body: showloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : currentState == MobileVerificationState.SHOW_MOBILE_FROM_STATE
                ? getmobilewidget()
                : getcode());
  }
}
