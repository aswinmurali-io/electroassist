import 'package:animations/animations.dart';
import 'package:electroassist/main.dart';
import 'package:electroassist/routes/settings.dart';
import 'package:electroassist/shared/components/module.dart';
import 'package:electroassist/shared/widgets/gradient_floating_action_button.dart';
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
            for (final module in Module.allModules)
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
      floatingActionButton: OpenContainer(
        closedElevation: 0,
        openColor: Colors.transparent,
        closedColor: Colors.transparent,
        openElevation: 0,
        openBuilder: (context, _) => SettingsPage(),
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        closedBuilder: (context, action) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 3, 8),
            child: GradientFloatingActionButton(
              tooltip: 'Settings',
              onPressed: action,
              child: Icon(
                Icons.settings,
                color: Colors.blueGrey,
              ),
            ),
          );
        },
      ),
    );
  }
}
