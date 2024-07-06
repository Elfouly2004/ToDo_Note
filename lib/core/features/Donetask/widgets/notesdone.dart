import 'package:flutter/material.dart';
import 'package:todo/core/features/Tasks/model/model.dart';

import '../../../utils/Appcolors.dart';
import '../../../utils/Appimages.dart';
import '../../../utils/Apptexts.dart';

class donenotes extends StatefulWidget {
  const donenotes({required this.index});
  final index;

  @override
  State<donenotes> createState() => _donenotesState(this.index);
}

class _donenotesState extends State<donenotes> {
  final index;

  _donenotesState(this.index);
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


          title: Text("${Done[widget.index].taskName}",
            style: TextStyle(fontWeight: FontWeight.w600),),
          subtitle:Text("${Done[widget.index].selecttime}",
            style:TextStyle(
                color: Color(0xff90B6E2)
            ) ,
          ),


          trailing: Column(
            children: [
              Text("${Done[widget.index].starttask}"),

              Text("${Done[widget.index].Endtask}"),


            ],
          ),
        ),
      ),
    );
  }
}