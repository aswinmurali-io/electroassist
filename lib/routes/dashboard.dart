import 'package:electroassist/main.dart';
import 'package:electroassist/shared/components/module.dart';
import 'package:electroassist/shared/widgets/module_tile.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ElectroAssist.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var module in modules)
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: ModuleTile(
                  module: module,
                  style: module.style,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
