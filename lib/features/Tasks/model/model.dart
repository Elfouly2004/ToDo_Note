
import 'package:hive/hive.dart';

part 'model.g.dart';
@HiveType(typeId: 0)
class Notes extends HiveObject{
  @HiveField(0)
  final taskName;
  @HiveField(1)
  final decsrption;
  @HiveField(2)
  final starttask;
  @HiveField(3)
  final Endtask;
  @HiveField(4)
  final selecttime;
  @HiveField(5)
  bool done;
  @HiveField(6)
  bool archive;



  Notes(
      {
    required this.taskName,
    required  this.decsrption,
    required  this.starttask,
    required  this. Endtask,
    required  this. selecttime,
        this.done=false,
        this.archive=false,


     }
     );
}

  // List<Notes> writenote =[];

// List<Notes> Done =[];
//
// List<Notes> Archivelist =[];



