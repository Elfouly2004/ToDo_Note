import 'package:flutter/material.dart';
import 'package:todo/core/features/Donetask/widgets/notesdone.dart';
import 'package:todo/core/features/Tasks/model/model.dart';

class doneebody extends StatelessWidget {
  const doneebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: ListView.builder(
        itemCount: Done.length,
        itemBuilder: (context, index)=>donenotes(index: index,),
      ),
    );
  }
}
