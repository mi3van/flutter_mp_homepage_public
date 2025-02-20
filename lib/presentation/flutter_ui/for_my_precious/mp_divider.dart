import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/common/theme/theme_palette.dart';

class MpDivider extends StatelessWidget {
  const MpDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: ThemePalette.of(context).onSurface12,
    );
  }
}
