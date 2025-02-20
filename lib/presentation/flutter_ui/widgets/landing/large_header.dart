// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/screen_type.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';
import 'package:my_precious_homepage/service_locator.dart';

class LargeHeader extends StatelessWidget with GetItMixin {
  LargeHeader(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    watchX<UiModelControllerMixin, ScreenType?>(
        (model) => (model as UiModelMixin).screenTypeNotifier);
    final textDynamicTheme = uiLocator.uiModel.largeHeaderTextStyle;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: uiLocator.uiModel.pageBlockTextMaxWidth,
        minWidth: uiLocator.uiModel.pageBlockTextMaxWidth,
      ),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: theme.textTheme.displaySmall
            ?.copyWith(
              fontSize: textDynamicTheme?.fontSize,
              height: textDynamicTheme?.height,
              letterSpacing: textDynamicTheme?.letterSpacing,
            )
            .copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
