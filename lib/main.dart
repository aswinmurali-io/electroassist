import 'package:electroassist/routes/dashboard.dart';
import 'package:electroassist/shared/themes.dart';
import 'package:flutter/material.dart';

void main() => runApp(ElectroAssist());

/// Is a [Widget] and also contains core properties and information about this
/// app as static declarations.
class ElectroAssist extends StatefulWidget {
  /// The name of the app. Defaults to: `Electro Assist`.
  static const appName = 'Electro Assist';

  createState() => _ElectroAssistState();

  /// Returns the instance of `State<ElectroAssist>` in the widget tree of
  /// [context].
  ///
  /// **Usage example**
  /// ```dart
  /// // Updates the theme with [customTheme].
  /// ElectroAssist.of(context).theme = customTheme;
  /// ```
  static _ElectroAssistState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ElectroAssistState>();
}

class _ElectroAssistState extends State<ElectroAssist> {
  /// The selected theme of the app.
  ///
  /// Defaults to [ElectroAssistThemes.defaultTheme].
  ///
  /// See also:
  /// * [ElectroAssistThemes]
  ThemeData _selectedTheme = ElectroAssistThemes.defaultTheme;

  /// The current theme this app uses.
  ThemeData get theme => _selectedTheme;

  /// Updates the theme this app uses with the specified [value].
  set theme(ThemeData value) => setState(() => _selectedTheme = value);

  @override
  build(context) {
    return MaterialApp(
      title: ElectroAssist.appName,
      theme: _selectedTheme,
      home: Dashboard(),

      // Disables the debug banner during debug builds.
      debugShowCheckedModeBanner: false,
    );
  }
}
