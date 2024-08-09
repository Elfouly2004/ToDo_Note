// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesAdapter extends TypeAdapter<Notes> {
  @override
  final int typeId = 0;

  @override
  Notes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notes(
      taskName: fields[0] as dynamic,
      decsrption: fields[1] as dynamic,
      starttask: fields[2] as dynamic,
      Endtask: fields[3] as dynamic,
      selecttime: fields[4] as dynamic,
      done: fields[5] as bool,
      archive: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Notes obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.decsrption)
      ..writeByte(2)
      ..write(obj.starttask)
      ..writeByte(3)
      ..write(obj.Endtask)
      ..writeByte(4)
      ..write(obj.selecttime)
      ..writeByte(5)
      ..write(obj.done)
      ..writeByte(6)
      ..write(obj.archive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
