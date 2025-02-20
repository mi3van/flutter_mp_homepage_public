import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/assets.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/toolbar/base_top_toolbar.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/toolbar/language_dropdown.dart';

class LandingTopToolbar extends StatelessWidget {
  const LandingTopToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTopToolbar(
      startWidget: Image.asset(Assets.imgAppIconForeground.link),
      toolbarTitle: appName,
      endWidget: LanguageDropdown(),
    );
  }
}
