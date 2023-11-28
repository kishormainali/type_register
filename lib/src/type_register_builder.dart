import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'package:source_gen/source_gen.dart';
import 'package:yaml/yaml.dart';

import '_models.dart';

/// {@template type_register_builder}
/// [Builder] that generates a register_adapters.dart file containing
/// all adapters annotated with @HiveType
/// {@endtemplate}
class TypeRegisterBuilder implements Builder {
  /// {@macro type_register_builder}
  const TypeRegisterBuilder(this.options);

  final BuilderOptions options;

  static final _allFilesInLib = Glob('lib/**.dart');

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    String hiveImport = await _parseHiveImport(buildStep);

    /// parse output path from build.yaml
    final outputPath = options.config['output_path'] as String;

    /// output asset id
    final outputId = AssetId(
      buildStep.inputId.package,
      join(outputPath, 'register_adapters.dart'),
    );

    /// extract all classes annotated with @HiveType
    final files = <Adapter>[];
    await for (final input in buildStep.findAssets(_allFilesInLib)) {
      final library = await buildStep.resolver.libraryFor(input);
      final classesInLibrary = LibraryReader(library)
          .annotatedWith(const TypeChecker.fromRuntime(HiveType));
      final sortedClasses = classesInLibrary.toList()
        ..sort((a, b) {
          final aTypeId = a.annotation.read('typeId').intValue;
          final bTypeId = b.annotation.read('typeId').intValue;
          return aTypeId.compareTo(bTypeId);
        });
      for (final model in sortedClasses) {
        final adapterName = model.annotation.read('adapterName').isNull
            ? null
            : model.annotation.read('adapterName').stringValue;
        if (adapterName != null && adapterName.isNotEmpty) {
          files.add(
              Adapter(adapterName: adapterName, uri: input.uri.toString()));
        } else {
          files.add(Adapter(
              adapterName: '${model.element.name}Adapter',
              uri: input.uri.toString()));
        }
      }
    }

    final imports = files.map((e) => Directive.import(e.uri)).toList();
    imports.add(Directive.import(hiveImport));
    imports.sort((a, b) => a.compareTo(b));

    final library = Library(
      (builder) => builder
        ..directives.addAll(imports)
        ..body.addAll(
          [
            const Code('void registerAdapters(){'),
            ...files
                .map((e) => Code('Hive.registerAdapter(${e.adapterName}());')),
            const Code('}'),
          ],
        ),
    );

    final emitter = DartEmitter(
      orderDirectives: true,
      useNullSafetySyntax: true,
    );
    final output = DartFormatter().format(library.accept(emitter).toString());
    buildStep.writeAsString(outputId, output);
  }

  @override
  Map<String, List<String>> get buildExtensions {
    final outputPath = options.config['output_path'] as String;

    return {
      r'$package$': [join(outputPath, 'register_adapters.dart')]
    };
  }

  FutureOr<String> _parseHiveImport(BuildStep buildStep) async {
    final pubspecYaml = await buildStep
        .readAsString(AssetId(buildStep.inputId.package, 'pubspec.yaml'));
    final pubspec = loadYaml(pubspecYaml) as Map;
    final dependenciesMap = pubspec['dependencies'] as Map;

    String hiveImport = '';

    if (dependenciesMap.containsKey('hive')) {
      hiveImport = 'package:hive/hive.dart';
    } else if (dependenciesMap.containsKey('hive_local_storage')) {
      hiveImport = 'package:hive_local_storage/hive_local_storage.dart';
    }
    if (hiveImport.isEmpty) {
      throw Exception(
          'You must add `hive` or `hive_local_storage` to your pubspec.yaml');
    }
    return hiveImport;
  }
}
