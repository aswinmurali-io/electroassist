import 'package:electroassist/shared/widgets/module_tile.dart';
import 'package:flutter/material.dart';

/// A mixin that is preferabbly used on all modules to provide a standard
/// interface to track all modules.
///
/// Append all modules to [allModules] upon implementation.
mixin Module on Widget {
  /// The name of this module.
  String get name;

  /// Describes the module.
  ///
  /// * What this module does.
  /// * Where this module could be used.
  String get description;

  /// The style of the module tile that is used in the dashboard of the app.
  ModuleTileStyle get style;

  /// [Set] of [Module]s that are available in this app.
  static final allModules = <Module>{};
}
