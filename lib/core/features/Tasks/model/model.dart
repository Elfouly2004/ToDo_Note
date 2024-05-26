
import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)

class Notes extends HiveObject{
  String textName;
  String decsrption;


  Notes({

        @HiveField(0)
    required this.textName,
        @HiveField(1)
    required  this.decsrption,

     });
}




List <Notes> Note=[

];