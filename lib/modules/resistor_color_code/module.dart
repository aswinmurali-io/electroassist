import 'package:electroassist/modules/resistor_color_code/route.dart';
import 'package:electroassist/shared/components/module.dart';
import 'package:electroassist/shared/widgets/module_tile.dart';
import 'package:flutter/material.dart';

class ResistorColorCode extends Module {
  @override
  get name => 'Resistor Color Code';

  @override
  get description => 'Find the value of resistance from the color codes.';

  @override
  get page => ResistorColorCodePage();

  @override
  get style => ModuleTileStyle(
        avatorColor: Color(0xff8f94fb),
        image: Icon(
          Icons.ac_unit,
          color: Colors.white,
        ),
        textStyle: TextStyle(
          color: Colors.white,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff4e54c8),
            Color(0xff8f94fb),
          ],
        ),
      );
}
