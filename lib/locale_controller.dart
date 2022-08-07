import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MylocaleController extends GetxController{
  void Changelocale(String codelang){
    Locale locale = Locale(codelang);
    // sharepref!.setString("lang",codelang);
    //sharepref!.setString("lang",codelang);
    Get.updateLocale(locale);
  }
}