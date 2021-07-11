import 'dart:math';

import 'package:flutter/material.dart';

enum ResistorBandType { threeBand, fourBand, fiveBand, sixBand }

class ResistorColorCodeViewModel extends ChangeNotifier {
  ResistorBandType _bandType = ResistorBandType.fourBand;

  ResistorBandType get bandType => _bandType;

  set bandType(ResistorBandType value) {
    if (_bandType != value) {
      _bandType = value;
      notifyListeners();
    }
  }

  int get numberOfDigitBands {
    switch (_bandType) {
      case ResistorBandType.threeBand:
      case ResistorBandType.fourBand:
        return 2;
      case ResistorBandType.fiveBand:
      case ResistorBandType.sixBand:
        return 3;
    }
  }

  bool get hasToleranceBand {
    switch (_bandType) {
      case ResistorBandType.threeBand:
        return false;
      case ResistorBandType.fourBand:
      case ResistorBandType.fiveBand:
      case ResistorBandType.sixBand:
        return true;
    }
  }

  bool get hasTemperatureCoefficientBand {
    switch (_bandType) {
      case ResistorBandType.threeBand:
      case ResistorBandType.fourBand:
      case ResistorBandType.fiveBand:
        return false;
      case ResistorBandType.sixBand:
        return true;
    }
  }

  static final _random = Random();

  static num randomDigitBand() =>
      digitBandValues.elementAt(_random.nextInt(digitBandColors.length));

  static num randomMultiplierBand() => multiplierBandColors.keys
      .elementAt(_random.nextInt(multiplierBandColors.length));

  static num randomToleranceBand() => toleranceBandColors.keys
      .elementAt(_random.nextInt(toleranceBandColors.length));

  static num randomTemperatureCoefficientBand() => tempCoeffBandColors.keys
      .elementAt(_random.nextInt(tempCoeffBandColors.length));

  num _digit1 = randomDigitBand();
  num _digit2 = randomDigitBand();
  num _digit3 = randomDigitBand();
  num _multiplier = randomMultiplierBand();
  num _tolerance = randomToleranceBand();
  num _temperatureCoefficient = randomTemperatureCoefficientBand();

  num get digit1 => _digit1;
  num get digit2 => _digit2;
  num get digit3 => _digit3;
  num get multiplier => _multiplier;
  num get tolerance => _tolerance;
  num get temperatureCoefficient => _temperatureCoefficient;

  set digit1(num value) {
    if (digit1 != value) {
      _digit1 = value;
      notifyListeners();
    }
  }

  set digit2(num value) {
    if (digit2 != value) {
      _digit2 = value;
      notifyListeners();
    }
  }

  set digit3(num value) {
    if (digit3 != value) {
      _digit3 = value;
      notifyListeners();
    }
  }

  set multiplier(num value) {
    if (multiplier != value) {
      _multiplier = value;
      notifyListeners();
    }
  }

  set tolerance(num value) {
    if (tolerance != value) {
      _tolerance = value;
      notifyListeners();
    }
  }

  set temperatureCoefficientBand(num value) {
    if (temperatureCoefficient != value) {
      _temperatureCoefficient = value;
      notifyListeners();
    }
  }

  num get resistance {
    var value = digit1 * 10 + digit2;

    if (numberOfDigitBands > 2) {
      value = value * 10 + digit3;
    }

    return value * multiplier;
  }

  static final digitBandColors = {
    0: Colors.black,
    1: Colors.brown,
    2: Colors.red,
    3: Colors.orange,
    4: Colors.yellow,
    5: Colors.green,
    6: Colors.blue,
    7: Colors.purple,
    8: Colors.grey,
    9: Colors.white,
  };

  static Iterable<int> get digitBandValues => digitBandColors.keys;

  static final multiplierBandColors = {
    1e0: Colors.black,
    1e1: Colors.brown,
    1e2: Colors.red,
    1e3: Colors.orange,
    1e4: Colors.yellow,
    1e5: Colors.green,
    1e6: Colors.blue,
    1e7: Colors.purple,
    1e8: Colors.grey,
    1e9: Colors.white,
    1e-1: Colors.amber,
    1e-2: Colors.grey.shade300,
  };

  static final toleranceBandColors = {
    1: Colors.brown,
    2: Colors.red,
    3: Colors.orange,
    4: Colors.yellow,
    .5: Colors.green,
    .25: Colors.blue,
    .1: Colors.purple,
    .05: Colors.grey,
    5: Colors.amber,
    10: Colors.grey.shade300,
    20: Colors.transparent,
  };

  static final tempCoeffBandColors = {
    250: Colors.black,
    100: Colors.brown,
    50: Colors.red,
    15: Colors.orange,
    25: Colors.yellow,
    20: Colors.green,
    10: Colors.blue,
    5: Colors.purple,
    1: Colors.grey,
  };
}
