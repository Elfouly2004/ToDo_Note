import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/features/Home/homescreen.dart';

import '../../../utils/Appcolors.dart';
import '../../../utils/Apptexts.dart';
import '../../Home/presntation/controller/homecontroller.dart';
import '../../Tasks/model/model.dart';
import '../../regester_presntation/controller/theme_controller.dart';

class customdialog extends StatefulWidget {
  const  customdialog(
      {
        required this.index,
        required this.onTap
      });

 final index;
 final void Function()? onTap;


  @override
  State<customdialog> createState() => _customdialogState(this.index,this.onTap);
}

class _customdialogState extends State<customdialog> {
  final void Function()? onTap;
  final index;

  _customdialogState(this.index,this.onTap);
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Provider.of<ThemeProvider>(context).switchValue==false?
      AppColors.white
      :
      AppColors.dark,
      title: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text("${AppTexts.questiondelete}",
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.start,),
      ),

      actions: [

        Row(

          children: [
            GestureDetector(
              onTap:onTap,

              child: Container(
                  height:40 ,
                  width: 105,

                  decoration: BoxDecoration(
                      color: Color(0xffBD5461),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("${AppTexts.yes}",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20
                      ),),
                  )
              ),
            ),

            GestureDetector(
              onTap:() {
                setState(() {

                });
              Navigator.pop(context);
              },
              child: Container(
                  height:40 ,
                  width: 105,

                  decoration:Provider.of<ThemeProvider>(context).switchValue==false?
                  BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            AppColors.blue,
                            AppColors.move,
                          ]
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ):BoxDecoration(color: AppColors.buttondark
                      , borderRadius: BorderRadius.circular(10)),
                  child:Center(
                    child: Text("${AppTexts.no}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20
                      ),),
                  )
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),

      ],

    );
  }
}
