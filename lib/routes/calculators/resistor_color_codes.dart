import 'package:electroassist/main.dart';
import 'package:electroassist/shared/components/module.dart';
import 'package:electroassist/shared/widgets/module_tile.dart';
import 'package:flutter/material.dart';

class ResistorColorCodes extends Module {
  @override
  get name => 'Resistor Color Codes';

  @override
  get description =>
      'Calculate resistance based on the color code given in the resistor';

  @override
  get page => ResistorColorCodePage();

  @override
  get style => ModuleTileStyle(
        avatorColor: Color(0xff8f94fb),
        image: Icon(
          Icons.ac_unit,
          color: Colors.white,
        ),
        style: TextStyle(
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

class ResistorColorCodePage extends StatefulWidget {
  const ResistorColorCodePage({Key? key}) : super(key: key);

  @override
  createState() => _ResistorColorCodePageState();
}

class _ResistorColorCodePageState extends State<ResistorColorCodePage> {
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ElectroAssist.appName),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
