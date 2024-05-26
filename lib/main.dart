import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/utils/Apptexts.dart';

import 'core/features/Boarding/onBoarding.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(AppTexts.NotesBox);
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
    );
  }
}
