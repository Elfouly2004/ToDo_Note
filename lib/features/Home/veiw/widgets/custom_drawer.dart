import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/Appcolors.dart';
import '../../../../core/utils/Appimages.dart';
import '../../../Donetask/donescreen.dart';
import '../../../archive tasks/archivescreen.dart';
import '../../../regester_presntation/controller/theme_controller.dart';

class wide_drawer extends StatelessWidget {

  final String name;
  final File Photo;
  const wide_drawer({required this.name,required this.Photo, });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [



        DrawerHeader(
            decoration:Provider.of<ThemeProvider>(context).switchValue==false?
            BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[AppColors.blue, AppColors.move]),

            )
                :
            BoxDecoration(
                color: AppColors.buttondark

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CircleAvatar(

                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    backgroundImage: Image.file(Photo).image,
                  ),
                  radius: 40,
                  foregroundColor: Colors.white ,
                ),

                Text("${name}",style: TextStyle(
                    fontSize:20 ,
                    fontWeight: FontWeight.w800,
                    color: AppColors.white),),
              ],
            )
        ),



        Container(
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
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [


                Text("Light",),

                Switch(value: Provider.of<ThemeProvider>(context).switchValue,
                  onChanged: ( b){


                    Provider.of<ThemeProvider>(context,listen: false).changeSwitchValue(b);

                  },
                  activeThumbImage: AssetImage(AppImages.moon,),
                  inactiveThumbImage: AssetImage(AppImages.Sun),

                ),

                Text("dark"),
              ],
            ),
        ),





        SizedBox(height:MediaQuery.sizeOf(context).height*0.02,),


        GestureDetector(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder:   (context) => archivescreen(),));
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
                  child:  Image.asset(Provider.of<ThemeProvider>(context).switchValue==false?
                  AppImages.archivedtask:AppImages.archiveddark,width: 150,),
                )
            ),
          ),
        ),

        SizedBox(height:MediaQuery.sizeOf(context).height*0.02,),

        GestureDetector(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder:   (context) => donescreen(),));

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
                child:  Image.asset(
                  Provider.of<ThemeProvider>(context).switchValue==false?
                  AppImages.done:AppImages.Donedark, width: 150,),
              )
          ),
        ),




      ],


    );
  }
}
