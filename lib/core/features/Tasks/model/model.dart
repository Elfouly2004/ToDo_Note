
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';



class Notes {
  String taskName;
  String decsrption;


  Notes(
      {
    required this.taskName,
    required  this.decsrption,
     }
     );
}


List<Notes> writenote = List.empty(growable: true);
