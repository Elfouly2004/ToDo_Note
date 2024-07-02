import 'package:flutter/material.dart';
import 'core/features/Boarding/onBoarding.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      home: onboarding(),
      // theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
