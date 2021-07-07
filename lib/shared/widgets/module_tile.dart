import 'package:animations/animations.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:electroassist/shared/components/module.dart';
import 'package:flutter/material.dart';

@immutable
class ModuleTileStyle {
  /// The [image] of this module.
  final Widget image;

  /// The [avatorColor] for the module.
  final Color avatorColor;

  /// The [gradient] for the module.
  final Gradient gradient;

  /// The [style] for the [Text].
  final TextStyle style;

  const ModuleTileStyle({
    required this.image,
    required this.avatorColor,
    required this.style,
    this.gradient = const LinearGradient(
      colors: [
        Color(0xFFECEFF1), // Colors.blueGrey.shade50
        Color(0xFFCFD8DC), // Colors.blueGrey.shade100
      ],
    ),
  });
}

/// The [ModuleTile] is a button used to open the [Module]
/// when pressed.
class ModuleTile extends StatelessWidget {
  final Module module;

  final ModuleTileStyle style;

  const ModuleTile({
    required this.module,
    required this.style,
  });

  @override
  build(context) {
    return OpenContainer(
      closedElevation: 6,
      openColor: Colors.transparent,
      closedColor: Colors.transparent,
      openElevation: 0,
      openBuilder: (context, _) => module.page,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      closedBuilder: (context, action) {
        return BouncingWidget(
          onPressed: () => Future.delayed(Duration(milliseconds: 200), action),
          scaleFactor: 0.5,
          duration: const Duration(milliseconds: 200),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.transparent,
              ),
              gradient: style.gradient,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    child: style.image,
                    backgroundColor: style.avatorColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          module.name,
                          style: style.style.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.7,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          module.description,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
