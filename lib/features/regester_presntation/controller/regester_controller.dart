


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../model/regestermodel.dart';

class regesterprov  with ChangeNotifier{


  String? name ;

  GlobalKey<FormState> formkey1= GlobalKey <FormState>();


  XFile ? myPhoto ;
  // myPhoto = null ;
  Future<XFile?> pickImage() async{

    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    notifyListeners();
    return image;

  }

  choosephoto()async{

    XFile? image = await pickImage();
    myPhoto = image;

    var box =Hive.box<RegisterLogin>("photoBox");
      await box.add( RegisterLogin(pic: myPhoto, name: name));

    notifyListeners();
  }



  getphoto()async{
    var box =Hive.box<RegisterLogin>("photoBox");
    myPhoto =    box.values.first.pic;
  name =   box.values.first.name;

      notifyListeners();

  }




  Getphoto()async{


    var box = await Hive.openBox<RegisterLogin>("photoBox");


    RegisterLogin? data = box.get("login");

    myPhoto = data?.pic;
    name = data?.name;


    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });

  }




}





