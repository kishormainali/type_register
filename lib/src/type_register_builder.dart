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
    final hiveImport = await _parseHiveImport(buildStep);
    if (hiveImport == null || hiveImport.isEmpty) {
      log.warning('hive or hive_generator is not in dependencies or dev_dependencies. please add hive or hive_local_storage to dependencies and hive_generator to dev_dependencies in pubspec.yaml.');
      return;
    }

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
      final classesInLibrary = LibraryReader(library).annotatedWith(const TypeChecker.fromRuntime(HiveType));
      final sortedClasses = classesInLibrary.toList()
        ..sort((a, b) {
          final aTypeId = a.annotation.read('typeId').intValue;
          final bTypeId = b.annotation.read('typeId').intValue;
          return aTypeId.compareTo(bTypeId);
        });
      for (final model in sortedClasses) {
        final adapterName = model.annotation.read('adapterName').literalValue as String?;
        if (adapterName != null && adapterName.isNotEmpty) {
          files.add(Adapter(
            name: model.element.name!,
            adapterName: adapterName,
            uri: input.uri.toString(),
          ));
        } else {
          files.add(Adapter(
            name: model.element.name!,
            adapterName: '${model.element.name}Adapter',
            uri: input.uri.toString(),
          ));
        }
      }
    }

    /// generate unique imports
    final uniqueImports = <String>{};
    for (var element in files) {
      uniqueImports.add(element.uri);
    }
    final imports = uniqueImports.map((uri) => Directive.import(uri)).toList();
    imports.add(Directive.import(hiveImport));
    imports.sort((a, b) => a.compareTo(b));

    var library = Library(
      (builder) => builder
        ..comments.addAll([
          'GENERATED CODE - DO NOT MODIFY BY HAND',
          'ignore_for_file: lines_longer_than_80_chars',
          '******************************************************************',
          'Type Adapters',
          '******************************************************************'
        ])
        ..directives.addAll(imports)
        ..body.addAll(
          [
            const Code('void registerAdapters(){'),
            ...files.map((file) => Code('Hive.registerAdapter<${file.name}>(${file.adapterName}());')),
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

  FutureOr<String?> _parseHiveImport(BuildStep buildStep) async {
    String? hiveImport;
    final pubspecYaml = await buildStep.readAsString(AssetId(buildStep.inputId.package, 'pubspec.yaml'));
    final pubspec = loadYaml(pubspecYaml) as Map;
    final dependenciesMap = pubspec['dependencies'] as Map;
    final devDependenciesMap = pubspec['dev_dependencies'] as Map;

    if (!devDependenciesMap.containsKey('hive_generator')) {
      return null;
    }

    if (dependenciesMap.containsKey('hive')) {
      hiveImport = 'package:hive/hive.dart';
    } else if (dependenciesMap.containsKey('hive_local_storage')) {
      hiveImport = 'package:hive_local_storage/hive_local_storage.dart';
    }
    return hiveImport;
  }
}
