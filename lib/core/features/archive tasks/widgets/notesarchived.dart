import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/Appcolors.dart';
import '../../../utils/Appimages.dart';
import '../../../utils/Apptexts.dart';
import '../../Home/presntation/controller/homecontroller.dart';
import '../../regester_presntation/controller/theme_controller.dart';

class archivenotes extends StatefulWidget {
  const archivenotes({required this.index,required this.onTap});
  final index;
  final void Function()?onTap;

  @override
  State<archivenotes> createState() => _archivenotesState(this.index,this.onTap);
}

class _archivenotesState extends State<archivenotes> {


  final index;
  final onTap;
  _archivenotesState(this.index,this.onTap);
  @override
  Widget build(BuildContext context) {
    Provider.of<Homecontroller>(context).Archivelist = Provider.of<Homecontroller>(context).writenote.where((Notes)=>Notes.archive==true).toList();

    return Padding(
      padding: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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


          title: Text("${  Provider.of<Homecontroller>(context,).Archivelist[widget.index].taskName}",
            style: TextStyle(fontWeight: FontWeight.w600),),
          subtitle:Text("${  Provider.of<Homecontroller>(context,).Archivelist[widget.index].selecttime}",
            style:TextStyle(
                color: Color(0xff90B6E2)
            ) ,
          ),


          trailing: GestureDetector(
            onTap: onTap,

            child: Container(
              height:30 ,
              width:77,

              decoration: Provider.of<ThemeProvider>(context).switchValue==false?
              BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        AppColors.move,
                        AppColors.blue
                      ]
                  ),
                  borderRadius: BorderRadius.circular(6)
              ):
              BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(6)
              ),
              child: Center(
                child: Text("${AppTexts.unarchive}",
                  style: TextStyle(fontSize: 15,
                      color: Provider.of<ThemeProvider>(context).switchValue==false?
                      AppColors.white
                      :Color(0xff24364B),
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
