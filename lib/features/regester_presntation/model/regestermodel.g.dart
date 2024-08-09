// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regestermodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegisterLoginAdapter extends TypeAdapter<RegisterLogin> {
  @override
  final int typeId = 1;

  @override
  RegisterLogin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegisterLogin(
      pic: fields[0] as XFile?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RegisterLogin obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.pic)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterLoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
