import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:todo/core/features/Task%20Details/widgets/taskdetails.dart';
import 'package:todo/core/utils/Apptexts.dart';

import '../../../utils/Appcolors.dart';
import '../../../utils/Appimages.dart';
import '../../Tasks/model/model.dart';
import '../../regester_presntation/controller/theme_controller.dart';

class notes extends StatefulWidget {
  const notes(
      {
        required this.Photo, required this.Name,
        required this.Selected, required this.index, required this.onDismissed,
        // required this.title,
        // required this.subtitle
      });


  final index;
  final Photo;
 final Name;
 final  Selected;
  final void Function(DismissDirection)? onDismissed;
  // final String title;
  // final String subtitle;

  @override
  State<notes> createState() => _notesState(this.index,this.Name,this.Photo,this.Selected,this.onDismissed);
}

class _notesState extends State<notes> {
  final index;final Photo;final Name;
  final  Selected;final onDismissed;
  // final String title;
  // final String subtitle;

  _notesState(this.index,this.Name,this.Photo,this.Selected,this.onDismissed);


  @override
  Widget build(BuildContext context) {
    List<Notes> homelist =writenote.where((Notes)=>Notes.archive==false).toList();


    return  Dismissible(
        onDismissed:onDismissed,
      direction: DismissDirection.startToEnd,
      background: Container(
        child: Icon(Icons.delete_forever_sharp),
        decoration: BoxDecoration(
          color: Color(0xffBD5461),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      key: GlobalKey(),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) {
               return taskdetails(index:index,name:Name ,photo:Photo ,select:Selected ,);
            },));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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


                title: Text("${writenote[widget.index].taskName}",),
                subtitle:Text("${writenote[widget.index].selecttime}",),


              trailing: GestureDetector(
                onTap: () {
                   setState(() {

                     writenote[widget.index].done=!writenote[widget.index].done;


                   });


                },

                child: Container(
                  width: 60,
                  height: 28,
                  child:  Provider.of<ThemeProvider>(context).switchValue==false?
                  Center(
                      child:  writenote[widget.index].done ?
                      Text("${AppTexts.done}", textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15,color: Color(0xffFFFFFF)),)
                          :
                      GradientText("${AppTexts.done}",style: TextStyle(fontSize:15,fontWeight: FontWeight.w900 ), colors: [
                        AppColors.blue,
                        AppColors.move,
                      ]
                      ),
                  )
                      :
                  Center(child:  writenote[widget.index].done ? Text("${AppTexts.done}", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15,color: AppColors.buttondark),) : Text("${AppTexts.done}", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15,color: AppColors.white,fontWeight: FontWeight.w700),)
                  ),
                  decoration:Provider.of<ThemeProvider>(context).switchValue==false?
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: writenote[widget.index].done? Color(0xffFFFFFF):Color(0xff90B6E2),width: 2),
                    gradient: LinearGradient(colors:writenote[widget.index].done? [
                          AppColors.blue,
                          AppColors.move,
                        ]: [ AppColors.white, AppColors.white,]
                    ),
                  )
                  :
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: writenote[widget.index].done? AppColors.blue:Color(0xff90B6E2),width: 2),
                    color:writenote[widget.index].done? AppColors.blue
                    :AppColors.dark,
                  )

                  ,
                ),
              ),
                    ),
          ),
        ),
      ),
    );

  }
}
