import 'package:flutter/material.dart';
import 'package:todo/core/features/Home/widgets/Notes.dart';
import '../../Tasks/model/model.dart';


class homebody extends StatefulWidget {
  homebody({
    required this.photo,
    required this.name,
    required this.selected,
  });

  final photo;
  final name;
  final  selected;
  @override
  State<homebody> createState() => _homebodyState(this.name,this.photo,this.selected);
}

class _homebodyState extends State<homebody> {
  final selected;
  final photo;
  final name;
  _homebodyState(this.name,this.photo,this.selected);
  @override
  Widget build(BuildContext context) {
    List<Notes> homelist =writenote.where((Notes)=>Notes.archive==false).toList();


    return Expanded(
      flex: 8,
      child: ListView.builder(
        itemCount: writenote.length,
        // itemCount: homelist.length,
        itemBuilder: (context, index) =>
            notes(
              index: index,Name:name  ,
              Photo:photo ,Selected: selected,
              // title: homelist[index].taskName,
              // subtitle: homelist[index].selecttime,
              onDismissed: (p0) {
          setState(() {
            writenote.removeAt(index);
          });
        },)
      ),
    );

  }
}
