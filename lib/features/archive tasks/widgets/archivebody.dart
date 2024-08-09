import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../Home/presntation/controller/homecontroller.dart';
import 'notesarchived.dart';

class archivebody extends StatefulWidget {
  const archivebody({Key? key}) : super(key: key);

  @override
  State<archivebody> createState() => _archivebodyState();
}

class _archivebodyState extends State<archivebody> {
  @override
  Widget build(BuildContext context) {
    Provider.of<Homecontroller>(context). Archivelist = Provider.of<Homecontroller>(context,).writenote.where((Notes)=>Notes. archive==true).toList();

    return ListView.builder(
      itemCount:   Provider.of<Homecontroller>(context,).Archivelist.length,
      itemBuilder: (context, index) => archivenotes(index: index,
        onTap:() {


        Provider.of<Homecontroller>(context,listen: false). deletearchive(index: index);

        },

      ),
    );
  }
}
