import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/features/Donetask/widgets/notesdone.dart';

import '../../Home/presntation/controller/homecontroller.dart';

class doneebody extends StatelessWidget {
  const doneebody({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Homecontroller>(context,). Done = Provider.of<Homecontroller>(context,).writenote.where((Notes)=>Notes.done==true).toList();

    return Expanded(

      child: ListView.builder(
        itemCount: Provider.of<Homecontroller>(context,).Done.length,
        itemBuilder: (context, index)=>donenotes(index: index,),
      ),
    );
  }
}
