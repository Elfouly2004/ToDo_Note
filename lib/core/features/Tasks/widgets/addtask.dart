import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/features/Home/homescreen.dart';
import 'package:todo/core/features/Home/widgets/homebody.dart';
import 'package:todo/core/features/Tasks/model/model.dart';
import 'package:todo/core/utils/Appimages.dart';
import '../../../utils/Appcolors.dart';
import '../../../utils/Apptexts.dart';
import '../model/model.dart';

class addtask extends StatefulWidget {
 addtask(this.name,{required this.photo,});
  String name="";
  final String photo;

  @override
  State<addtask> createState() => _addtaskState(this.name,this.photo);
}

class _addtaskState extends State<addtask> {
  String name="";
  final String photo;
  _addtaskState(this.name,this.photo);
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



  GlobalKey<FormState> formkey1= GlobalKey <FormState>();
  GlobalKey<FormState> formkey2= GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Add Task",
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


                     Form(
                      key:formkey1,
                      child: TextFormField(
                        controller: namecontroller,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,

                          hintText: " Enter The Task Name   ",
                          hintStyle: TextStyle(fontSize: 15,color: Color(0xff6E6A7C)),
                        ),
                        validator: (value) {
                          if(value!.isEmpty==true){
                            return "you should write your task name";
                          }else return null;
                        },


                      ),
                    ),
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

                    Form(
                      key:formkey2,
                      child: TextFormField(
                         controller: descriptioncontroller,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Enter The Task Desciption    ",
                          hintStyle: TextStyle(fontSize: 15,color: Color(0xff6E6A7C)),
                        ),

                        validator: (value) {
                          if(value!.isEmpty==true){
                            return "you should write your task name";
                          }else return null;
                        },


                      ),
                    ),
                  ],

                ),
              ),
        
              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),
        
              Card(
                child: ListTile(
                    leading: Image(image: AssetImage(AppImages.date),),
                    title: Text('Start Date'),
                    subtitle: Text('Enter The Start Date',),
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
                    Text('Enter The End Date',),
                    trailing: IconButton(
                      onPressed: () => _selectDate2(context),
                      icon: Icon(Icons.arrow_drop_down_circle),
                    )
                  // isThreeLine: true,
                ),
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),


              GestureDetector(
                onTap:() {

                    String taskname = namecontroller.text.trim();
                    String description =descriptioncontroller.text.trim();
                    if(taskname.isNotEmpty&&description.isNotEmpty){
                      namecontroller.text='';
                      descriptioncontroller.text='';
                      writenote.add(Notes(taskName:taskname, decsrption: description));

                      Navigator.push(context, MaterialPageRoute(builder: (context) =>homescreen(name, photo: photo, SelectedDate1:selectedDate1,SelectedDate2: selectedDate2,) ,)).then((k){
                        setState(() {

                        });
                      });

                    }

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
                      Text("${AppTexts.Addtask}",
                        style: TextStyle(fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900
                        )
                        ,textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
              
              // Text("${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}",style: TextStyle(color: Colors.black),),
              //
              // Text("$selectedDate2")
              //
        
            ],
          ),
        ),
      ),
    );
  }
}



