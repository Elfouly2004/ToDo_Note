import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/features/Tasks/model/model.dart';
import 'package:todo/core/utils/Appimages.dart';
import '../../../utils/Appcolors.dart';
import '../../../utils/Apptexts.dart';

class addtask extends StatefulWidget {
  const addtask({super.key});

  @override
  State<addtask> createState() => _addtaskState();
}

class _addtaskState extends State<addtask> {
  String taskname="";
  final myController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
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
        
              Center(
                child: Form(
                  key:formkey1,
                  child: TextFormField(
        
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
        
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
        
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: " Enter The Task Name   ",
                      contentPadding: EdgeInsets.only(left: 20,top: 40,),
        
                      labelStyle: TextStyle(fontSize: 15),
                    ),

                    validator: (value) {
                      if(value!.isEmpty==true){
                        return "you should write your name";
                      }else return null;
                    },
                    controller: TextEditingController(),
                    onChanged: (value) {
                      // Notes(textName: taskname);
                      // value=taskname;
                    },


        
                  ),
                ),
              ),
        
              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),
        
              Center(
                child: Form(
                  key:formkey2,
                  child: TextFormField(
        
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
        
                    ),
                    maxLines: 5,
                    minLines: 5,
                    decoration: InputDecoration(
        
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      labelText: "Enter The Task Desciption  ",
                      contentPadding: EdgeInsets.all(10),
        
        
                      labelStyle: TextStyle(fontSize: 15),
                    ),
        
        
                    // onChanged: (value) {
                    //   name=(value);
                    // },
        
                    validator: (value) {
                      if(value!.isEmpty==true){
                        return "you should write your name";
                      }else return null;
                    },
        
                  ),
                ),
              ),
        
              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),
        
              Card(
                child: ListTile(
                    leading: Image(image: AssetImage(AppImages.date),),
                    title: Text('Start Date'),
                    subtitle: Text('Enter The Start Date',),
                    trailing: IconButton(
                      onPressed: () =>  _selectDate(context),

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
                      onPressed: () => _selectDate(context),
                      icon: Icon(Icons.arrow_drop_down_circle),
                    )
                  // isThreeLine: true,
                ),
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),


              GestureDetector(
                onTap: () {
                  // Note.add(Notes(textName: taskname));
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
        
        
            ],
          ),
        ),
      ),
    );
  }
}
