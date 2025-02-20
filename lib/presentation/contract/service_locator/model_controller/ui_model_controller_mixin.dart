import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/screen_type.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/ui_controller_mixin.dart';

mixin UiModelControllerMixin implements UiControllerMixin, UiModelMixin {}

mixin UiModelMixin {
  ValueNotifier<ScreenType?> get screenTypeNotifier;
  double get pageBlockMaxWidth;
  double get pageBlockTextMaxWidth;

  double get subscriptionIconSize;
  // Text dynamic themes
  // Title block
  TextStyle? get titleBlockTitleTextStyle;
  TextStyle? get titleBlockDescriptionTextStyle;
  TextStyle? get largeHeaderTextStyle;
  TextStyle? get featuresBlockTitleTextStyle;
  TextStyle? get mediumTitleTextStyle;
  TextStyle? get miniTitleTextStyle;

  UiByLocaleMixin get uiByLocale;
}

mixin UiByLocaleMixin {
  List<Widget> additionalDonationWidgets(BuildContext context);

  List<Widget> additionalBadges(BuildContext context);
}
