
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/Home/homescreen.dart';
import 'package:todo/features/regester_presntation/controller/regester_controller.dart';
import 'core/utils/theme.dart';
import 'features/Boarding/onBoarding.dart';
import 'features/Home/presntation/controller/homecontroller.dart';
import 'features/Tasks/model/model.dart';
import 'features/regester_presntation/controller/theme_controller.dart';
import 'features/regester_presntation/model/regestermodel.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("SettingBox");

  Hive.registerAdapter(NotesAdapter());
  Hive.registerAdapter(RegisterLoginAdapter());
  await Hive.openBox<Notes>("NotesBox");
  await Hive.openBox<RegisterLogin>("photoBox");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context) => ThemeProvider()),
      ChangeNotifierProvider(create:(context)=> Homecontroller()),
      ChangeNotifierProvider(create:(context)=> regesterprov())
      
    ],

      child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Homecontroller>(context,listen: false).openapp();
      Provider.of<regesterprov>(context,listen: false).getphoto();
    Provider.of<ThemeProvider>(context,listen: false).setSwitchValueFromHive();


    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme:AppTheme().lightThemeData ,
      themeMode:Provider.of<ThemeProvider>(context).switchValue==false? ThemeMode.light:ThemeMode.dark,
      darkTheme: AppTheme().darkThemeData ,
      home: Provider.of<regesterprov>(context,listen: false).name==null ?  onboarding():homescreen(),

      // themeMode: _themeManager.themeMode,
    );
  }
}
