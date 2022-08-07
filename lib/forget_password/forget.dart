import 'package:fahrenheit/UI/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forget extends StatefulWidget{
  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  bool x =false;

  Future res()async{
   try{
     showDialog(context: context,
         barrierDismissible: false
         , builder: (context)=>Center(child: CircularProgressIndicator(),));
     await FirebaseAuth.instance.sendPasswordResetEmail(email: n1.text.trim());
     ScaffoldMessenger.of(context)
         .showSnackBar(const SnackBar(
       content: Text(
           'Sent to your email link Change password, please chick your Gmail'),
       backgroundColor: Colors.blue,
     ));
   } on FirebaseAuthException catch(e){
     print('============');
     print(e);
   }
  }
  TextEditingController n1 =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 50,),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50, top: 50),
          child: TextField(
            controller: n1,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Email Address',
                prefixIcon: const Icon(Icons.person)),
          ),
        ),


        Container(
          width: 100,
          margin: EdgeInsets.only(top: 50),
          child:
          ElevatedButton(onPressed: (){
            res();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
          },child:
            Text('Send')
            ,)
          ,)
      ],),
    );
  }
}