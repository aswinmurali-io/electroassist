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
    final theme = Theme.of(context);
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
                  style: theme.textTheme.headline1,
                ),
              ),
              ListTile(
                title: Text('Dark Theme'),
                subtitle: Text('Enable to disable dark mode.'),
                trailing: Switch(
                  value: _isDarkMode,
                  onChanged: (value) => setState(() => _isDarkMode = value),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 3, 8),
          child: GradientFloatingActionButton(
            child: Icon(Icons.chevron_left),
            //gradient: ,
            onPressed: Navigator.of(context).pop,
            tooltip: "Go back to home",
          ),
        ),
      ),
    );
  }
}
