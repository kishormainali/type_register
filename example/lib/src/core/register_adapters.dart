// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: lines_longer_than_80_chars
// ******************************************************************
// Type Adapters
// ******************************************************************

import 'package:example/another_model.dart';
import 'package:example/model.dart';
import 'package:hive_local_storage/hive_local_storage.dart';

void registerAdapters() {
  Hive
    ..registerAdapter<AnotherModel>(AnotherModelAdapter())
    ..registerAdapter<AnothorAModel>(ModelAAdapter())
    ..registerAdapter<Model>(ModelAdapter());
}
