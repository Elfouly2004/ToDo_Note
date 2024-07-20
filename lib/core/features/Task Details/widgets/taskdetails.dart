import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/features/Home/homescreen.dart';
import 'package:todo/core/features/Task%20Details/widgets/custom_dialog.dart';
import 'package:todo/core/features/Tasks/model/model.dart';
import 'package:todo/core/utils/Appimages.dart';
import '../../../utils/Appcolors.dart';
import '../../../utils/Apptexts.dart';
import '../../regester_presntation/controller/theme_controller.dart';

class taskdetails extends StatefulWidget {

  taskdetails(
      {
    required this.index,
    required this.name,
    required this.photo,
    required this.select,
  }
  );
  final index;
  final name;
  final photo;
  final select;

  @override
  State<taskdetails> createState() =>
      _taskdetailsState(this.index,this.name,this.photo,this.select);
}

class _taskdetailsState extends State<taskdetails> {
  final index;
  final name;
  final photo;
  final select;
  _taskdetailsState(this.index,this.name,this.photo,this.select);

  TextEditingController namecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  DateTime selectedDate1 = DateTime.now();
  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate1) {
      setState(() {
        selectedDate1 = picked;
      });
    }
  }



  DateTime selectedDate2 = DateTime.now();
  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate2) {
      setState(() {
        selectedDate2 = picked;
      });
    }
  }


  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime, builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );});
    if (picked_s != null && picked_s != selectedTime.format(context) )
      setState(() {
        selectedTime = picked_s;
      });
  }


  GlobalKey<FormState> formkey1= GlobalKey <FormState>();
  GlobalKey<FormState> formkey2= GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    List<Notes> Archivelist =writenote.where((Notes)=>Notes.archive==true).toList();


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
                      child: Text("${writenote[widget.index].taskName}",style: TextStyle(
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
                      child: Text("${writenote[widget.index].decsrption}",style: TextStyle(
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
                  subtitle:   Text("${writenote[widget.index].starttask}",style: TextStyle(
                      fontSize: 14
                  ),),
                  trailing: IconButton(
                    onPressed: () =>  _selectDate1(context),

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
                  Text("${writenote[widget.index].Endtask}",
                    style: TextStyle(
                      fontSize: 14
                  ),),
                  trailing: IconButton(
                    onPressed: () => _selectDate2(context),
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
                  Text("${writenote[widget.index].selecttime}",),
                  trailing: IconButton(
                    onPressed: () => _selectTime(context),
                    icon: Icon(Icons.arrow_drop_down_circle,
                      color: Provider.of<ThemeProvider>(context).switchValue==false?
                      AppColors.black:AppColors.white,),
                  )
                // isThreeLine: true,
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),

              GestureDetector(
                onTap:() {
               setState(() {



                 Navigator.push(context,MaterialPageRoute(
                   builder: (context) => homescreen(
                       name,
                       photo: photo,
                       selecttime: selectedTime
                   ),
                 )
                 );

                 writenote[widget.index].archive=true;


                 Archivelist.add(Notes(
                   taskName: writenote[widget.index].taskName,
                   decsrption: writenote[widget.index].decsrption,
                   selecttime: selectedTime.format(context),
                   starttask: selectedDate1.toString().split(" ")[0],
                   Endtask: selectedDate2.toString().split(" ")[0],
                   archive: true,
                 ));

                 // writenote.removeAt(widget.index);


               //  List<Notes> Archivelist =writenote.where((Notes)=>Notes.archive==true).toList();


               });
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

                  showDialog(context: context,
                    builder:
                        (context) {
                      return customdialog(index: index,select: select,photo: photo,name: name,);
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



