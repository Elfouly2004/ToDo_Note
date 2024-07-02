import 'package:flutter/material.dart';
import 'package:todo/core/features/Home/widgets/Notes.dart';

import '../../../utils/Appimages.dart';
import '../../Tasks/model/model.dart';


class homebody extends StatefulWidget {
  homebody({super.key,required this.selecttime});
  final selecttime;

  @override
  State<homebody> createState() => _homebodyState(this.selecttime);
}

class _homebodyState extends State<homebody> {
  final time;
  _homebodyState(this.time);
  @override
  Widget build(BuildContext context) {

    return Expanded(
      flex: 8,
      child: ListView.builder(
        itemCount: writenote.length,
        itemBuilder: (context, index) =>notes(index: index,selecttime: time,)
      ),
    );

  }
}
