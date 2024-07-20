import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/features/Donetask/widgets/donebody.dart';
import 'package:todo/core/utils/Appcolors.dart';
import 'package:todo/core/utils/Apptexts.dart';

import '../../utils/Appimages.dart';
import '../regester_presntation/controller/theme_controller.dart';

class donescreen extends StatelessWidget {
  const donescreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Provider.of<ThemeProvider>(context).switchValue==false?
        AppColors.white
        :AppColors.dark,
        centerTitle: true,
        title: Text("${AppTexts.Donetasks}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(image: AssetImage(AppImages.back),
              color:  Provider.of<ThemeProvider>(context).switchValue==false?
              AppColors.black
                  :
                  AppColors.white
            )),

      ),

      body: doneebody(),


    );
  }
}
