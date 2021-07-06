import 'package:electroassist/routes/dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(ElectroAssist());

class ElectroAssist extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      title: 'Electro Assist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
    );
  }
}
