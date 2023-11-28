import 'package:equatable/equatable.dart';

/// {@template adapter}
/// Adapter model.
/// {@endtemplate}
class Adapter extends Equatable {
  /// {@macro adapter}
  const Adapter({
    required this.adapterName,
    required this.uri,
  });

  /// name of the adapter extracted from the annotation
  final String adapterName;

  /// path to the file containing the adapter
  final String uri;

  @override
  String toString() {
    return 'Adapter(adapterName: $adapterName, uri: $uri)';
  }

  @override
  List<Object?> get props => [adapterName, uri];
}
