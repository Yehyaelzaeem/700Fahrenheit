import 'package:fahrenheit/UI/edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../classs/user.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class DatabaseHandler1 {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example2.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE user2(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, phone TEXT NOT NULL, address TEXT NOT NULL , image TEXT NOT NULL, email TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<List<User1>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('user2');
    return queryResult.map((e) => User1.fromMap(e)).toList();
  }

  Future<void> deleteUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'user2',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> insertUser(List<User1> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('user2', user.toMap());
    }
    return result;
  }
}

class _ProfileState extends State<Profile> {
  late DatabaseHandler1 handler1;
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
  }

  List edit = [];

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

  Future<int> updateData(
      int id, String name, String phone, String address) async {
    var db = await handler1.initializeDB();
    int updateCount = await db.rawUpdate('''
    UPDATE user2 
    SET name = ${name}, phone = ${phone},address = ${address}
    WHERE id = ${id}
    ''');
    print("updataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(updateCount);
    return updateCount;
  }

  // Future<int> addUsers() async {
  //   User1  firstUser= User1(name: 'ffff', phone: '0102743255', address: 'porsaied', image: 'null',email: 'meroahmed');
  //   User1 secondUser = User1(name: 'yehya', phone: '01027362572', address: 'city', image: 'null',email: 'yehyaelzaeem');
  //
  //   List<User1> listOfUsers = [firstUser, secondUser];
  //   return await this.handler.insertUser(listOfUsers);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.handler1.retrieveUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User1>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(Icons.delete_forever),
                    ),
                    key: ValueKey<int>(snapshot.data![index].id!),
                    onDismissed: (DismissDirection direction) async {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(
                                title: Center(child: Text(
                                        "Are You Sure ?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
                                      ),),
                                content: Container(
                                  height: 330,
                                  child: FittedBox(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            'assets/delete.gif',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          child: const Text(
                                                    'You want to Delete your Account !!!',
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
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Get.back();

                                    },
                                  ),
                                  FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30))
                                    ),
                                    color: Colors.green,
                                    textColor: Colors.white,
                                    child: Text('OK'),
                                    onPressed: () async{
                                      Get.to(Login());
                                      await this.handler1.deleteUser(snapshot.data![index].id!);
                                      setState(() {
                                        snapshot.data!.remove(snapshot.data![index]);
                                      });
                                    },
                                  ),

                                ],
                              ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.96,
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 7)
                          ],
                          //  borderRadius: const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 40, left: 50, bottom: 50),
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.only(
                                          top: 0, left: 0, bottom: 0),
                                      child: RichText(
                                        text: TextSpan(
                                            text: '${ar==false?'Account id :  ':'رقم الحساب  :  '}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${snapshot.data![index].id.toString()}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blue),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   height: 350,
                            //   child:
                            //   ClipRRect(
                            //       child: Image.asset(
                            //         'assets/ddd.jpg',
                            //         fit: BoxFit.fill,
                            //       ),
                            //     ),
                            //
                            // ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(color: Colors.white, blurRadius: 7)
                                  ],
                                  // borderRadius: const BorderRadius.all(Radius.circular(30)),
                                  border: Border.all(
                                      color: Colors.blueGrey, width: 4)),

                              // color: Colors.lightBlueAccent,
                              height: 300,
                              // width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                'assets/ddd.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          InkWell(
                            child:   Container(
                              margin: EdgeInsets.only(top: 0, left: 0,right:0 ),
                              alignment: Alignment.center,
                              child: Container(
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text("${ar==false?'Edit Profile':'تعديل الملف '}"),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Edit()));
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Edit()));
                            },
                          ),
                            Container(
                              width: 300,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 0,right: 0, left: 10,bottom: 0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    child:
                                    Text('${ar==false?'Name         : ':' الاسم         : '}',style: TextStyle(
                                        fontSize: 15, color: Colors.blueGrey),
                                    )
                                    ,),
                                  Container(
                                    width:200,
                                    child:
                                    Text("${snapshot.data![index].name.toString()}",style: TextStyle(
                                        fontSize: 15, color: Colors.blue),
                                      maxLines: 10,)
                                    ,)
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 0, left: 10,bottom: 0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 85,
                                    child:
                                    Text('${ar==false?'Username : ':' الايميل       : '}',style: TextStyle(
                                        fontSize: 15, color: Colors.blueGrey),
                                    )
                                    ,),
                                  Container(
                                    width:215,
                                    child:
                                    Text("${snapshot.data![index].email.toString()}",style: TextStyle(
                                        fontSize: 15, color: Colors.blue),
                                      maxLines: 10,)
                                    ,)
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 0, left: 10,bottom: 0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 115,
                                    child:
                                    Text('${ar==false?'Phone        : ':' رقم التلفون : '}',style: TextStyle(
                                        fontSize: 15, color: Colors.blueGrey),
                                    )
                                    ,),
                                  Container(
                                    width:100,
                                    child:
                                    Text("${snapshot.data![index].phone.toString()}",style: TextStyle(
                                        fontSize: 15, color: Colors.blue),
                                      maxLines: 10,)
                                    ,)
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 0, left: 10,bottom: 50),
                              child: Row(
                                children: [
                                  Container(
                                    width: 75,
                                    child:
                                    Text('${ar==false?'Address  :  ':'  العنوان       : '}',style: TextStyle(
                                               fontSize: 15, color: Colors.blueGrey),
                                        )
                                    ,),
                                  Container(
                                    width:225,
                                    child:
                                    Text("${snapshot.data![index].address.toString()}",style: TextStyle(
                                        fontSize: 15, color: Colors.blue),
                                    maxLines: 10,)
                                    ,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
//Text(snapshot.data![index].name),
