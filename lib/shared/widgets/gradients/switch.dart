import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class GradientSwitch extends StatefulWidget {
  const GradientSwitch({Key? key}) : super(key: key);

  @override
  createState() => _GradientSwitchState();
}

class _GradientSwitchState extends State<GradientSwitch> {
  bool isEnabled = false;

  String stateLabel = "Light";

  List<Color> gradientColors = [
    Colors.red,
    Colors.yellow,
  ];

  Alignment beginGradientAlignment = Alignment.topLeft;

  Alignment endGradientAlignment = Alignment.bottomRight;

  Alignment trailingAlignment = Alignment.centerLeft;

  Alignment leadingAlignment = Alignment.centerRight;

  Widget leading = Icon(
    Icons.brightness_1,
    color: Colors.white,
  );

  animate() {
    if (!isEnabled) {
      beginGradientAlignment = Alignment.bottomRight;
      endGradientAlignment = Alignment.topLeft;
      stateLabel = "Dark";
      gradientColors = [
        Colors.black54,
        Colors.grey,
      ];
      trailingAlignment = Alignment.centerRight;
      leadingAlignment = Alignment.centerLeft;
      leading = Icon(
        Icons.dark_mode,
        color: Colors.white,
      );
    } else {
      beginGradientAlignment = Alignment.topLeft;
      endGradientAlignment = Alignment.bottomRight;
      stateLabel = "Light";
      gradientColors = [
        Colors.red,
        Colors.yellow,
      ];
      trailingAlignment = Alignment.centerLeft;
      leadingAlignment = Alignment.centerRight;
      leading = Icon(
        Icons.brightness_1,
        color: Colors.white,
      );
    }
    isEnabled = !isEnabled;
  }

  @override
  build(context) {
    return FadeIn(
      preferences: AnimationPreferences(
        duration: Duration(milliseconds: 300),
        offset: Duration(milliseconds: 300),
      ),
      child: InkWell(
        onTap: () => setState(() => animate()),
        borderRadius: BorderRadius.circular(30),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: 100,
          height: 35,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.shade100,
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: beginGradientAlignment,
              end: endGradientAlignment,
              colors: gradientColors,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: AnimatedAlign(
                    alignment: trailingAlignment,
                    duration: Duration(milliseconds: 200),
                    child: leading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: AnimatedAlign(
                    alignment: leadingAlignment,
                    duration: Duration(milliseconds: 200),
                    child: Text(
                      stateLabel,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
