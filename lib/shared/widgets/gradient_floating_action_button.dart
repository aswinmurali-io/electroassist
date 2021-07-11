import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class GradientFloatingActionButton extends StatefulWidget {
  final LinearGradient gradient;

  final String tooltip;

  final void Function()? onPressed;

  final Widget child;

  const GradientFloatingActionButton({
    Key? key,
    required this.tooltip,
    required this.onPressed,
    required this.child,
    this.gradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFECEFF1), // Colors.blueGrey.shade50
        Color(0xFFCFD8DC), // Colors.blueGrey.shade100
      ],
    ),
  }) : super(key: key);

  @override
  createState() => _GradientFloatingActionButtonState();
}

class _GradientFloatingActionButtonState
    extends State<GradientFloatingActionButton> {
  @override
  build(context) {
    return BounceIn(
      child: FloatingActionButton(
        onPressed: widget.onPressed,
        tooltip: widget.tooltip,
        backgroundColor: Colors.transparent,
        child: Ink(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: widget.gradient,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
