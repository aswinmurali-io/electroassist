import 'package:electroassist/routes/dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ElectroAssist());

/// The root widget of the app that also contains core properties and
/// information about this app as static declarations.
///
/// See also:
/// * [ElectroAssist.appName], for the app's name
/// * [ElectroAssist.of], to get the app's state.
/// * [ElectroAssist.lightTheme], implements [ThemeData] for [ThemeMode.light]
/// * [ElectroAssist.darkTheme], implements [ThemeData] for [ThemeMode.dark]
class ElectroAssist extends StatefulWidget {
  const ElectroAssist({Key? key}) : super(key: key);

  /// The name of the app. Defaults to: `Electro Assist`.
  /// Consider depending on this property, wherever the app's name is shown.
  static const appName = 'Electro Assist';

  @override
  State<ElectroAssist> createState() => _ElectroAssistState();

  /// Returns an instance of `State<ElectroAssist>` in the widget tree of
  /// [context].
  ///
  /// **Example:**
  /// ```dart
  /// // Sets the app's theme mode to dark theme.
  /// ElectroAssist.of(context).themeMode = ThemeMode.dark;
  /// ```
  static _ElectroAssistState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ElectroAssistState>();

  /// Light theme that will be used when theme mode is set to [ThemeMode.light].
  ///
  /// The theme that is preffered by the app unless, overriden by users
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

  /// Dark theme that will be used when theme mode is set to [ThemeMode.dark].
  /// This theme is used when preffered by the user's preferences.
  ///
  /// TODO: implement dark theme
  static final darkTheme = lightTheme;
}

class _ElectroAssistState extends State<ElectroAssist> {
  /// The currently selected [ThemeMode].
  ThemeMode _themeMode = ThemeMode.system;

  /// The currently selected [ThemeMode].
  ///
  /// If [ThemeMode.light] is set, [ElectroAssist.lightTheme] is used.
  /// If [ThemeMode.dark] is set, [ElectroAssist.darkTheme] is used.
  /// If [ThemeMode.system] is set, a corresponding light theme or dark theme
  /// will be used.
  ///
  /// See also:
  /// * [ElectroAssist.lightTheme]
  /// * [ElectroAssist.darkTheme]
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) => setState(() => _themeMode = value);

  @override
  build(context) {
    return MaterialApp(
      title: ElectroAssist.appName,

      themeMode: _themeMode,

      theme: ElectroAssist.lightTheme,
      darkTheme: ElectroAssist.darkTheme,

      home: Dashboard(),

      // Disables the debug banner during debug builds.
      debugShowCheckedModeBanner: false,
    );
  }
}
