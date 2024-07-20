

import 'package:flutter/material.dart';

class ThemeProvider  with ChangeNotifier{


  bool  switchValue = false;
  changeSwitchValue(bool     t ) {

    switchValue = t ;
    notifyListeners( );
    //  set state ( )
  }



}