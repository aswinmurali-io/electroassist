import 'package:electroassist/modules/resistor_color_code/module.dart';
import 'package:electroassist/shared/widgets/resistor_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResistorBandState {
  ResistorBandState._();

  static final instance = ResistorBandState._();

  int? bandTypeIndex;

  int? firstBandColorIndex;

  int? secondBandColorIndex;

  int? thirdBandColorIndex;

  int? fourthBandColorIndex;

  int? fivethBandColorIndex;

  int? sixthBandColorIndex;
}

class ResistorColorCodePage extends StatefulWidget {
  @override
  createState() => _ResistorColorCodePageState();
}

class _ResistorColorCodePageState extends State<ResistorColorCodePage> {
  @override
  build(context) {
    final resistorState = ResistorBandState.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(ResistorColorCode.instance.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("RESISTOR IMAGE HERE"),
              SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ChipSelector(
                  onSelected: (index) => resistorState.bandTypeIndex = index,
                  tabs: [
                    "3 Band",
                    "4 Band",
                    "5 Band",
                    "6 Band",
                  ],
                ),
              ),              //SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ChipSelector(
                  onSelected: (index) => resistorState.bandTypeIndex = index,
                  tabs: [
                    "3 Band",
                    "4 Band",
                    "5 Band",
                    "6 Band",
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
