import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_local_storage/hive_local_storage.dart';

part 'f_model.freezed.dart';
part 'f_model.g.dart';

@freezed
sealed class FModel with _$FModel {
  const FModel._();

  @HiveType(typeId: 444, adapterName: 'FModelAdapter')
  const factory FModel({
    @HiveField(0) required String name,
  }) = _FModel;

  factory FModel.fromJson(Map<String, dynamic> json) => _$FModelFromJson(json);
}

@freezed
sealed class FAModel with _$FAModel {
  @HiveType(typeId: 455, adapterName: 'FAModelAdapter')
  const factory FAModel({
    @HiveField(0) required String address,
  }) = _FAModel;
  factory FAModel.fromJson(Map<String, dynamic> json) =>
      _$FAModelFromJson(json);
}
