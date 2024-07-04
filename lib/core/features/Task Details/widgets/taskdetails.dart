import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/features/Home/homescreen.dart';
import 'package:todo/core/features/Home/widgets/homebody.dart';
import 'package:todo/core/features/Tasks/model/model.dart';
import 'package:todo/core/utils/Appimages.dart';
import '../../../utils/Appcolors.dart';
import '../../../utils/Apptexts.dart';

class taskdetails extends StatefulWidget {

  taskdetails({required this.index});
  final index;


  @override
  State<taskdetails> createState() => _taskdetailsState(this.index);
}

class _taskdetailsState extends State<taskdetails> {
  final index;
  _taskdetailsState(this.index);
  String  ?taskname;
  String? description;
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

    return Scaffold(


      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Task details",
          textAlign: TextAlign.center,
          style: TextStyle(),),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(image: AssetImage(AppImages.back),)),


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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Task Name",style: TextStyle(
                        fontSize: 14
                    ),),

                    Text("${writenote[widget.index].taskName}",style: TextStyle(
                        fontSize: 14,color: Color(0xff8E8E8E)
                    ),),



                  ],

                ),
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),

              Container(
                height: 142,
                width: 331,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Description",style: TextStyle(
                        fontSize: 14
                    ),),


                    Text("${writenote[widget.index].decsrption}",style: TextStyle(
                        fontSize: 14,color: Color(0xff8E8E8E)
                    ),),

                  ],

                ),
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),

              Card(
                child: ListTile(
                    leading: Image(image: AssetImage(AppImages.date),),
                    title: Text('Start Date'),
                    subtitle:   Text("${writenote[widget.index].starttask}",style: TextStyle(
                        fontSize: 14
                    ),),
                    trailing: IconButton(
                      onPressed: () =>  _selectDate1(context),

                      icon: Icon(Icons.arrow_drop_down_circle),
                    )
                  // isThreeLine: true,
                ),
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.02,),

              Card(
                child: ListTile(
                    leading: Image(image: AssetImage(AppImages.date),),
                    title: Text('End Date'),
                    subtitle:
                    Text("${writenote[widget.index].Endtask}",style: TextStyle(
                        fontSize: 14
                    ),),
                    trailing: IconButton(
                      onPressed: () => _selectDate2(context),
                      icon: Icon(Icons.arrow_drop_down_circle),
                    )
                  // isThreeLine: true,
                ),
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.02,),

              Card(
                child: ListTile(
                    leading: Image(image: AssetImage(AppImages.timelogo),),
                    title: Text('Add Time'),
                    subtitle:
                    Text("${writenote[widget.index].selecttime}",),
                    trailing: IconButton(
                      onPressed: () => _selectTime(context),
                      icon: Icon(Icons.arrow_drop_down_circle),
                    )
                  // isThreeLine: true,
                ),
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),

              GestureDetector(
                onTap:() {

                },
                child: Container(
                  height:52 ,
                  width: 331,

                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            AppColors.blue,
                            AppColors.move,
                          ]
                      ),
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

              setState(() {
                writenote.remove(
                    Notes(
                        taskName:taskname,
                        decsrption: description,
                        selecttime:selectedTime.format(context),
                        starttask: selectedDate1,
                        Endtask: selectedDate2)
                );

              });
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

              // Text("${selectedTime.format(context)}")
              //

            ],
          ),
        ),
      ),
    );
  }
}



