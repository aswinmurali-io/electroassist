import 'package:electroassist/modules/resistor_color_code/module.dart';
import 'package:electroassist/shared/widgets/gradients/fab.dart';
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
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.blueGrey.shade50,
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
                    child: Text(
                      "Resistor Calculator",
                      style: theme.textTheme.headline1,
                    ),
                  ),
                  Text("RESISTOR IMAGE HERE"),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Band selection",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 110,
                    child: ChipSelector(
                      onSelected: (index) =>
                          resistorState.bandTypeIndex = index,
                      tabs: [
                        "3 Band",
                        "4 Band",
                        "5 Band",
                        "6 Band",
                      ],
                    ),
                  ), //SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ChipSelector(
                      onSelected: (index) =>
                          resistorState.bandTypeIndex = index,
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
          floatingActionButton: GradientFloatingActionButton(
            onPressed: Navigator.of(context).pop,
            child: Icon(Icons.chevron_left_sharp),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffD16BA5),
                Color(0xff86A8E7),
                Colors.tealAccent,
              ],
            ),
            tooltip: 'Go back to home',
          ),
        ),
      ),
    );
  }
}
