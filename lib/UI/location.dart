import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
class Mylocation extends StatefulWidget {
  static final CameraPosition cp = CameraPosition(
    target: LatLng(30.050237, 31.324277),
    zoom: 15,
  );

  @override
  State<Mylocation> createState() => _MylocationState();
}

class _MylocationState extends State<Mylocation> {
  late String _governorate;
  late String _city;
  late String _area;
  String _street = '7 Gaafar El-Sadik';
  late String _name;
  String phone='01554846177';


  geocoding()async{
    List<Placemark> placemarks = await placemarkFromCoordinates(30.050239, 31.324207);
    setState(() {
      _governorate=placemarks[0].administrativeArea.toString();
      _city=placemarks[0].subAdministrativeArea.toString();
      _area=placemarks[0].locality.toString();
      _name='700 Fehrenheit';
      print(_street);
    });

  }

  Set<Marker> mymarker = {
    Marker(
        markerId: MarkerId('1'),
        infoWindow: InfoWindow(title: '700 Fahrenheit'),
        position: LatLng(30.050239, 31.324207),
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
  };

  // setmarkerimage()async{
  //   print('hoooooooooooooooooooooo');
  //   mymarker.add(
  //        Marker(
  //         markerId: MarkerId('2'),
  //         infoWindow: InfoWindow(title: '700 Fahrenheit'),
  //         position: LatLng(30.050237, 31.324277),
  //         draggable: true,
  //         icon:  await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/mark.ico'),
  //       ),
  //   );
  // }
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
    geocoding();
    // setmarkerimage();
    super.initState();
  }

  bool x = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        toolbarHeight: 50,
        title: Center(
          child: Text(
            '26'.tr,
            style: TextStyle(fontSize: 15, color: Colors.blue[800]),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Switch(
              onChanged: (value) {
                setState(() {
                  x = value;
                  print(x.toString());
                });
              },
              value: x,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GoogleMap(
                  markers: mymarker,
                  mapType: x == false ? MapType.normal : MapType.satellite,
                  initialCameraPosition: Mylocation.cp,
                ),
              )),
          Expanded(
            flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
            color: Colors.blue[100],
            child: Container(
              margin: EdgeInsets.only(right: 100),

              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),


                      //alignment: Alignment.topLeft,
                      child: Text('700 Fahrenheit',style: TextStyle(color: Colors.blue[800],fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                        //alignment: Alignment.topLeft,
                        // margin:EdgeInsets.only(top: 0,left: 20),
                      child:
                      Text('01554846177',style: TextStyle(color: Colors.blue[500],fontSize: 12,))
                    ),
                    Container(
                      // margin: EdgeInsets.only(right: 250,left: 20),
                      child: Divider(color: Colors.blue[900],thickness: 0,),
                    ),
                   ar==false? Container(
                       child:
                       Text('7 Gaafar El-Sadik / Al Hay as Sabea',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold))

                   ): Container(
                       child:
                       Text('7 جعفر الصادق / الحي السابع ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold))

                   ),
                    Container(
                      //alignment: Alignment.topLeft,
                       margin:EdgeInsets.only(top: 0,bottom: 20),
                      child:ar==false? Text('Nasr City / Cairo',style: TextStyle(color: Colors.black,fontSize: 12,)):
                      Text('مدينه نصر / القاهرة',style: TextStyle(color: Colors.black,fontSize: 12,)),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
