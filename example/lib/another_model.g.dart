// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'another_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnotherModelAdapter extends TypeAdapter<AnotherModel> {
  @override
  final int typeId = 1;

  @override
  AnotherModel read(BinaryReader reader) {
    return AnotherModel();
  }

  @override
  void write(BinaryWriter writer, AnotherModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnotherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
