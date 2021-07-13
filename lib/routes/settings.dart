import 'package:animations/animations.dart';
import 'package:electroassist/main.dart';
import 'package:electroassist/routes/dashboard.dart';
import 'package:electroassist/shared/widgets/gradients/fab.dart';
import 'package:electroassist/shared/widgets/gradients/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({
    Key? key,
    this.rotationController,
  }) : super(key: key);

  AnimationController? rotationController;

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
                padding: const EdgeInsets.fromLTRB(15, 60, 0, 10),
                child: Text(
                  "Settings",
                  style: theme.textTheme.headline1,
                ),
              ),
              ListTile(
                title: Text('Change Theme'),
                subtitle: Text(
                    'Change your theme from light, dark or let your system handle it.'),
                isThreeLine: true,
                trailing: GradientSwitch(),
                onTap: () {},
              ),
              ListTile(
                title: Text('Default Temperature'),
                subtitle: Text(
                    'Change your theme from light, dark or let your system handle it.'),
                isThreeLine: true,
                trailing: GradientSwitch(),
                onTap: () {},
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 3, 8),
          child: GradientFloatingActionButton(
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffD16BA5),
                Color(0xff86A8E7),
                Colors.tealAccent,
              ],
            ),
            onPressed: () {
              widget.rotationController?.forward(from: 0);
              Navigator.of(context).pop();
            },
            tooltip: "Go back to home",
          ),
        ),
      ),
    );
  }
}
