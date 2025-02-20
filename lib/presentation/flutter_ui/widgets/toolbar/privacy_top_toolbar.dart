import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/toolbar/back_btn_toolbar.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/toolbar/base_top_toolbar.dart';
import 'package:my_precious_homepage/service_locator.dart';

class PrivacyTopToolbar extends StatelessWidget {
  const PrivacyTopToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);

    final policyWithoutDot = locale.privacyPolicyTextOfLinkItself
        .substring(0, locale.privacyPolicyTextOfLinkItself.length - 1);

    return BaseTopToolbar(
      startWidget: const BackButtonToolbar(),
      toolbarTitle: "$appNameShort: $policyWithoutDot",
    );
  }
}
