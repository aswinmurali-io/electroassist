import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// This class contains properties associated to the color for the color band
/// of a resistor.
///
/// Contains static declarations of pre-defined colors that can be used to
/// access its properties.
@immutable
@sealed
class ResistorColorBand {
  /// Represents the [Color] of the band.
  final Color color;

  /// The digit value of the band.
  /// Can be null, if this color band has no digit defined.
  final int? asDigit;

  /// The multiplier value of the band.
  ///
  /// **Example**
  /// ```dart
  /// // Signifies multiplier is 1e-2
  /// ResistorColorBand.Silver.asMultiplier == 0.01;
  /// ```
  final double asMultiplier;

  /// The tolerance percentage that is represented by this color band.
  /// Can be null, if this color band has no tolerance percentage property
  /// defined.
  ///
  /// ```dart
  /// // Signifies tolerance is +/- 4.0%
  /// ResistorColorBand.Yellow.asTolerancePercentage == 4;
  /// ```
  final double? asTolerancePercentage;

  ////
  final int? asTemperatureCoefficient;

  const ResistorColorBand._({
    required this.color,
    required this.asDigit,
    required this.asMultiplier,
    required this.asTolerancePercentage,
    required this.asTemperatureCoefficient,
  });

  static const Black = ResistorColorBand._(
      color: Colors.black,
      asDigit: 0,
      asMultiplier: 1,
      asTolerancePercentage: null,
      asTemperatureCoefficient: 250);

  static const Brown = ResistorColorBand._(
      color: Colors.brown,
      asDigit: 1,
      asMultiplier: 1e1,
      asTolerancePercentage: 1,
      asTemperatureCoefficient: 100);

  static const Red = ResistorColorBand._(
      color: Colors.red,
      asDigit: 2,
      asMultiplier: 1e2,
      asTolerancePercentage: 2,
      asTemperatureCoefficient: 50);

  static const Orange = ResistorColorBand._(
      color: Colors.orange,
      asDigit: 3,
      asMultiplier: 1e3,
      asTolerancePercentage: 3,
      asTemperatureCoefficient: 15);

  static const Yellow = ResistorColorBand._(
      color: Colors.yellow,
      asDigit: 4,
      asMultiplier: 1e4,
      asTolerancePercentage: 4,
      asTemperatureCoefficient: 25);

  static const Green = ResistorColorBand._(
      color: Colors.green,
      asDigit: 5,
      asMultiplier: 1e5,
      asTolerancePercentage: 0.5,
      asTemperatureCoefficient: 20);

  static const Blue = ResistorColorBand._(
      color: Colors.blue,
      asDigit: 6,
      asMultiplier: 1e6,
      asTolerancePercentage: 0.25,
      asTemperatureCoefficient: 10);

  static const Violet = ResistorColorBand._(
      color: Colors.purple,
      asDigit: 7,
      asMultiplier: 1e7,
      asTolerancePercentage: 0.1,
      asTemperatureCoefficient: 5);

  static const Grey = ResistorColorBand._(
      color: Colors.grey,
      asDigit: 8,
      asMultiplier: 1e8,
      asTolerancePercentage: 0.05,
      asTemperatureCoefficient: 1);

  static const White = ResistorColorBand._(
      color: Colors.white,
      asDigit: 8,
      asMultiplier: 1e9,
      asTolerancePercentage: null,
      asTemperatureCoefficient: null);

  static const Gold = ResistorColorBand._(
      color: Colors.yellowAccent,
      asDigit: null,
      asMultiplier: 1e-1,
      asTolerancePercentage: 5,
      asTemperatureCoefficient: null);

  static const Silver = ResistorColorBand._(
      color: Colors.grey,
      asDigit: null,
      asMultiplier: 1e-2,
      asTolerancePercentage: 10,
      asTemperatureCoefficient: null);

  /// Contains all valid digit bands.
  static const digitBands = [
    Black,
    Brown,
    Red,
    Orange,
    Yellow,
    Green,
    Blue,
    Violet,
    Grey,
    White,
  ];

  /// Contains all valid multiplier bands.
  static const multiplierBands = [
    Silver,
    Gold,
    Black,
    Brown,
    Red,
    Orange,
    Yellow,
    Green,
    Blue,
    Violet,
    Grey,
    White,
  ];

  /// Contains all valid tolerance bands.
  static const toleranceBands = [
    Grey,
    Violet,
    Blue,
    Green,
    Brown,
    Red,
    Orange,
    Yellow,
    Gold,
    Silver,
  ];

  /// The default tolerance band.
  static const defaultToleranceBand = Gold;

  /// Contains all valid temperature coefficient bands.
  static const temperatureCoefficientBands = [
    Black,
    Brown,
    Red,
    Orange,
    Yellow,
    Green,
    Blue,
    Violet,
    Grey,
  ];
}
