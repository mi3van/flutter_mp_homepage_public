import 'package:flutter/material.dart';

class FeaturesTextUnderline extends StatelessWidget {
  const FeaturesTextUnderline(
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
        decoration: TextDecoration.underline,
        decorationColor: color,
      ),
    );
  }
}
