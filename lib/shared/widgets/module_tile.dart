import 'package:animations/animations.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class ModuleTile extends StatelessWidget {
  final Widget page;

  final Icon icon;

  final Color avatorColor;

  final Gradient gradient;

  final String title, description;

  const ModuleTile({
    required this.title,
    required this.icon,
    required this.page,
    required this.description,
    required this.avatorColor,
    this.gradient = const LinearGradient(
      colors: [
        Color(0xFFECEFF1), // Colors.blueGrey.shade50
        Color(0xFFCFD8DC), // Colors.blueGrey.shade100
      ],
    ),
  });

  @override
  build(context) {
    return OpenContainer(
      closedElevation: 0.0,
      openBuilder: (context, _) => page,
      closedBuilder: (context, action) {
        return BouncingWidget(
          onPressed: action,
          scaleFactor: 1,
          duration: const Duration(milliseconds: 200),
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.transparent,
                ),
                gradient: gradient),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    child: icon,
                    backgroundColor: avatorColor,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
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
