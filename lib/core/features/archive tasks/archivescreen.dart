import 'package:flutter/material.dart';
import 'package:todo/core/features/archive%20tasks/widgets/archivebody.dart';

import '../../utils/Appimages.dart';

class archivescreen extends StatelessWidget {
  const archivescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("archive",
          textAlign: TextAlign.center,
          style: TextStyle(),),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(image: AssetImage(AppImages.back),)),

      ),

      body: archivebody(),


    );
  }
}
