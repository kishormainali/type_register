import 'package:hive_local_storage/hive_local_storage.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class Model extends HiveObject {
  Model({required this.name});
  @HiveField(0)
  final String name;
}
