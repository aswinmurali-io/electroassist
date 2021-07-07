import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

/// Contains all the in-built themes of this app. This class shall not be
/// inherited nor be constructed, as it shall contain only static definitions.
@sealed
abstract class ElectroAssistThemes {
  /// The theme that is preffered by the app unless, overriden by user
  /// preferred theme.
  static final defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    shadowColor: Colors.blueGrey.shade50.withOpacity(0.5),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.blueGrey.shade400,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.blueGrey.shade400,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );

  /// Contains all the themes defined in [ElectroAssistThemes] as a [Set] /
  /// [Iterable] of [ThemeData].
  ///
  /// **Use cases include:**
  /// * Showing all the available themes in `Preferences` section.
  /// * Storing the index of the user's preferred theme instead of serializing
  /// the entire instance of [ThemeData].
  ///
  /// **Caution:**
  /// * New themes must be appended to the existing entries only!
  static final all = {
    defaultTheme,
  };
}
