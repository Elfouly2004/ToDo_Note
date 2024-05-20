import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/core/Appcolors.dart';
import 'package:todo/core/Apptexts.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/Appimages.dart';

class regester extends StatelessWidget {
  const regester({super.key});

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
                   child:Center(
                     child: Icon(
                       Icons.camera_enhance_sharp,
                       color: AppColors.camera,
                     ),
                   ) ,
                 ),
               ),
               
               
               
               TextButton(
                 onPressed: () {
         
                 },
                   child: Text(AppTexts.Add),
                 ),
         
         
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

                             style: TextStyle(
                                fontSize: 20,
                               fontWeight: FontWeight.w600,

                             ),
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                  labelText: " Enter Your Name ",
                                hintText: "Your Name  ",
                                labelStyle: TextStyle(fontSize: 20)



                              ),

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
                       return regester();
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
                       Text("${AppTexts.Get}",textAlign: TextAlign.center,),
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
