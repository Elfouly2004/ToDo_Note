import 'package:flutter/material.dart';
import 'package:todo/core/features/Tasks/model/model.dart';
import 'package:todo/core/features/archive%20tasks/widgets/notesarchived.dart';

class archivebody extends StatelessWidget {
  const archivebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: ListView.builder(
        itemCount: Archivelist.length,
        itemBuilder: (context, index)=>archivenotes(index: index,),
      ),
    );
  }
}
