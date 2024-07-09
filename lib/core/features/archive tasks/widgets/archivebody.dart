import 'package:flutter/material.dart';
import 'package:todo/core/features/Tasks/model/model.dart';
import 'package:todo/core/features/archive%20tasks/widgets/notesarchived.dart';

class archivebody extends StatefulWidget {
  const archivebody({Key? key}) : super(key: key);

  @override
  State<archivebody> createState() => _archivebodyState();
}

class _archivebodyState extends State<archivebody> {
  @override
  Widget build(BuildContext context) {
    List<Notes> Archivelist =writenote.where((Notes)=>Notes. archive==true).toList();

    return Expanded(
      flex: 8,
      child: ListView.builder(
        itemCount: Archivelist.length,
        itemBuilder: (context, index) => archivenotes(index: index, onTap:() {
            setState(() {
              // Archivelist.removeAt(index);
              // writenote[index].archive=false;
            });
          },

        ),
      ),
    );
  }
}
