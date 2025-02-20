// ignore_for_file: unnecessary_cast

import 'dart:io' as io;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious_homepage/presentation/common/theme/theme_app.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/common/helper_media_query.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/pages/landing_page.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/pages/privacy_policy_page.dart';
import 'package:my_precious_homepage/service_locator.dart';

class Application extends StatefulWidget with GetItStatefulWidgetMixin {
  Application({super.key});

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with GetItStateMixin {
  @override
  void dispose() {
    uiLocator.appController.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    uiLocator.uiController.updateScreenType(
      MediaQueryHelper.getScreenWidth(context),
    );
    final localeCode = watchX<SettingsModelControllerMixin, String>(
        (model) => (model as SettingsModelMixin).localeCodeNotifier);
    // final localTheme = watchX((SettingsModelControllerMixin model) =>
    //     (model as SettingsModelMixin).themeNotifier);

    return MaterialApp(
      title: appName,

      // Theming
      theme: Theming.light,
      darkTheme: Theming.dark,
      themeMode: ThemeMode.light, // Theming.adaptToPlatformTheme(localTheme),
      scrollBehavior: _NoThumbScrollBehavior(),

      // Localization
      locale: uiLocator.settingsController.getCorrectLocale(
        localeCode,
        kIsWeb
            ? WidgetsBinding.instance.platformDispatcher.locale.languageCode
            : io.Platform.localeName,
      ),
      localizationsDelegates: AppLocale.localizationsDelegates,
      supportedLocales: uiLocator.supportLocales,
      localeListResolutionCallback: (locales, supportedLocales) {
        final newSystemLocaleCode = locales?.first.languageCode;
        if (newSystemLocaleCode != null &&
            newSystemLocaleCode != uiLocator.settingsModel.systemLocaleCode) {
          uiLocator.settingsController.setNewSystemLocaleCodeAndNotify(
            newSystemLocaleCode,
          );
          uiLocator.uiController.localeUpdated(newSystemLocaleCode);
        }
        return basicLocaleListResolution(locales, supportedLocales);
      },
      // Routing
      initialRoute: LandingPage.route,
      routes: {
        LandingPage.route: (_) => const LandingPage(),
        PrivacyPolicyPage.route: (_) => const PrivacyPolicyPage(),
      },
    );
  }
}

class _NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<ui.PointerDeviceKind> get dragDevices => {
        ui.PointerDeviceKind.touch,
        ui.PointerDeviceKind.mouse,
        ui.PointerDeviceKind.stylus,
        ui.PointerDeviceKind.invertedStylus,
        ui.PointerDeviceKind.trackpad,
      };
}
