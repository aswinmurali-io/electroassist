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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.blueGrey.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      home: Dashboard(),
    );
  }
}
