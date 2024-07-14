import 'package:flutter/material.dart';
import 'package:todo/theme/theme_manager.dart';
import 'package:todo/theme/themes.dart';
import 'core/features/Boarding/onBoarding.dart';

void main() async{
  runApp(const MyApp());
}
// ThemeManager _themeManager =ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      home: onboarding(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // themeMode: _themeManager.themeMode,
    );
  }
}
