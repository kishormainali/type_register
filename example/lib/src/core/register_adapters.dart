import 'package:example/another_model.dart';
import 'package:example/model.dart';
import 'package:hive_local_storage/hive_local_storage.dart';

void registerAdapters() {
  Hive.registerAdapter(AnotherModelAdapter());
  Hive.registerAdapter(ModelAdapter());
}
