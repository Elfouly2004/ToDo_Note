import 'package:flutter/material.dart';
import 'package:todo/core/features/Donetask/widgets/donebody.dart';
import 'package:todo/core/utils/Apptexts.dart';

import '../../utils/Appimages.dart';

class donescreen extends StatelessWidget {
  const donescreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("${AppTexts.Donetasks}",
          textAlign: TextAlign.center,
          style: TextStyle(),),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(image: AssetImage(AppImages.back),)),

      ),

      body: doneebody(),


    );
  }
}
