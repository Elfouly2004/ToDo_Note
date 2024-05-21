import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/core/Appcolors.dart';
import 'package:todo/core/Apptexts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/features/Home/homescreen.dart';
import '../../core/Appimages.dart';

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
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);


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


               Center(
                 child: Image(image: AssetImage(AppImages.logo)),
               ),

               SizedBox(height:MediaQuery.sizeOf(context).height*0.01,),



               GestureDetector(
                 onTap: () {

                 },
                 child: Container(
                     height:MediaQuery.sizeOf(context).height*0.15,
                      width:MediaQuery.sizeOf(context).height*0.15 ,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     border: Border.all(color: AppColors.camera)
                   ),
                   child:myPhoto == null?
                   Icon(Icons.add_a_photo): ClipRRect(
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

                 child: Text(myPhoto ==null? AppTexts.Add: AppTexts.update)),

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

                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                       labelText: " Enter Your Name ",
                       contentPadding: EdgeInsets.only(left: 20,top: 80,),
                       hintText: "Your Name  ",
                       labelStyle: TextStyle(fontSize: 20),
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
               ),

               // Container(
               //   height:85 ,
               //   width: 331,
               //   decoration: BoxDecoration(
               //     borderRadius: BorderRadius.circular(20),
               //     border: Border.all(color: AppColors.blue)
               //
               //   ),
               //   child: Column(
               //     mainAxisAlignment: MainAxisAlignment.end,
               //     crossAxisAlignment: CrossAxisAlignment.start,
               //     children: [
               //       Padding(
               //         padding: const EdgeInsets.only(top: 10),
               //         child: Column(
               //           crossAxisAlignment: CrossAxisAlignment.start,
               //           children: [
               //
               //             Form(
               //               key:formkey1,
               //               child: TextFormField(
               //                 keyboardType: TextInputType.name,
               //                 style: TextStyle(
               //                    fontSize: 20,
               //                   fontWeight: FontWeight.w600,
               //
               //                 ),
               //                  decoration: InputDecoration(
               //                    border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),
               //                      labelText: " Enter Your Name ",
               //                    hintText: "Your Name  ",
               //                    labelStyle: TextStyle(fontSize: 20),
               //                  ),
               //
               //                 onChanged: (value) {
               //                  name=(value);
               //                 },
               //
               //                 validator: (value) {
               //                   if(value!.isEmpty==true){
               //                     return "you should write your name";
               //                   }else return null;
               //                 },
               //
               //               ),
               //             ),
               //           ],
               //         ),
               //       ),
               //     ],
               //   ),
               // ),

               SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),


               GestureDetector(
                 onTap: () {

                   if(formkey1.currentState!.validate()==true){
                     Navigator.pushReplacement(context, MaterialPageRoute(
                       builder: (context) {
                         return homescreen(name,photo:myPhoto!.path) ;
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
               ),




             ],

           ),
         ),
       ),

    );
  }
}
