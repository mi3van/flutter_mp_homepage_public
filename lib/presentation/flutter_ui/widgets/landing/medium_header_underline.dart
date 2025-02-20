// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/screen_type.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';
import 'package:my_precious_homepage/service_locator.dart';

class HeaderMediumUnderline extends StatelessWidget with GetItMixin {
  HeaderMediumUnderline(
    this.text, {
    this.color,
    super.key,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    watchX<UiModelControllerMixin, ScreenType?>(
        (model) => (model as UiModelMixin).screenTypeNotifier);
    final textDynamicTheme = uiLocator.uiModel.mediumTitleTextStyle;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: uiLocator.uiModel.pageBlockTextMaxWidth,
        minWidth: uiLocator.uiModel.pageBlockTextMaxWidth,
      ),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: theme.textTheme.titleLarge
            ?.copyWith(
              fontSize: textDynamicTheme?.fontSize,
              letterSpacing: textDynamicTheme?.letterSpacing,
            )
            .copyWith(
              color: color,
              height: 1,
              decoration: TextDecoration.underline,
              decorationColor: color,
            ),
      ),
    );
  }
}
