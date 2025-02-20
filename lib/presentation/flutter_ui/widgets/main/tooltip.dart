import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';

class PreciousTooltip extends StatelessWidget {
  final Widget child;
  final String? message;
  const PreciousTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Tooltip(
        message: message,
        waitDuration: tooltipDuration,
        child: child,
      );
}
