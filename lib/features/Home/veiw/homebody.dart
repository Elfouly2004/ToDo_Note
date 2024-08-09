import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Tasks/model/model.dart';
import '../presntation/controller/homecontroller.dart';
import 'Notes.dart';


class homebody extends StatefulWidget {



  @override
  State<homebody> createState() => _homebodyState();
}

class _homebodyState extends State<homebody> {

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount:  Provider.of<Homecontroller>(context,).writenote.length,
      itemBuilder: (context, index) =>
          notes(
            index: index,
            onDismissed: (p0) {
          Provider.of<Homecontroller>(context,listen: false).deleteNote(index ,context);
          },
          onTap: () {
            Provider.of<Homecontroller>(context,listen: false).deleteNote( index,context);

          },)
    );

  }
}
