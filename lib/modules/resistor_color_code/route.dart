import 'package:electroassist/modules/resistor_color_code/module.dart';
import 'package:electroassist/shared/widgets/resistor_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResistorColorCodePage extends StatefulWidget {
  const ResistorColorCodePage({Key? key}) : super(key: key);

  @override
  createState() => _ResistorColorCodePageState();
}

class _ResistorColorCodePageState extends State<ResistorColorCodePage> {
  List<String> _tabs = [
    "1st Band",
    "2nd Band",
    "3rd Band",
    "Multiplier",
    "Tolerance",
    "Temp",
  ];

  @override
  build(context) {
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
                height: 200,
                child: ChipSelector(
                  onSelected: (index) => _selectedIndex = index,
                  tabs: _tabs,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
