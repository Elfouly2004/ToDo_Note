import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/Appcolors.dart';
import 'package:todo/core/utils/Apptexts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/utils/theme.dart';

import '../../../utils/Appimages.dart';

import '../../Home/homescreen.dart';
import '../controller/theme_controller.dart';

class regester extends StatefulWidget {
  const regester({super.key});

  @override
  State<regester> createState() => _regesterState();
}

class _regesterState extends State<regester> {

  String name ="";
  GlobalKey<FormState> formkey1= GlobalKey <FormState>();


  XFile ? myPhoto ;
  // myPhoto = null ;
  Future<XFile?>   pickImage( ) async{
     ImagePicker picker = ImagePicker();
     XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }



  @override
  Widget build(BuildContext context) {

    return  Scaffold(


       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(20),

           child: Column(
             children: [


               SizedBox(height:MediaQuery.sizeOf(context).height*0.1,),

               Center(
                 child: Image(image: AssetImage(AppImages.logo),height:
                 248.67,
                 width: 268,),
               ),

               SizedBox(height:MediaQuery.sizeOf(context).height*0.01,),



               GestureDetector(
                 onTap: () {
                   pickImage().then((value) {
                     myPhoto = (value);
                     setState(() {

                     });
                   });
                 },
                 child: Container(
                     height:MediaQuery.sizeOf(context).height*0.15,
                      width:MediaQuery.sizeOf(context).height*0.15 ,
                   decoration: Provider.of<ThemeProvider>(context).switchValue==false?BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       border: Border.all(color: AppColors.camera,width: 2)
                   )
                   :BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       border: Border.all(color: AppColors.camera,width: 2)
                   ),
                   child:myPhoto == null?
                   Icon(Icons.add_a_photo,
                     color: Provider.of<ThemeProvider>(context).switchValue==false?AppColors.black:AppColors.white,)
                       : ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.file(File(myPhoto!.path),fit: BoxFit.cover,
                         height:MediaQuery.sizeOf(context).height*0.1,
                           width:MediaQuery.sizeOf(context).height*0.1 ,)),
                 ),
                 ),


               TextButton(

                 onPressed: ( ) {
                   pickImage().then((value) {
                     myPhoto = (value);
                     setState(() {

                     });
                   });
                 },
                   

                 child: Text(myPhoto ==null? AppTexts.Add: AppTexts.update,
                  style: Theme.of(context).textTheme.bodyMedium,)
               ),

               Container(
                 height:110 ,
                 width: 331,
                 decoration: Provider.of<ThemeProvider>(context).switchValue==false?BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     border: Border.all( color: AppColors.blue,width: 2),)
                     :
                 BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     border: Border.all( color: Color(0xff87B5E3),width: 2)

                 ),
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top:10),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [

                           Text("  Your Name :",style: Theme.of(context).textTheme.bodyMedium, ),
                           Form(
                             key:formkey1,
                             child: TextFormField(

                               keyboardType: TextInputType.name,
                               style:Theme.of(context).textTheme.titleLarge,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  // disabledBorder: InputBorder.none,
                                  hintText: " Enter Your Name  ",
                                  hintStyle: Theme.of(context).textTheme.bodySmall,
                                ),

                               onChanged: (value) {
                                name=(value);
                               },

                               validator: (value) {
                                 if(value!.isEmpty==true){
                                   return "you should write your name";
                                 }else return null;
                               },

                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),



               SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),


               Provider.of<ThemeProvider>(context).
               switchValue == false?
               GestureDetector(
                 onTap: () {

                   if(formkey1.currentState!.validate()==true&&myPhoto!=null){
                     Navigator.pushReplacement(context, MaterialPageRoute(
                       builder: (context) {
                         return homescreen(name,photo:myPhoto!.path,selecttime: null ,) ;
                       },));

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
                       Text("${AppTexts.Get}",
                         style: TextStyle(fontSize: 20,
                         color: Colors.white,
                           fontWeight: FontWeight.w900
                         )
                         ,textAlign: TextAlign.center,),
                     ],
                   ),
                 ),
               ):
               GestureDetector(
                 onTap: () {

                   if(formkey1.currentState!.validate()==true&&myPhoto!=null){
                     Navigator.pushReplacement(context, MaterialPageRoute(
                       builder: (context) {
                         return homescreen(name,photo:myPhoto!.path,selecttime: null ,) ;
                       },));

                   }
                 },
                 child: Container(
                   height:52 ,
                   width: 331,
                   decoration: BoxDecoration(
                       color: AppColors.buttondark,
                       borderRadius: BorderRadius.circular(10)
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("${AppTexts.Get}",
                         style: TextStyle(fontSize: 20,
                             color: Colors.white,
                             fontWeight: FontWeight.w900
                         )
                         ,textAlign: TextAlign.center,),
                     ],
                   ),
                 ),
               )



             ],

           ),
         ),
       ),

    );
  }
}
