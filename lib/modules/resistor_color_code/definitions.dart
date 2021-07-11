import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum ResistorBandType {
  ThreeBandResistor,
  FourBandResistor,
  FiveBandResistor,
  SizBandResistor,
}

class ResistorColorCodeViewModel extends ChangeNotifier {
  ResistorBandType _bandType = ResistorBandType.FourBandResistor;

  ResistorBandType get bandType => _bandType;
}

/// This class contains properties associated to the color for the color band
/// of a resistor.
///
/// Contains static declarations of pre-defined colors that can be used to
/// access its properties.
@immutable
@sealed
class ResistorBandColor {
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

  const ResistorBandColor._({
    required this.color,
    required this.asDigit,
    required this.asMultiplier,
    required this.asTolerancePercentage,
    required this.asTemperatureCoefficient,
  });

  static const Black = ResistorBandColor._(
      color: Colors.black,
      asDigit: 0,
      asMultiplier: 1,
      asTolerancePercentage: null,
      asTemperatureCoefficient: 250);

  static const Brown = ResistorBandColor._(
      color: Colors.brown,
      asDigit: 1,
      asMultiplier: 1e1,
      asTolerancePercentage: 1,
      asTemperatureCoefficient: 100);

  static const Red = ResistorBandColor._(
      color: Colors.red,
      asDigit: 2,
      asMultiplier: 1e2,
      asTolerancePercentage: 2,
      asTemperatureCoefficient: 50);

  static const Orange = ResistorBandColor._(
      color: Colors.orange,
      asDigit: 3,
      asMultiplier: 1e3,
      asTolerancePercentage: 3,
      asTemperatureCoefficient: 15);

  static const Yellow = ResistorBandColor._(
      color: Colors.yellow,
      asDigit: 4,
      asMultiplier: 1e4,
      asTolerancePercentage: 4,
      asTemperatureCoefficient: 25);

  static const Green = ResistorBandColor._(
      color: Colors.green,
      asDigit: 5,
      asMultiplier: 1e5,
      asTolerancePercentage: 0.5,
      asTemperatureCoefficient: 20);

  static const Blue = ResistorBandColor._(
      color: Colors.blue,
      asDigit: 6,
      asMultiplier: 1e6,
      asTolerancePercentage: 0.25,
      asTemperatureCoefficient: 10);

  static const Violet = ResistorBandColor._(
      color: Colors.purple,
      asDigit: 7,
      asMultiplier: 1e7,
      asTolerancePercentage: 0.1,
      asTemperatureCoefficient: 5);

  static const Grey = ResistorBandColor._(
      color: Colors.grey,
      asDigit: 8,
      asMultiplier: 1e8,
      asTolerancePercentage: 0.05,
      asTemperatureCoefficient: 1);

  static const White = ResistorBandColor._(
      color: Colors.white,
      asDigit: 8,
      asMultiplier: 1e9,
      asTolerancePercentage: null,
      asTemperatureCoefficient: null);

  static const Gold = ResistorBandColor._(
      color: Colors.yellowAccent,
      asDigit: null,
      asMultiplier: 1e-1,
      asTolerancePercentage: 5,
      asTemperatureCoefficient: null);

  static const Silver = ResistorBandColor._(
      color: Colors.grey,
      asDigit: null,
      asMultiplier: 1e-2,
      asTolerancePercentage: 10,
      asTemperatureCoefficient: null);

  static const None = ResistorBandColor._(
      color: Colors.transparent,
      asDigit: null,
      asMultiplier: 0,
      asTolerancePercentage: 20,
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
    None,
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

/// An abstract interface of a resistor.
///
/// **Example:**
/// ```dart
/// // To auto detect resistor band type and construct appropriate instance:
/// var r1 = Resistor(bands);
///
/// // or manually create of a desired type:
/// var r2 = ThreeBandResistor(bands);
/// ```
///
/// **See also:**
/// * [ThreeBandResistor]
/// * [FourBandResistor]
/// * [FiveBandResistor]
/// * [SixBandResistor]
@immutable
abstract class Resistor {
  final ResistorBandColor digit1Band, digit2Band, multiplierBand;

  final ResistorBandColor? digit3Band, toleranceBand, temperatureCoeffBand;

  int get digit1 => digit1Band.asDigit!;

  int get digit2 => digit2Band.asDigit!;

  int? get digit3 => digit3Band?.asDigit;

  double get multiplier => multiplierBand.asMultiplier;

  double? get tolerancePercentage => toleranceBand?.asTolerancePercentage;

  int? get temperatureCoefficient =>
      temperatureCoeffBand?.asTemperatureCoefficient;

  /// The resistance value in `Ohms`.
  double get resistance {
    var value = digit1 * 10 + digit2;

    if (digit3 != null) value = value * 10 + digit3!;

    return value * multiplier;
  }

  Resistor._({
    required this.digit1Band,
    required this.digit2Band,
    required this.digit3Band,
    required this.multiplierBand,
    required this.toleranceBand,
    required this.temperatureCoeffBand,
  });

  factory Resistor(List<ResistorBandColor> bands) {
    assert(3 <= bands.length && bands.length <= 6,
        "3-band, 4-band, 5-band and 6-band resistors are only valid. Received ${bands.length}-band.");

    switch (bands.length) {
      case 3:
        return ThreeBandResistor._(bands);
      case 4:
        return FourBandResistor._(bands);
      case 5:
        return FiveBandResistor._(bands);
      case 6:
        return SixBandResistor._(bands);
    }

    throw Exception(
      'Failed to generate appropriate resistor of type ${bands.length}-band Resistor',
    );
  }
}

class ThreeBandResistor extends Resistor {
  ThreeBandResistor._(List<ResistorBandColor> bands)
      : assert(bands.length == 3),
        super._(
          // associated bands
          digit1Band: bands[0],
          digit2Band: bands[1],
          multiplierBand: bands[2],

          // non-associated bands
          digit3Band: null,
          toleranceBand: null,
          temperatureCoeffBand: null,
        );
}

class FourBandResistor extends Resistor {
  FourBandResistor._(List<ResistorBandColor> bands)
      : assert(bands.length == 4),
        super._(
          // associated bands
          digit1Band: bands[0],
          digit2Band: bands[1],
          multiplierBand: bands[2],
          toleranceBand: bands[3],

          // non-associated bands
          digit3Band: null,
          temperatureCoeffBand: null,
        );
}

class FiveBandResistor extends Resistor {
  FiveBandResistor._(List<ResistorBandColor> bands)
      : assert(bands.length == 5),
        super._(
          // associated bands
          digit1Band: bands[0],
          digit2Band: bands[1],
          digit3Band: bands[2],
          multiplierBand: bands[3],
          toleranceBand: bands[4],

          // non-associated bands
          temperatureCoeffBand: null,
        );
}

class SixBandResistor extends Resistor {
  SixBandResistor._(List<ResistorBandColor> bands)
      : assert(bands.length == 6),
        super._(
          digit1Band: bands[0],
          digit2Band: bands[1],
          digit3Band: bands[2],
          multiplierBand: bands[3],
          toleranceBand: bands[4],
          temperatureCoeffBand: bands[5],
        );
}
