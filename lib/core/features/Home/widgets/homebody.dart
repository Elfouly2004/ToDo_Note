import 'package:flutter/material.dart';
import 'package:todo/core/features/Home/widgets/Notes.dart';

import '../../../utils/Appimages.dart';
import '../../Tasks/model/model.dart';


class homebody extends StatefulWidget {
  homebody({super.key,});


  @override
  State<homebody> createState() => _homebodyState();
}

class _homebodyState extends State<homebody> {

  @override
  Widget build(BuildContext context) {

    return Expanded(
      flex: 8,
      child: ListView.builder(
        itemCount: writenote.length,
        itemBuilder: (context, index) =>notes(index: index,)
      ),
    );

  }
}
