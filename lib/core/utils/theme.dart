import 'package:flutter/material.dart';
import 'package:todo/core/utils/Appcolors.dart';

class AppTheme {

  final ThemeData lightThemeData= ThemeData(
      scaffoldBackgroundColor: const Color(0xffF9FEFB),

      textTheme:TextTheme(
          titleLarge: TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,

          ),

        bodyMedium: TextStyle(
          color: AppColors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,

        ),

        bodyLarge:  TextStyle(
          color: AppColors.hello,
          fontSize: 16,
          fontWeight: FontWeight.w500,

        ),

        bodySmall: TextStyle(
          color: AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.w400,

        ),

      ),

      listTileTheme: ListTileThemeData(
        tileColor:  AppColors.white,
        titleTextStyle: TextStyle(color: AppColors.black),
        subtitleTextStyle: TextStyle(color: AppColors.blue)
      ),




      switchTheme: SwitchThemeData(

          thumbColor: MaterialStateProperty.all(Colors.black),

          trackColor: MaterialStateProperty.all(Colors.white),

      ),


  );



  final ThemeData darkThemeData= ThemeData(
      scaffoldBackgroundColor: Color(0xff18283A),

      textTheme:TextTheme(
          titleLarge: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600
          ),

        bodyMedium: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,

        ),

        bodySmall: TextStyle(
          color: AppColors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,

        ),
        bodyLarge:  TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,

        ),





      ),

      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(color: AppColors.white),
        subtitleTextStyle: TextStyle(color: AppColors.white),



        tileColor:  AppColors.listtiledark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),      ),

      switchTheme: SwitchThemeData(
        // mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
          thumbColor: MaterialStateProperty.all(Colors.white),
          trackColor: MaterialStateProperty.all(Color(0xff2A4463))

      )

  ) ;


}





