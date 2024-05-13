// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'f_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FModelAdapter extends TypeAdapter<_$FModelImpl> {
  @override
  final int typeId = 444;

  @override
  _$FModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FModelImpl(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$FModelImpl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FAModelAdapter extends TypeAdapter<_$FAModelImpl> {
  @override
  final int typeId = 455;

  @override
  _$FAModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FAModelImpl(
      address: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$FAModelImpl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FAModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FModelImpl _$$FModelImplFromJson(Map<String, dynamic> json) => _$FModelImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$FModelImplToJson(_$FModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$FAModelImpl _$$FAModelImplFromJson(Map<String, dynamic> json) =>
    _$FAModelImpl(
      address: json['address'] as String,
    );

Map<String, dynamic> _$$FAModelImplToJson(_$FAModelImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
    };
