import 'package:flutter/material.dart';

class FeaturesText extends StatelessWidget {
  const FeaturesText(
    this.text, {
    super.key,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      textAlign: TextAlign.center,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: color,
      ),
    );
  }
}
