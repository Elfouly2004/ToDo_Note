import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/Appimages.dart';
import '../../../core/utils/Appcolors.dart';
import '../../../core/utils/Apptexts.dart';
import '../../Home/presntation/controller/homecontroller.dart';
import '../../regester_presntation/controller/theme_controller.dart';

class addtask extends StatefulWidget {
 addtask();

  @override
  State<addtask> createState() => _addtaskState();
}

class _addtaskState extends State<addtask> {



  GlobalKey<FormState> formkey1= GlobalKey <FormState>();
  GlobalKey<FormState> formkey2= GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor:  Provider.of<ThemeProvider>(context).switchValue==false?
        AppColors.white:AppColors.dark,
        centerTitle: true,
        title: Text("Add Task",
          textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,),
        leading: GestureDetector(
          onTap: () {
          Navigator.pop(context);
          },
            child: Image(image: AssetImage(AppImages.back),color: Provider.of<ThemeProvider>(context).switchValue==false?
            AppColors.black:AppColors.white,)),


      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              SizedBox(height:MediaQuery.sizeOf(context).height*0.01,),
        
              Container(

                width: 331,
                decoration:  BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).switchValue==false?
                  Colors.white:AppColors.listtiledark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      
                      child: Text("Task Name",style: TextStyle(
                            fontSize: 14
                          ),),
                      padding: EdgeInsets.all(5),
                    ),


                     Form(
                      key:formkey1,
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 1,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        controller: Provider.of<Homecontroller>(context).namecontroller,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,

                          hintText: "   Enter The Task Name   ",
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
                width: 331,
                decoration:  BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).switchValue==false?
                  Colors.white:AppColors.listtiledark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Description",style: TextStyle(
                          fontSize: 14
                      ),),
                    ),

                    Form(
                      key:formkey2,
                      child: TextFormField(
                        minLines: 3,
                        maxLines: 6,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                         controller: Provider.of<Homecontroller>(context). descriptioncontroller,
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
        




              ListTile(
                  leading: Image(image: AssetImage(AppImages.date),),
                  title: Text('Start Date'),
                  subtitle: Text('Enter The Start Date',),
                  trailing: IconButton(
                    onPressed: () =>  Provider.of<Homecontroller>(context,listen: false).SelectDate1(context),

                    icon: Icon(Icons.arrow_drop_down_circle,
                      color: Provider.of<ThemeProvider>(context).switchValue==false?
                      AppColors.black:AppColors.white,),
                  )
                // isThreeLine: true,
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.02,),

              ListTile(
                  leading: Image(image: AssetImage(AppImages.date),),
                  title: Text('End Date'),
                  subtitle:Text('Enter The End Date',),
                  trailing: IconButton(
                    onPressed: () => Provider.of<Homecontroller>(context,listen: false).SelectDate2(context),
                    icon: Icon(Icons.arrow_drop_down_circle,
                      color: Provider.of<ThemeProvider>(context).switchValue==false?
                      AppColors.black:AppColors.white,),
                  )
                // isThreeLine: true,
              ),

              SizedBox(height:MediaQuery.sizeOf(context).height*0.02,),

              ListTile(
                  leading: Image(image: AssetImage(AppImages.timelogo),),
                  title: Text('Add Time'),
                  subtitle: Text('Set a Time For The Task',),
                  trailing: IconButton(
                    onPressed: () => Provider.of<Homecontroller>(context,listen: false).SelectTime( context),
                    icon: Icon(Icons.arrow_drop_down_circle,
                      color: Provider.of<ThemeProvider>(context).switchValue==false?
                      AppColors.black:AppColors.white,),
                  )
                // isThreeLine: true,
              ),


              SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),

              GestureDetector(
                onTap:() {



             Provider.of<Homecontroller>(context,listen: false).addNote(
               title:Provider.of<Homecontroller>(context,listen: false).namecontroller.text,
               des: Provider.of<Homecontroller>(context,listen : false).descriptioncontroller.text,
              context: context,);
















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
                  )
                      :
                  BoxDecoration(
                    color: AppColors.buttondark,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("${AppTexts.Addtask}",
                      style: TextStyle(fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w900
                      )
                      ,textAlign: TextAlign.center,),
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



