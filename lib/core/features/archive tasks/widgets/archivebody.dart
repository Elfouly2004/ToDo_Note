import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/features/Tasks/model/model.dart';
import 'package:todo/core/features/archive%20tasks/widgets/notesarchived.dart';

import '../../Home/presntation/controller/homecontroller.dart';

class archivebody extends StatefulWidget {
  const archivebody({Key? key}) : super(key: key);

  @override
  State<archivebody> createState() => _archivebodyState();
}

class _archivebodyState extends State<archivebody> {
  @override
  Widget build(BuildContext context) {
    Provider.of<Homecontroller>(context). Archivelist = Provider.of<Homecontroller>(context,).writenote.where((Notes)=>Notes. archive==true).toList();

    return Expanded(
      flex: 8,
      child: ListView.builder(
        itemCount:   Provider.of<Homecontroller>(context,).Archivelist.length,
        itemBuilder: (context, index) => archivenotes(index: index,
          onTap:() {


          Provider.of<Homecontroller>(context,listen: false). deletearchive(index: index);

          },

        ),
      ),
    );
  }
}
