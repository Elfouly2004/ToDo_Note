import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todo/core/utils/Appcolors.dart';
import 'package:todo/core/utils/Appimages.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/features/Home/widgets/homebody.dart';


import '../Tasks/widgets/addtask.dart';
class homescreen extends StatefulWidget {
  String name="";
  final String photo;

  homescreen( this.name,{required this.photo});

  @override
  State<homescreen> createState() => _homescreenState(this.name,this.photo);
}

class _homescreenState extends State<homescreen> {
  String name="";
  final String photo;

  _homescreenState(this.name, this.photo);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(


        leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset(
                AppImages.drawer,
                height: 32,
                width: 32,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },),
            toolbarHeight: 180,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[AppColors.blue, AppColors.move]),
          ),
        ),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello!",style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.hello),),

            Text("${name}",style: TextStyle(
                fontSize:20 ,
                fontWeight: FontWeight.w800,
                color: AppColors.hello),),


            Text(
                DateFormat.MMMEd().format(DateTime.now()),
              style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),



            
          ],
        ),

        actions: [
          CircleAvatar(
            radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: FileImage(File(photo)),
          )

        ],
      ),

      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        surfaceTintColor: Colors.deepOrange,
        backgroundColor: Colors.white,
        width: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height*0.23,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[AppColors.blue, AppColors.move]),
              ),
            ),

            SizedBox(height:MediaQuery.sizeOf(context).height*0.02,),

            GestureDetector(
              onTap: () {

              },
              child: Container(
                height:48 ,
                width: 235,
                decoration: BoxDecoration(
                  color: Color(0xff90B6E2).withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(12),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(12),
                  )
                ),
                child: Center(
                  child: Center(
                    child:  Image.asset(AppImages.archive,width: 150,),
                  )
                ),
              ),
            ),

            SizedBox(height:MediaQuery.sizeOf(context).height*0.02,),

            GestureDetector(
              onTap: () {

              },
              child: Container(
                height:48 ,
                width: 235,
                decoration: BoxDecoration(
                    color: Color(0xff90B6E2).withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(12),
                    )
                ),
                  child: Center(
                    child:  Image.asset(AppImages.done, width: 150,),
                  )
              ),
            ),



          ],
        ),
      ),


      body: Column(
        children: [

          homebody(),

          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: GestureDetector(
              onTap:  () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return addtask();
               },));
              },
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    AppColors.blue,
                    AppColors.move
                  ])
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
