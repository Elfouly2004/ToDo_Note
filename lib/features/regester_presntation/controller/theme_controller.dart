


import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider  with ChangeNotifier{


  bool  switchValue = false;


  setSwitchValueFromHive( ) {
    var box= Hive.box("SettingBox");
    switchValue = box.get("switchValue") ?? false ;
    notifyListeners();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   notifyListeners();
    // });

  }




  changeSwitchValue(bool     t )async {
    var box =Hive.box("SettingBox");
    await box.put("switchValue", t);
    switchValue = box.get("switchValue") ;
    notifyListeners();

  }



}
