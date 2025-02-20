// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/screen_type.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';
import 'package:my_precious_homepage/service_locator.dart';

class FeaturesTextTitle extends StatelessWidget with GetItMixin {
  FeaturesTextTitle(
    this.title, {
    this.color,
    super.key,
  });

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    watchX<UiModelControllerMixin, ScreenType?>(
        (model) => (model as UiModelMixin).screenTypeNotifier);
    final textDynamicTheme = uiLocator.uiModel.featuresBlockTitleTextStyle;

    return Text(
      title,
      textAlign: TextAlign.center,
      style: theme.textTheme.headlineMedium
          ?.copyWith(
            fontSize: textDynamicTheme?.fontSize,
            letterSpacing: textDynamicTheme?.letterSpacing,
          )
          .copyWith(
            fontWeight: FontWeight.bold,
            color: color,
            height: 1,
          ),
    );
  }
}
