import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:todo/core/features/Task%20Details/widgets/taskdetails.dart';

import '../../../utils/Appcolors.dart';
import '../../../utils/Appimages.dart';
import '../../Tasks/model/model.dart';
class notes extends StatefulWidget {
  const notes(
      {
        required this.Photo,
        required this.Name,
        required this.Selected,
        required this.index
      });
  final index;
final Photo;
 final Name;
 final  Selected;
  @override
  State<notes> createState() => _notesState(this.index,this.Name,this.Photo,this.Selected);
}

class _notesState extends State<notes> {
  final index;
  final Photo;
  final Name;
  final  Selected;
  _notesState(this.index,this.Name,this.Photo,this.Selected);
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return  Dismissible(

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
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: ListTile(
              focusColor: Colors.black,

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


                  title: Text("${writenote[widget.index].taskName}",style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle:Text("${writenote[widget.index].selecttime}",
                    style:TextStyle(
                      color: Color(0xff90B6E2)
                    ) ,
                  ),


                trailing: GestureDetector(
                  onTap: () {
                     setState(() {

                     });
                 click=!click;
                  },

                  child: Container(
                    width: 60,
                    height: 28,
                    child: Center(
                        child:  click ? Text("Done",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15,color: Color(0xffFFFFFF)),

                    ) : GradientText("Done",style: TextStyle(fontSize:15,fontWeight: FontWeight.w900 ), colors: [
                          AppColors.blue,
                          AppColors.move,
                        ]
                        ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: click? Color(0xffFFFFFF):Color(0xff90B6E2)),
                      gradient: LinearGradient(colors:click? [
                            AppColors.blue,
                            AppColors.move,
                          ]: [ AppColors.white, AppColors.white,]
                      ),
                    ),
                  ),
                ),
                      ),
            ),
          ),
        ),
      ),
    );

  }
}
