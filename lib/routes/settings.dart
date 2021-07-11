import 'package:animations/animations.dart';
import 'package:electroassist/main.dart';
import 'package:electroassist/routes/dashboard.dart';
import 'package:electroassist/shared/widgets/gradient_floating_action_button.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;

  @override
  build(context) {
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 0, 10),
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey,
                    fontSize: 30,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Dark Theme',
                  style: TextStyle(
                    color: Colors.blueGrey.shade700,
                  ),
                ),
                subtitle: Text(
                  'Enable to disable dark mode.',
                  style: TextStyle(
                    color: Colors.blueGrey.shade400,
                  ),
                ),
                trailing: Switch(
                  value: _isDarkMode,
                  onChanged: (value) => setState(() => _isDarkMode = value),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: OpenContainer(
          closedElevation: 0,
          openColor: Colors.transparent,
          closedColor: Colors.transparent,
          openElevation: 0,
          openBuilder: (context, _) => Dashboard(),
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          closedBuilder: (context, action) {
            return GradientFloatingActionButton(
              child: Icon(Icons.home),
              onPressed: action,
              tooltip: "Go back to home",
            );
          },
        ),
      ),
    );
  }
}
