import 'package:flutter/material.dart';
import 'package:todo/core/features/Home/widgets/Notes.dart';

import '../../../utils/Appimages.dart';
import '../../Tasks/model/model.dart';


class homebody extends StatefulWidget {
  homebody({super.key,required this.startDate,required this.endDate});
  final startDate;
  final endDate;
  @override
  State<homebody> createState() => _homebodyState(this.startDate,this.endDate);
}

class _homebodyState extends State<homebody> {
  final startDate;
  final endDate;
  _homebodyState(this.startDate,this.endDate);
  @override
  Widget build(BuildContext context) {

    return Expanded(
      flex: 8,
      child: ListView.builder(
        itemCount: writenote.length,
        itemBuilder: (context, index) =>notes(index: index,StartDate: startDate,EndDate: endDate,)
      ),
    );

  }
}
