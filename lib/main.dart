import 'package:electroassist/routes/dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(ElectroAssist());

/// Is a [MaterialApp] and also contains core properties and information about
/// this app as static declarations.
class ElectroAssist extends StatefulWidget {
  /// The name of the app. Defaults to: `Electro Assist`.
  static const appName = 'Electro Assist';

  @override
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

  /// The theme that is preffered by the app unless, overriden by user
  /// preferred theme.
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey.shade50,
    shadowColor: Colors.blueGrey.shade50.withOpacity(0.5),
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: Colors.blueGrey.shade700,
      ),
      caption: TextStyle(
        color: Colors.blueGrey.shade400,
      ),
      headline1: TextStyle(
        fontWeight: FontWeight.w900,
        letterSpacing: 1.1,
        color: Colors.blueGrey,
        fontSize: 30,
      ),
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.blueGrey,
    ),
  );

  /// The theme that is preffered by the app unless, overriden by user
  /// preferred theme.
  static final darkTheme = lightTheme;
}

class _ElectroAssistState extends State<ElectroAssist> {
  ThemeMode _selectedThemeMode = ThemeMode.system;

  /// The selected [ThemeMode] of the app.
  ///
  /// If [ThemeMode.light] is set, [ElectroAssistThemes.lightTheme] is used.
  /// If [ThemeMode.dark] is set, [ElectroAssistThemes.darkTheme] is used.
  /// If [ThemeMode.system] is set, a corresponding light theme or dark theme
  /// is used.
  ///
  /// See also:
  /// * [ThemeMode]
  /// * [ElectroAssistThemes]
  ThemeMode get themeMode => _selectedThemeMode;

  set themeMode(ThemeMode value) => setState(() => _selectedThemeMode = value);

  @override
  build(context) {
    return MaterialApp(
      title: ElectroAssist.appName,

      themeMode: _selectedThemeMode,

      theme: ElectroAssist.lightTheme,
      darkTheme: ElectroAssist.darkTheme,

      home: Dashboard(),

      // Disables the debug banner during debug builds.
      debugShowCheckedModeBanner: false,
    );
  }
}
