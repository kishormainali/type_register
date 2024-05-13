import 'package:equatable/equatable.dart';

/// {@template adapter}
/// Adapter model.
/// {@endtemplate}
class Adapter extends Equatable {
  /// {@macro adapter}
  const Adapter({
    required this.typeId,
    required this.name,
    required this.adapterName,
    required this.uri,
  });

  final int typeId;

  /// name of model
  final String name;

  /// name of the adapter extracted from the annotation
  final String adapterName;

  /// path to the file containing the adapter
  final String uri;

  @override
  String toString() {
    return 'Adapter(name:$name,adapterName: $adapterName, uri: $uri)';
  }

  @override
  List<Object?> get props => [typeId, name, adapterName, uri];
}
