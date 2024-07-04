
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';



class Notes {
  final taskName;
  final decsrption;
  final starttask;
  final Endtask;
  final selecttime;


  Notes(
      {
    required this.taskName,
    required  this.decsrption,
    required  this.starttask,
    required  this. Endtask,
    required  this. selecttime,

     }
     );
}


List<Notes> writenote = List.empty(growable: true);

List<Notes> Archivelist = List.empty(growable: true);
