import 'package:flutter/material.dart';
import 'package:todo/core/features/Tasks/model/model.dart';

import '../../../utils/Appcolors.dart';
import '../../../utils/Appimages.dart';
import '../../../utils/Apptexts.dart';

class archivenotes extends StatefulWidget {
  const archivenotes({required this.index,required this.onTap});
  final index;
  final void Function()?onTap;

  @override
  State<archivenotes> createState() => _archivenotesState(this.index,this.onTap);
}

class _archivenotesState extends State<archivenotes> {
  final index;
  final void Function()?onTap;
  _archivenotesState(this.index,this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListTile(

          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [ AppColors.blue.withOpacity(0.4), AppColors.move.withOpacity(0.4),]
                )  ,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
                child:  Image(
                  image: AssetImage(AppImages.task),height: 30,width: 30,
                )
            ),
          ),


          title: Text("${Archivelist[widget.index].taskName}",
            style: TextStyle(fontWeight: FontWeight.w600),),
          subtitle:Text("${Archivelist[widget.index].selecttime}",
            style:TextStyle(
                color: Color(0xff90B6E2)
            ) ,
          ),


          trailing: GestureDetector(
            onTap: onTap,

            child: Container(
              height:30 ,
              width:77,

              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        AppColors.blue,
                        AppColors.move,
                      ]
                  ),
                  borderRadius: BorderRadius.circular(6)
              ),
              child: Center(
                child: Text("${AppTexts.unarchive}",
                  style: TextStyle(fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w900
                  )
                  ,textAlign: TextAlign.center,),
              ),
            )

          ),
        ),
      ),
    );
  }
}
