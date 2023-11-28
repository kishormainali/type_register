# Type Register Generator

Code generator for creating helper functions for registering Hive types. It will generate method named registerAdapters with all the hive adapters for the types annotated with @HiveType.

## Getting Started

Add the following to your pubspec.yaml file:

```yaml
dev_dependencies:
  type_register: latest
```

## Then run the following command:

```bash
dart run build_runner build -d
```

By default it will generate a file named `register_adapters.dart` inside lib folder.

if you want to change the output location create `build.yaml` file in the root of your project and add the following:

```yaml
targets:
  $default:
    builders:
      type_register|type_register:
        options:
          output_path: lib/src/core/

```


## Output
register_adapters.dart
```dart 
import 'package:example/another_model.dart';
import 'package:example/model.dart';
import 'package:hive_local_storage/hive_local_storage.dart'; 

void registerAdapters() {
  Hive.registerAdapter(AnotherModelAdapter());
  Hive.registerAdapter(ModelAdapter());
}
```
