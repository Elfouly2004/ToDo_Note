import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/features/Home/presntation/controller/homecontroller.dart';
import 'core/features/Boarding/onBoarding.dart';
import 'core/features/regester_presntation/controller/theme_controller.dart';
import 'core/utils/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("SettingBox");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context) => ThemeProvider()),
      ChangeNotifierProvider(create:(context)=> Homecontroller())
      
    ],

      child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false).setSwitchValueFromHive();
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,

      theme:AppTheme().lightThemeData ,
      themeMode:Provider.of<ThemeProvider>(context).switchValue==false? ThemeMode.light:ThemeMode.dark,
      darkTheme: AppTheme().darkThemeData ,
      home: onboarding(),

      // themeMode: _themeManager.themeMode,
    );
  }
}
