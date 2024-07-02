import 'package:flutter/material.dart';
import 'package:todo/core/features/Home/widgets/Notes.dart';

import '../../../utils/Appimages.dart';
import '../../Tasks/model/model.dart';


class homebody extends StatefulWidget {
  homebody({super.key,required this.timer});
  final timer;

  @override
  State<homebody> createState() => _homebodyState(this.timer);
}

class _homebodyState extends State<homebody> {
  final timer;
  _homebodyState(this.timer);
  @override
  Widget build(BuildContext context) {

    return Expanded(
      flex: 8,
      child: ListView.builder(
        itemCount: writenote.length,
        itemBuilder: (context, index) =>notes(index: index,time: timer,)
      ),
    );

  }
}
