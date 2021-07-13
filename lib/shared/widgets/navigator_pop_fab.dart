import 'package:electroassist/shared/widgets/gradient_floating_action_button.dart';
import 'package:flutter/material.dart';

class NavigatorPopFloatingActionButton extends StatelessWidget {
  /// Shall be similar to: `Back to <expected destination page>`.
  final String tooltip;

  /// A [GradientFloatingActionButton] that performs [Navigator.pop] on the
  /// current context.
  ///
  /// Try to specify a
  ///
  /// **Example:**
  /// ```dart
  /// NavigatorPopFloatingActionButton(
  ///   tooltip: 'Back to ____',
  /// ),
  /// ```
  const NavigatorPopFloatingActionButton({
    Key? key,
    required this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientFloatingActionButton(
      onPressed: Navigator.of(context).pop,
      child: Icon(Icons.chevron_left_sharp),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xffD16BA5),
          Color(0xff86A8E7),
          Colors.tealAccent,
        ],
      ),
      tooltip: tooltip,
    );
  }
}
