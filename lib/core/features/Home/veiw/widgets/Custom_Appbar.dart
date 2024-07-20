// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../utils/Appcolors.dart';
// import '../../../../utils/Appimages.dart';
// import '../../../../utils/Apptexts.dart';
// import '../../../regester_presntation/controller/theme_controller.dart';
//
// class Custom_Appbar extends StatelessWidget {
//
// final String name;
// final File Photo;
//
// Custom_Appbar({required this.name,required this.Photo, });
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:  AppBar(
//
//
//         leading: Builder(builder: (BuildContext context) {
//           return IconButton(
//             icon: Image.asset(
//               AppImages.drawer,
//               height: 32,
//               width: 32,
//               fit: BoxFit.cover,
//             ),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//
//             },
//           );
//         },),
//         toolbarHeight: 180,
//
//         flexibleSpace: Container(
//           decoration:  Provider.of<ThemeProvider>(context).switchValue==false?BoxDecoration(
//             gradient: LinearGradient(
//                 colors: <Color>[AppColors.blue, AppColors.move]),
//           )
//               :
//           BoxDecoration(
//               color: AppColors.buttondark
//           ),
//         ),
//
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Provider.of<ThemeProvider>(context).switchValue==false?
//             Text("${AppTexts.hello}",style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w400,
//                 color: AppColors.hello),)
//                 :Text("${AppTexts.hello}",style: Theme.of(context).textTheme.bodyMedium,)
//             ,
//
//             Provider.of<ThemeProvider>(context).switchValue==false?
//             Text("${name}",style: TextStyle(
//                 fontSize:20 ,
//                 fontWeight: FontWeight.w800,
//                 color: AppColors.hello),)
//                 :
//             Text("${name}",style: Theme.of(context).textTheme.bodyLarge,)
//             ,
//
//
//             Text(
//               DateFormat.MMMEd().format(DateTime.now()),
//               style: TextStyle(color: Colors.white,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//
//
//
//
//           ],
//         ),
//
//         actions: [
//           CircleAvatar(
//             radius: 40,
//             backgroundColor: Colors.white,
//             backgroundImage: Image.file(Photo).image,
//           )
//
//         ],
//       ),
//     );
//   }
// }
