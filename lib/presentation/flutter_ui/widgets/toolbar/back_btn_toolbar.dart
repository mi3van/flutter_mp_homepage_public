import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/toolbar/base_top_toolbar.dart';
import 'package:my_precious_homepage/service_locator.dart';

class BackButtonToolbar extends StatelessWidget {
  const BackButtonToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => uiLocator.appController.onBackClick(context),
      borderRadius: BorderRadius.circular(paddingBig),
      child: const SizedBox(
        width: BaseTopToolbar.childHeight,
        height: BaseTopToolbar.childHeight,
        child: Icon(
          Icons.arrow_back_rounded,
        ),
      ),
    );
  }
}
