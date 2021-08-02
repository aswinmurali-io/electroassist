import 'package:animations/animations.dart';
import 'package:electroassist/main.dart';
import 'package:electroassist/routes/settings.dart';
import 'package:electroassist/shared/components/module.dart';
import 'package:electroassist/shared/widgets/module_tile.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late AnimationController rotationController;

  @override
  initState() {
    rotationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  build(context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OpenContainer(
                closedElevation: 0,
                openColor: Colors.transparent,
                closedColor: Colors.transparent,
                openElevation: 0,
                openBuilder: (context, _) => SettingsPage(
                  rotationController: rotationController,
                ),
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                closedBuilder: (context, action) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 3, 8),
                    child: Tooltip(
                      message: 'Settings',
                      child: IconButton(
                        onPressed: () async {
                          rotationController.forward(from: 0.0);
                          await Future.delayed(Duration(milliseconds: 200));
                          action();
                        },
                        icon: RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0)
                              .animate(rotationController),
                          child: Icon(
                            Icons.settings,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
              child: Text(
                ElectroAssist.appName,
                style: theme.textTheme.headline1,
              ),
            ),
          ),
          for (final module in Module.allModules)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: ModuleTile(
                module: module,
                style: module.style,
              ),
            ),
        ],
      ),
    );
  }
}
