

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Tasks/model/model.dart';

class Homecontroller extends ChangeNotifier{


  TextEditingController namecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  List<Notes> writenote =[];


  addNote({ required title,required des, context}) {

   String? taskname = namecontroller.text.trim();
   String? description =descriptioncontroller.text.trim();

if (taskname.isNotEmpty&& description.isNotEmpty){
  namecontroller.text="";
  descriptioncontroller.text="";
   writenote.add(
      Notes(
        taskName: title,
        decsrption: des,
        starttask: selectedDate1.toString().split(" ")[0],
        Endtask: selectedDate2.toString().split(" ")[0],
        selecttime: selectedTime.format(context),
      )
  );
  notifyListeners();
  Navigator.pop(context);

}else{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("you should write task")));
}


  }



  deleteNote(int index,context) {
    writenote.removeAt(index);
  Navigator.pop(context);
  Navigator.pop(context);
  notifyListeners();
  }

//====================================================

  List<Notes> Archivelist = [];

  updatearchive(context,int index ){

    Archivelist.add(
        Notes(
        taskName: namecontroller,
        decsrption: descriptioncontroller,
        starttask: selectedDate1,
        Endtask: selectedDate2,
        selecttime: selectedTime
        )
    );
    Navigator.pop(context);

  writenote[index].archive=true;

   notifyListeners();
  }

  deletearchive({required index}){
    // Archivelist.removeAt(index);
    Archivelist[index].archive = false;
    writenote[writenote.indexOf(Archivelist[index])].archive = false;
    notifyListeners();

  }

  //====================================================


  List<Notes> Done=[];


  updateadone(int index){
    writenote[index].done=!writenote[index].done;
    notifyListeners();
  }




//========================================================

  DateTime selectedDate1 = DateTime.now();
  Future<void> SelectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030)
    );
    if (picked != null && picked != selectedDate1) {
      selectedDate1 = picked;
        notifyListeners();
    }
  }



  DateTime selectedDate2 = DateTime.now();
  Future<void> SelectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null && picked !=selectedDate2) {
      selectedDate2 = picked;
        notifyListeners();

    }
  }


  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> SelectTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );});
    if (picked_s != null && picked_s !=selectedTime.format(context) )
     selectedTime = picked_s;
    notifyListeners();

  }



}