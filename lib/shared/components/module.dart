import 'package:electroassist/routes/calculators/resistor_color_codes.dart';
import 'package:electroassist/shared/widgets/module_tile.dart';
import 'package:flutter/material.dart';

/// Base class interface for all modules. Every modules must inherit this
/// interface.
abstract class Module {
  /// The name of this module.
  String get name;

  /// Describes the module.
  ///
  /// * What this module does.
  /// * Where this module could be used.
  String get description;

  /// The page of this module.
  ///
  /// The page that draws the entire section relevant to this module.
  Widget get page;

  /// The style of the module tile.
  ModuleTileStyle get style;
}

final modules = <Module>[
  ResistorColorCodes(),
];
