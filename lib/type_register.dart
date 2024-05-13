/// Type register library.
library type_register;

import 'package:build/build.dart';

import 'src/type_register_builder.dart';

/// Builder for type register.
Builder registerAdapters(BuilderOptions options) =>
    TypeRegisterBuilder(options);
