// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persona_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonaHiveAdapter extends TypeAdapter<PersonaHive> {
  @override
  final int typeId = 1;

  @override
  PersonaHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonaHive()
      ..id = fields[0] as String
      ..nombres = fields[1] as String
      ..apellidos = fields[2] as String
      ..documento = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, PersonaHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombres)
      ..writeByte(2)
      ..write(obj.apellidos)
      ..writeByte(3)
      ..write(obj.documento);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonaHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
