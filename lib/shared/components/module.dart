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
}
