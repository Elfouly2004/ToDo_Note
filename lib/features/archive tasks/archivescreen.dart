import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/Appcolors.dart';
import 'package:todo/core/utils/Apptexts.dart';
import 'package:todo/features/archive%20tasks/widgets/archivebody.dart';

import '../../core/utils/Appimages.dart';
import '../regester_presntation/controller/theme_controller.dart';

class archivescreen extends StatelessWidget {
  const archivescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Provider.of<ThemeProvider>(context).switchValue==false?
        AppColors.white:AppColors.dark,
        centerTitle: true,
        title: Text("${AppTexts.archive}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(image: AssetImage(AppImages.back),
              color: Provider.of<ThemeProvider>(context).switchValue==false?
              AppColors.black:AppColors.white,)),

      ),

      body: archivebody(),


    );
  }
}
