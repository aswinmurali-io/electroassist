import 'package:electroassist/main.dart';
import 'package:flutter/material.dart';

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
