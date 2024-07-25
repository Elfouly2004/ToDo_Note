import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/features/Tasks/model/model.dart';

import '../../../utils/Appcolors.dart';
import '../../../utils/Appimages.dart';
import '../../Home/presntation/controller/homecontroller.dart';
import '../../regester_presntation/controller/theme_controller.dart';

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
    Provider.of<Homecontroller>(context,).Done = Provider.of<Homecontroller>(context,).writenote.where((Notes)=>Notes.done==true).toList();

    return Padding(
      padding: EdgeInsets.all(10),
      child: ListTile(


        leading: Container(
          width: 40,
          height: 40,
          decoration:Provider.of<ThemeProvider>(context).switchValue==false?
          BoxDecoration(
              gradient: LinearGradient(
                  colors: [ AppColors.blue.withOpacity(0.4), AppColors.move.withOpacity(0.4),]
              )  ,
              borderRadius: BorderRadius.circular(10)
          )
              :
          BoxDecoration(
              gradient: LinearGradient(
                  colors: [ AppColors.color1icon.withOpacity(0.2), AppColors.color2icon.withOpacity(0.2),]
              )  ,
              borderRadius: BorderRadius.circular(10)
          ),

          child: Center(
              child:  Image(
                image: AssetImage(AppImages.task),height: 30,width: 30,
              )
          ),
        ),


        title: Text("${Provider.of<Homecontroller>(context,).Done[widget.index].taskName}",
          style: TextStyle(fontWeight: FontWeight.w600),),
        subtitle:Text("${Provider.of<Homecontroller>(context,).Done[widget.index].selecttime}",
          style:TextStyle(
              color: Color(0xff90B6E2)
          ) ,
        ),


        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${Provider.of<Homecontroller>(context,).Done[widget.index].starttask.toString().split(" ")[0]}",
              style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 5,),
            Text("${Provider.of<Homecontroller>(context,).Done[widget.index].Endtask.toString().split(" ")[0]}",
                style: Theme.of(context).textTheme.bodyLarge),


          ],
        ),
      ),
    );
  }
}
