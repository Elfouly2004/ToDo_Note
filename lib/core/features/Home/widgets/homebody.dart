import 'package:flutter/material.dart';

import '../../../utils/Appimages.dart';
import '../../Tasks/model/model.dart';


class homebody extends StatefulWidget {
  const homebody({super.key});

  @override
  State<homebody> createState() => _homebodyState();
}

class _homebodyState extends State<homebody> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: Note.length,
        itemBuilder: (context, index) {

          return  Card(
            child: ListTile(
                leading: Container(
                  width: 35,
                  height: 35,
                  child: Center(
                    child:  Image(
                      image: AssetImage(AppImages.task),
                    )
                  ),
                ),
                // title: Text(Note.),
                subtitle:
                Text('Enter The End Date',),
                trailing:Container(

                ),
              // isThreeLine: true,
            ),
          );
      },
      ),
    );



  }
}
