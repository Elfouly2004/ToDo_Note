import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';import 'package:todo/core/features/Donetask/donescreen.dart';
import 'package:todo/core/features/Home/veiw/homebody.dart';
import 'package:todo/core/features/Home/veiw/widgets/Custom_Appbar.dart';
import 'package:todo/core/features/Home/veiw/widgets/custom_drawer.dart';
import 'package:todo/core/features/archive%20tasks/archivescreen.dart';
import 'package:todo/core/utils/Appcolors.dart';
import 'package:todo/core/utils/Appimages.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/utils/Apptexts.dart';
import 'package:todo/core/utils/theme.dart';
import '../Tasks/model/model.dart';
import '../Tasks/widgets/addtask.dart';
import 'package:flutter/cupertino.dart';

import '../regester_presntation/controller/theme_controller.dart';

class homescreen extends StatefulWidget {
  String name="";
  final  photo;
  final  selecttime;



  homescreen( this.name,{required this.photo,required this.selecttime});

  @override
  State<homescreen> createState() => _homescreenState(this.name,this.photo,this.selecttime);
}

class _homescreenState extends State<homescreen> {
  String name="";
  final String photo;
  final  selecttime;

  _homescreenState(this.name, this.photo,this.selecttime);

  bool theme=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


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
          );
        },),
        toolbarHeight: 180,

        flexibleSpace: Container(
          decoration:  Provider.of<ThemeProvider>(context).switchValue==false?BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[AppColors.blue, AppColors.move]),
          )
              :
          BoxDecoration(
              color: AppColors.buttondark
          ),
        ),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Provider.of<ThemeProvider>(context).switchValue==false?
            Text("${AppTexts.hello}",style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.hello),)
                :Text("${AppTexts.hello}",style: Theme.of(context).textTheme.bodyMedium,)
            ,

            Provider.of<ThemeProvider>(context).switchValue==false?
            Text("${name}",style: TextStyle(
                fontSize:20 ,
                fontWeight: FontWeight.w800,
                color: AppColors.hello),)
                :
            Text("${name}",style: Theme.of(context).textTheme.bodyLarge,)
            ,


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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(0)),
        ),
        surfaceTintColor: Colors.deepOrange,
        backgroundColor:Provider.of<ThemeProvider>(context).switchValue==false? AppColors.white:AppColors.dark,
        width: 260,
        child:wide_drawer(Photo: File(photo),name: name,)
      ),


      body: Column(

        children: [




          writenote.isEmpty? Expanded(
            child: Center(
              child:  Text("${AppTexts.nonote} ",
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
            ),
          ):
          Expanded(child: homebody(name: name,photo: photo,selected: selecttime,)),







          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: FloatingActionButton(

                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                ),

                onPressed:  () {
               setState(() {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return addtask(


                   );
                 },)).then((k){
      setState(() {

      });
    });;
               });
                },

                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color:  Color(0xffFFFFFF),
                  ),
                  decoration:  Provider.of<ThemeProvider>(context).switchValue==false?BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [ AppColors.blue,
                        AppColors.move,])
                  )
                      :BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.buttondark
                  ),
                ),

              ),
            ),
          )
        ],
      ),

    );
  }
}


