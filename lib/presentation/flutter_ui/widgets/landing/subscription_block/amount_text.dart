import 'package:flutter/material.dart';

class DonationsAmountText extends StatelessWidget {
  const DonationsAmountText(
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
      style: theme.textTheme.titleLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
