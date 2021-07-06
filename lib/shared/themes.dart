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
}
