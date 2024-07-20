import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/features/Boarding/onBoarding.dart';
import 'core/features/regester_presntation/controller/theme_controller.dart';
import 'core/utils/theme.dart';

void main() async{

  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider()  ,
      child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,

      theme:AppTheme().lightThemeData ,
      themeMode:Provider.of<ThemeProvider>(context).switchValue == false? ThemeMode.light:ThemeMode.dark,
      darkTheme: AppTheme().darkThemeData ,
      home: onboarding(),

      // themeMode: _themeManager.themeMode,
    );
  }
}
