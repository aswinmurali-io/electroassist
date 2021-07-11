import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

/// Contains all the in-built themes of this app. This class shall not be
/// inherited nor be constructed, as it shall contain only static definitions.
@sealed
abstract class ElectroAssistThemes {
  /// The theme that is preffered by the app unless, overriden by user
  /// preferred theme.
  static final defaultTheme = ThemeData(
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
}
