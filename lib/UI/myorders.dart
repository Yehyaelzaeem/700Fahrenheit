import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../classs/myorderclass.dart';

class Myorders extends StatefulWidget{
  @override
  State<Myorders> createState() => _MyordersState();
}

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example4.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE my_order1(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT NOT NULL, items TEXT , total_items TEXT NOT NULL , total_price TEXT NOT NULL, customer_id TEXT, order_id TEXT)",
        );
        print('sucssess create');
      },
      version: 2,
    );
  }
  Future<List<Order>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('my_order1');
    return queryResult.map((e) => Order.fromMap(e)).toList();
  }


  Future<void> deleteUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'my_order1',
      where: "id = ?",
      whereArgs: [id],
    );
  }
  Future<void>select(int id) async {
    final db = await initializeDB();
   List a = await  db.query(
      'my_order1',
      where: "id == ${id}",
    );
    print('================');
    print(a);

  }

  Future<int> insertUser(List<Order> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('my_order1', user.toMap());
    }
    return result;
  }
}

class _MyordersState extends State<Myorders> {
  late DatabaseHandler handler;
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
    }
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
     // await this.addUsers();
      setState(() {});
    });
  }
  List x =[];
  List xy =['1','2','3'];
 bool xx =false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title:  Center(child:
          Text('54'.tr)
          ,),
      ),
      body:

      FutureBuilder(
        future: this.handler.retrieveUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
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
                    await this.handler.deleteUser(snapshot.data![index].id!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.yellow[400],
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Colors.white, width: 5),
                        boxShadow: const [
                          BoxShadow(blurRadius: 7, color: Colors.black)
                        ]),
                    margin: EdgeInsets.only(left: 50,right: 50,bottom: 20 ,top: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView(
                          children: [
                           Container(
                             alignment: Alignment.center,
                             margin: EdgeInsets.only(top: 20),
                             child: RichText(
                               text: TextSpan(
                                 text: '47'.tr,style:
                                   TextStyle(fontSize: 15,color: Colors.blueGrey,fontWeight: FontWeight.bold),
                                 children: [
                                   TextSpan(
                                     text: '${snapshot.data![index].order_id.toString()}',style:
                                 TextStyle(fontSize: 15,color: Colors.black),
                                   ),
                                 ]
                               ),
                             ),
                           ),
                            Container(
                              margin: EdgeInsets.only(left: 80,right: 80),
                              child: Divider(thickness: 0.5,color: Colors.black87,),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 5,left: 10),
                              child: FittedBox(
                                child: RichText(
                                  text: TextSpan(
                                      text: '49'.tr,style:
                                  TextStyle(fontSize: 15,color: Colors.blueGrey,fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: '${snapshot.data![index].customer_id.toString()}',style:
                                        TextStyle(fontSize: 15,color: Colors.black),
                                        )
                                      ]
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 5,left: 10),
                              child: FittedBox(
                                child: RichText(
                                  text: TextSpan(
                                      text: "48".tr,style:
                                  TextStyle(fontSize: 15,color: Colors.blueGrey,fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: '${snapshot.data![index].date.toString()}',style:
                                        TextStyle(fontSize: 15,color: Colors.black),
                                        )
                                      ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 5,left: 10),
                              child: FittedBox(
                                child: RichText(
                                  text: TextSpan(
                                      text: '50'.tr,style:
                                  TextStyle(fontSize: 15,color: Colors.blueGrey,fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: '${snapshot.data![index].total_items.toString()}',style:
                                        TextStyle(fontSize: 15,color: Colors.black),
                                        )
                                      ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 5,left: 10),
                              child: RichText(
                                text: TextSpan(
                                    text: '51'.tr,style:
                                TextStyle(fontSize: 15,color: Colors.blueGrey,fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: '${snapshot.data![index].total_price.toString()}',style:
                                      TextStyle(fontSize: 15,color: Colors.black),
                                      )
                                    ]
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.white38,
                              ),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 5,left: 0),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: RichText(
                                  text: TextSpan(
                                      text: '53'.tr,style:
                                  TextStyle(fontSize: 15,color: Colors.blueGrey,fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: '${snapshot.data![index].items.toString()}',style:
                                        TextStyle(fontSize: 15,color: Colors.black),
                                        )
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                );
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
