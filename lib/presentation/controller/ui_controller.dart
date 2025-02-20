import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/assets.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/screen_type.dart';
import 'package:my_precious_homepage/presentation/common/theme/theme_app.dart'
    show currentTextTheme;
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/common/helper_media_query.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/l_app_sources.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/subscription_block/details.dart';
import 'package:my_precious_homepage/service_locator.dart';

class UiController implements UiModelControllerMixin {
  @override
  late double pageBlockMaxWidth;
  @override
  late double pageBlockTextMaxWidth;
  @override
  ValueNotifier<ScreenType?> screenTypeNotifier = ValueNotifier(null);

  @override
  late double subscriptionIconSize;

// Text theming
  @override
  TextStyle? titleBlockTitleTextStyle;
  @override
  TextStyle? titleBlockDescriptionTextStyle;
  @override
  TextStyle? largeHeaderTextStyle;
  @override
  TextStyle? featuresBlockTitleTextStyle;
  @override
  TextStyle? mediumTitleTextStyle;
  @override
  TextStyle? miniTitleTextStyle;

  @override
  late UiByLocaleMixin uiByLocale;

  @override
  void updateScreenType(double newWidth) {
    final newScreenType = MediaQueryHelper.getScreenTypeByWidth(newWidth);
    if (screenTypeNotifier.value == newScreenType) return;

    if (newScreenType == ScreenType.desktop) {
      // Desktop settings
      pageBlockMaxWidth = appPageBlockMaxWidthDesktop;
      pageBlockTextMaxWidth = double.infinity;

      subscriptionIconSize = subscriptionDetailIconSizeDesktop;
      // Text
      titleBlockTitleTextStyle = currentTextTheme.displayLarge;
      titleBlockDescriptionTextStyle = currentTextTheme.headlineMedium;
      largeHeaderTextStyle = currentTextTheme.displaySmall;
      featuresBlockTitleTextStyle = currentTextTheme.headlineMedium;
      mediumTitleTextStyle = currentTextTheme.titleLarge;
      miniTitleTextStyle = currentTextTheme.bodyLarge;
    } else {
      // Handset settings
      pageBlockMaxWidth = appPageBlockMaxWidthHandset;
      pageBlockTextMaxWidth = appPageBlockMaxWidthHandset;

      subscriptionIconSize = subscriptionDetailIconSizeHandset;
      // Text
      titleBlockTitleTextStyle = currentTextTheme.displayMedium;
      titleBlockDescriptionTextStyle = currentTextTheme.headlineSmall;
      largeHeaderTextStyle = currentTextTheme.headlineLarge;
      featuresBlockTitleTextStyle = currentTextTheme.headlineSmall;
      mediumTitleTextStyle = currentTextTheme.bodyLarge;
      miniTitleTextStyle = currentTextTheme.bodyMedium;
    }

    screenTypeNotifier.value = newScreenType;
  }

  @override
  void localeUpdated(String localeCode) {
    uiByLocale = switch (localeCode) {
      "ru" => _RusUiByLocale(),
      _ => _DefaultUiByLocale(),
    };
  }

  static void showValueCopied(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${AppLocaleM.of(context).copyButtonLabel}: $value"),
        duration: snackBarDurationFast,
      ),
    );
  }
}

class _DefaultUiByLocale implements UiByLocaleMixin {
  @override
  List<Widget> additionalDonationWidgets(context) => [];
  @override
  List<Widget> additionalBadges(context) => [];
}

class _RusUiByLocale implements UiByLocaleMixin {
  @override
  List<Widget> additionalDonationWidgets(context) => [
        DonationsDetails(
          iconData: Icons.flash_on_outlined,
          detailTitle: "Донат через Boosty",
          detailDescription: "Нажмите, чтобы открыть ссылку.",
          onTap: uiLocator.appController.oneTimeBoosty,
        ),
        DonationsDetails(
          iconData: Icons.credit_card_rounded,
          detailTitle: bankNumberTitle,
          detailDescription: "Нажмите, чтобы скопировать номер.",
          onTap: () {
            uiLocator.appController.oneTimeBankCard();
            UiController.showValueCopied(context, bankNumberTitle);
          },
        ),
      ];

  @override
  List<Widget> additionalBadges(BuildContext context) => [
        BadgeButton(
          assetLink: Assets.imgBadgeRuStore.link,
          onTap: uiLocator.appController.onRuStoreClick,
        )
      ];
}
