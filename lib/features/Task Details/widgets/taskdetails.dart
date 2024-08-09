import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/Appimages.dart';
import '../../../core/utils/Appcolors.dart';
import '../../../core/utils/Apptexts.dart';
import '../../Home/presntation/controller/homecontroller.dart';
import '../../regester_presntation/controller/theme_controller.dart';
import 'custom_dialog.dart';

class taskdetails extends StatefulWidget {

  taskdetails({required this.index,  required this.onTap});

  final index;
  final void Function()? onTap;



  @override
  State<taskdetails> createState() => _taskdetailsState(this.index,this.onTap);
}

class _taskdetailsState extends State<taskdetails> {
  final index;
  final void Function()? onTap;

  _taskdetailsState(this.index,this.onTap);


  GlobalKey<FormState> formkey1= GlobalKey <FormState>();
  GlobalKey<FormState> formkey2= GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    Provider.of<Homecontroller>(context,listen: false). Archivelist
    = Provider.of<Homecontroller>(context,listen: false).writenote.where((Notes)=>Notes.archive==true).toList();


    return Scaffold(


      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Provider.of<ThemeProvider>(context).switchValue==false?
        AppColors.white:AppColors.dark,
        centerTitle: true,
        title: Text("${AppTexts.taskdetails}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(image: AssetImage(AppImages.back),
              color: Provider.of<ThemeProvider>(context).switchValue==false?
              AppColors.black:AppColors.white,)),


      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              SizedBox(height:MediaQuery.sizeOf(context).height*0.01,),

              Container(
                height: 90,
                width: 331,
                decoration:  BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).switchValue==false?
                  Colors.white
                      :AppColors.listtiledark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${AppTexts.taskname}",style: TextStyle(
                          fontSize: 14
                      ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("${ Provider.of<Homecontroller>(context,).writenote[widget.index].taskName}",style: TextStyle(
                          fontSize: 14,color: Color(0xff8E8E8E)
                      ),),
                    ),



                  ],

                ),
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),

              Container(
                height: 142,
                width: 331,
                decoration:  BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).switchValue==false?
                  Colors.white
                      :AppColors.listtiledark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${AppTexts.Description}",style: TextStyle(
                          fontSize: 14
                      ),),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("${ Provider.of<Homecontroller>(context,).writenote[widget.index].decsrption}",style: TextStyle(
                          fontSize: 14,color: Color(0xff8E8E8E)
                      ),),
                    ),

                  ],

                ),
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),

              ListTile(
                  leading: Image(image: AssetImage(AppImages.date),),
                  title: Text("${AppTexts.StartDate}"),
                  subtitle:   Text("${ Provider.of<Homecontroller>(context,).writenote[widget.index].starttask}",style: TextStyle(
                      fontSize: 14
                  ),),
                  trailing: IconButton(
                    onPressed: () =>  Provider.of<Homecontroller>(context,).SelectDate1(context),

                    icon:Icon(Icons.arrow_drop_down_circle,
                      color: Provider.of<ThemeProvider>(context).switchValue==false?
                      AppColors.black:AppColors.white,),
                  )
                // isThreeLine: true,
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.02,),

              ListTile(
                  leading: Image(image: AssetImage(AppImages.date),),
                  title: Text("${AppTexts.EndtDate}"),
                  subtitle:
                  Text("${ Provider.of<Homecontroller>(context,).writenote[widget.index].Endtask}",
                    style: TextStyle(
                      fontSize: 14
                  ),),
                  trailing: IconButton(
                    onPressed: () => Provider.of<Homecontroller>(context,).SelectDate2(context),
                    icon: Icon(Icons.arrow_drop_down_circle,
                      color: Provider.of<ThemeProvider>(context).switchValue==false?
                      AppColors.black:AppColors.white,),
                  )
                // isThreeLine: true,
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.02,),

              ListTile(
                  leading: Image(image: AssetImage(AppImages.timelogo),),
                  title: Text("${AppTexts.AddTime}"),
                  subtitle:
                  Text("${ Provider.of<Homecontroller>(context,).writenote[widget.index].selecttime}",),
                  trailing: IconButton(
                    onPressed: () =>  Provider.of<Homecontroller>(context,).SelectTime(context),
                    icon: Icon(Icons.arrow_drop_down_circle,
                      color: Provider.of<ThemeProvider>(context).switchValue==false?
                      AppColors.black:AppColors.white,),
                  )
                // isThreeLine: true,
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),

              GestureDetector(
                onTap:() {
                 Provider.of<Homecontroller>(context,listen: false).
                 updatearchive(context,index);
                },
                child: Container(
                  height:52 ,
                  width: 331,

                  decoration: Provider.of<ThemeProvider>(context).switchValue==false?
                  BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            AppColors.blue,
                            AppColors.move,
                          ]
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ):  BoxDecoration(
                     color: AppColors.buttondark,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${AppTexts.archive}",
                        style: TextStyle(fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900
                        )
                        ,textAlign: TextAlign.center,),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(image:AssetImage(AppImages.archive),height: 20,width: 20,),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.01,),


              GestureDetector(
                onTap:() {

                  showDialog(context: context, builder: (context) {
                      return customdialog(index: index,
                        onTap: onTap,

                      );
                    },
                  );




                },
                child: Container(
                  height:52 ,
                  width: 331,

                  decoration: BoxDecoration(
                     color: Color(0xffBD5461),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${AppTexts. delete}",
                        style: TextStyle(fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900
                        )
                        ,textAlign: TextAlign.center,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(image:AssetImage(AppImages.Delete),height: 20,width: 20,),
                      )



                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}



