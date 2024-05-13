// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'f_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FModel _$FModelFromJson(Map<String, dynamic> json) {
  return _FModel.fromJson(json);
}

/// @nodoc
mixin _$FModel {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FModelCopyWith<FModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FModelCopyWith<$Res> {
  factory $FModelCopyWith(FModel value, $Res Function(FModel) then) =
      _$FModelCopyWithImpl<$Res, FModel>;
  @useResult
  $Res call({@HiveField(0) String name});
}

/// @nodoc
class _$FModelCopyWithImpl<$Res, $Val extends FModel>
    implements $FModelCopyWith<$Res> {
  _$FModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FModelImplCopyWith<$Res> implements $FModelCopyWith<$Res> {
  factory _$$FModelImplCopyWith(
          _$FModelImpl value, $Res Function(_$FModelImpl) then) =
      __$$FModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String name});
}

/// @nodoc
class __$$FModelImplCopyWithImpl<$Res>
    extends _$FModelCopyWithImpl<$Res, _$FModelImpl>
    implements _$$FModelImplCopyWith<$Res> {
  __$$FModelImplCopyWithImpl(
      _$FModelImpl _value, $Res Function(_$FModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$FModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 444, adapterName: 'FModelAdapter')
class _$FModelImpl extends _FModel {
  const _$FModelImpl({@HiveField(0) required this.name}) : super._();

  factory _$FModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FModelImplFromJson(json);

  @override
  @HiveField(0)
  final String name;

  @override
  String toString() {
    return 'FModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FModelImplCopyWith<_$FModelImpl> get copyWith =>
      __$$FModelImplCopyWithImpl<_$FModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FModelImplToJson(
      this,
    );
  }
}

abstract class _FModel extends FModel {
  const factory _FModel({@HiveField(0) required final String name}) =
      _$FModelImpl;
  const _FModel._() : super._();

  factory _FModel.fromJson(Map<String, dynamic> json) = _$FModelImpl.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$FModelImplCopyWith<_$FModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FAModel _$FAModelFromJson(Map<String, dynamic> json) {
  return _FAModel.fromJson(json);
}

/// @nodoc
mixin _$FAModel {
  @HiveField(0)
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAModelCopyWith<FAModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAModelCopyWith<$Res> {
  factory $FAModelCopyWith(FAModel value, $Res Function(FAModel) then) =
      _$FAModelCopyWithImpl<$Res, FAModel>;
  @useResult
  $Res call({@HiveField(0) String address});
}

/// @nodoc
class _$FAModelCopyWithImpl<$Res, $Val extends FAModel>
    implements $FAModelCopyWith<$Res> {
  _$FAModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FAModelImplCopyWith<$Res> implements $FAModelCopyWith<$Res> {
  factory _$$FAModelImplCopyWith(
          _$FAModelImpl value, $Res Function(_$FAModelImpl) then) =
      __$$FAModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String address});
}

/// @nodoc
class __$$FAModelImplCopyWithImpl<$Res>
    extends _$FAModelCopyWithImpl<$Res, _$FAModelImpl>
    implements _$$FAModelImplCopyWith<$Res> {
  __$$FAModelImplCopyWithImpl(
      _$FAModelImpl _value, $Res Function(_$FAModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$FAModelImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 455, adapterName: 'FAModelAdapter')
class _$FAModelImpl implements _FAModel {
  const _$FAModelImpl({@HiveField(0) required this.address});

  factory _$FAModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FAModelImplFromJson(json);

  @override
  @HiveField(0)
  final String address;

  @override
  String toString() {
    return 'FAModel(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAModelImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAModelImplCopyWith<_$FAModelImpl> get copyWith =>
      __$$FAModelImplCopyWithImpl<_$FAModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FAModelImplToJson(
      this,
    );
  }
}

abstract class _FAModel implements FAModel {
  const factory _FAModel({@HiveField(0) required final String address}) =
      _$FAModelImpl;

  factory _FAModel.fromJson(Map<String, dynamic> json) = _$FAModelImpl.fromJson;

  @override
  @HiveField(0)
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$FAModelImplCopyWith<_$FAModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
