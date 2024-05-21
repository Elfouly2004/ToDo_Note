import 'package:flutter/material.dart';
import 'package:todo/features/Tasks/model/model.dart';


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
          final item = Note[index];
          // return Dismissible(
          //
          //   key: Key(),
          //
          //   onDismissed: (direction) {
          //     setState(() {
          //       Note.removeAt(index);
          //     });
          //
          //   },
          //   // Show a red background as the item is swiped away.
          //   background: Container(color: Colors.red),
          //   child: ListTile(
          //     // title: Text(item),
          //   ),
          // );
      },
      ),
    );



  }
}
