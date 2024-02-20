import 'package:hive_local_storage/hive_local_storage.dart';

part 'another_model.g.dart';

@HiveType(typeId: 1)
class AnotherModel {}

@HiveType(typeId: 2, adapterName: 'ModelAAdapter')
class AnothorAModel {}
