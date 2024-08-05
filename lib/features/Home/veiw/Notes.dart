import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:todo/core/utils/Apptexts.dart';
import '../../../core/utils/Appcolors.dart';
import '../../../core/utils/Appimages.dart';
import '../../Task Details/widgets/taskdetails.dart';
import '../../regester_presntation/controller/theme_controller.dart';
import '../presntation/controller/homecontroller.dart';

class notes extends StatefulWidget {
  const notes(
      {
        required this.index,
        required this.onDismissed,
        required this.onTap
      }
      );


  final index;
  final void Function()? onTap;
  final void Function(DismissDirection)? onDismissed;


  @override
  State<notes> createState() => _notesState(this.index ,this.onDismissed,this.onTap);
}

class _notesState extends State<notes> {
  final index;
  final onDismissed;
  final void Function()? onTap;


  _notesState(this.index,this.onDismissed,this.onTap);


  @override
  Widget build(BuildContext context) {


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
               return taskdetails(index: index, onTap:onTap,);
            }
            ));
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


                title: Text("${ Provider.of<Homecontroller>(context,).writenote[widget.index].taskName}",),
                subtitle:Text("${ Provider.of<Homecontroller>(context,).writenote[widget.index].selecttime}",),


              trailing: GestureDetector(
                onTap: () {
                  Provider.of<Homecontroller>(context,listen: false).updateadone(index);

                },

                child: Container(
                  width: 60,
                  height: 28,
                  child:  Provider.of<ThemeProvider>(context,).switchValue==false?
                  Center(
                      child:   Provider.of<Homecontroller>(context,).writenote[widget.index].done ?
                      Text(
                        "${AppTexts.done}", textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15,color: Color(0xffFFFFFF)),)
                          :
                      GradientText("${AppTexts.done}",style: TextStyle(fontSize:15,fontWeight: FontWeight.w900 ),
                          colors: [
                        AppColors.blue,
                        AppColors.move,]
                      ),
                  )
                      :
                  Center(child:
                  Provider.of<Homecontroller>(context,).writenote[widget.index].done ? Text("${AppTexts.done}", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15,color: AppColors.buttondark),)
                      :
                  Text("${AppTexts.done}", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15,color: AppColors.white,fontWeight: FontWeight.w700),)
                  ),

                  decoration:Provider.of<ThemeProvider>(context).switchValue==false?
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color:  Provider.of<Homecontroller>(context,).writenote[widget.index].done? Color(0xffFFFFFF):Color(0xff90B6E2),width: 2),
                    gradient: LinearGradient(colors: Provider.of<Homecontroller>(context,).writenote[widget.index].done? [
                          AppColors.blue,
                          AppColors.move,
                        ]: [ AppColors.white, AppColors.white,]
                    ),
                  )
                  :
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color:  Provider.of<Homecontroller>(context,).writenote[widget.index].done? AppColors.blue:Color(0xff90B6E2),width: 2),
                    color: Provider.of<Homecontroller>(context,).writenote[widget.index].done? AppColors.blue
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
