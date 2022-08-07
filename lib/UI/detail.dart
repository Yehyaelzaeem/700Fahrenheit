import 'package:badges/badges.dart';
import 'package:fahrenheit/UI/request_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../cart/cart.dart';
import '../classs/class.dart';
import '../classs/item.dart';

class Details extends StatefulWidget {
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
  }
  int counter = 0;
  bool s1 =true;
  bool s2 =false;
  String collection_ar='';
  @override
  Widget build(BuildContext context) {
    final rec = ModalRoute.of(context)!.settings.arguments as Recomm;
    if(rec.collection=='Hawawshy'){
      collection_ar='حواوشي ايطالي ';
    }
    else if(rec.collection=='Pizza'){
      collection_ar='بيتزا ';
    }else if(rec.collection=='Pies'){
      collection_ar='فطير حادق ';
    }else if(rec.collection=='Sweet Pie'){
      collection_ar='فطير حلو ';
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center(
            child: FittedBox(
              child: Text(
                "${ar==false?rec.collection:collection_ar}  "+
                    "${ar==false?rec.name:rec.name_ar}  ",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                    shadows: [BoxShadow(color: Colors.black, blurRadius: 15)]),
              ),
            ),

          ),
          actions: [
            Container(
              margin: EdgeInsets.only(top: 10,right: 20,left: 20),
              child: Badge(
                badgeColor: Colors.yellowAccent,
                badgeContent: Consumer<Cart>(builder: (context, cart,child) {
                  return
                    Text('${cart.count}');
                },),
                child:  IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartdetails()));
                }, icon: Icon(Icons.shopping_cart_outlined)),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.orangeAccent,
        body: ListView(
          children: [
            Container(
              height: 350,
              child: Image.network(rec.image, fit: BoxFit.fill),
            ),
            Container(
              child: const Divider(
                thickness: 3,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 10,right: 10),
              child:  Text(
               '${ar==false? 'Description :':'الوصف : '}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: (ar==false?300:0), left: (ar==false?0:310)),
              child: const Divider(
                thickness: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 10,right: 10),
              child: Text(
                '${ar==false?rec.description:rec.description_ar}',
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
              child:  Text(
                '${ar==false?'Ingredients :':'المكونات : '}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: (ar==false?300:0), left: (ar==false?0:300)),
              child: const Divider(
                thickness: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 10,right: 10),
              child: Text(
                '${ar==false?rec.ingredients:rec.ingredients_ar}',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [BoxShadow(color: Colors.black, blurRadius: 3)]),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 100,right: 100),
              child:const Divider(
                thickness: 1,
                color: Colors.black12,
              ),

            ),
            InkWell(
              child:  Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: s1==true?Colors.white70:Colors.transparent
                ),

                margin: EdgeInsets.only(top: 5, left: 20,right: 20, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 0,bottom: 5),
                      child:  Text(
                        '${ar==false?'Size :':'الحجم  : '}',
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 10,bottom: 5,right: 5),
                      child: Text(
                        rec.size1,
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5, left: 60,bottom: 5,right: 5),
                            child:  Text(
                             '${ar==false? 'Price :':'السعر : '}',
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
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  s1=true;
                  s2=false;
                });
              },
            ),
            SizedBox(height: 10,),
            InkWell(
              child:  Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: s2==true?Colors.white70:Colors.transparent
                ),

                margin: EdgeInsets.only(top: 5, left: 20,right: 20, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 0,bottom: 5),
                      child:  Text(
                        '${ar==false?'Size :':'الحجم  : '}',
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5, left: 65,bottom: 5,right: 5),
                            child:  Text(
                              '${ar==false? 'Price :':'السعر : '}',
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
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  s1=false;
                  s2=true;
                });
              },
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
                              name: ar==false?'${rec.collection} ' :'${collection_ar }'+ (ar==false?rec.name:rec.name_ar),
                              price: double.parse(s1==true?rec.price1:rec.price2),
                              image: rec.image,
                              size:s1==true?rec.size1:rec.size2));
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
  }
}
