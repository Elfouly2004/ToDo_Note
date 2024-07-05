import 'package:flutter/material.dart';
import 'package:todo/core/features/Home/homescreen.dart';

import '../../../utils/Appcolors.dart';
import '../../Tasks/model/model.dart';

class customdialog extends StatefulWidget {
  const  customdialog(
      {
        required this.name,
    required this.photo,
    required this.select,

        required this.index
      });
 final name;
 final photo;
 final select;
 final index;


  @override
  State<customdialog> createState() => _customdialogState(this.index,this.name,this.photo,this.select);
}

class _customdialogState extends State<customdialog> {
  final name;
  final photo;
  final select;
  final index;

  _customdialogState(this.index,this.name,this.photo,this.select);
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text(' Are you sure you want to delete this task? '),

      actions: [

        Row(

          children: [
            GestureDetector(
              onTap:() {
            setState(() {
              Navigator.push(context,MaterialPageRoute(
                builder: (context) => homescreen(
                    name, photo: photo, selecttime: select),));
              writenote.removeAt(index);
              });
              },
              child: Container(
                  height:40 ,
                  width: 105,

                  decoration: BoxDecoration(
                      color: Color(0xffBD5461),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Yes",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20
                      ),),
                  )
              ),
            ),

            GestureDetector(
              onTap:() {
                setState(() {

                });
              Navigator.pop(context);
              },
              child: Container(
                  height:40 ,
                  width: 105,

                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            AppColors.blue,
                            AppColors.move,
                          ]
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:Center(
                    child: Text("No",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20
                      ),),
                  )
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),

      ],

    );
  }
}
