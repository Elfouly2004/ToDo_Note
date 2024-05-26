import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/core/utils/Appcolors.dart';
import 'package:todo/core/utils/Appimages.dart';
import 'package:todo/core/utils/Apptexts.dart';
import 'dart:ui';


import '../regester/regester.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            SizedBox(height:MediaQuery.sizeOf(context).height*0.1,),

            Center(
              child: Image(image: AssetImage(AppImages.Boarding)),
            ),


            SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),

            Text("${AppTexts.onboarding}",
              style: TextStyle(
            color: AppColors.text ,
            fontSize:20 ,
              fontWeight: FontWeight.w600,
            ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),


            Text("${AppTexts.decsboarding}",
              style: TextStyle(
            fontSize: 14,
              color: AppColors.text2,

            ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),

          GestureDetector(
            onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                    return regester();
                  },));
            },
            child: Container(
              height:52 ,
              width: 331,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.blue,
                    AppColors.move,
                  ]
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text("${AppTexts.lets}",  style: TextStyle(fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w900
                  ),textAlign: TextAlign.center,)),
                  Image(image: AssetImage(AppImages.left),width: 30,),
                ],
              ),
            ),
          ),










          ],
        ),
      ),

    );
  }
}
