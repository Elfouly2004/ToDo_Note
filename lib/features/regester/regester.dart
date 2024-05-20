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
  // GlobalKey<FormState> formkey1= GlobalKey <FormState>();


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
                       borderRadius: BorderRadius.circular(15),
                       child: Image.file(File(myPhoto!.path))),
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



               Container(
                 height:85 ,
                 width: 331,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   border: Border.all(color: AppColors.blue)

                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           TextFormField(
                             keyboardType: TextInputType.name,
                             style: TextStyle(
                                fontSize: 20,
                               fontWeight: FontWeight.w600,

                             ),
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                  labelText: " Enter Your Name ",
                                hintText: "Your Name  ",
                                labelStyle: TextStyle(fontSize: 20),
                              ),

                             onChanged: (value) {
                              name=(value);
                             },

                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),

               SizedBox(height:MediaQuery.sizeOf(context).height*0.05,),


               GestureDetector(
                 onTap: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(
                     builder: (context) {
                       return homebody(name,photo:myPhoto!.path) ;
                     },));
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
