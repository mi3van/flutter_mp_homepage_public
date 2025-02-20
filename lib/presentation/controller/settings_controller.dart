import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:my_precious_homepage/presentation/common/entity/dto/collect_amount.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/theme_type.dart';
import 'package:my_precious_homepage/presentation/common/mapper/type_converter.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/controller/const.dart';
import 'package:my_precious_homepage/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController implements SettingsModelControllerMixin {
  late SharedPreferences _prefs;
  @override
  String? systemLocaleCode;

  @override
  final ValueNotifier<String> localeCodeNotifier = ValueNotifier(
    autoLocaleCode,
  );
  @override
  final ValueNotifier<ThemeType> themeNotifier = ValueNotifier(
    settingsDefaultTheme,
  );
  @override
  final ValueNotifier<CollectAmount?> collectAmntNotifier = ValueNotifier(null);

  @override
  Future<void> onInit() async {
    _prefs = await SharedPreferences.getInstance();
    final localeSavedString = _prefs.getString(sharedPrefKeyLocaleString);
    if (localeSavedString != null) {
      localeCodeNotifier.value = localeSavedString;
    }
    final themeSavedInt = _prefs.getInt(sharedPrefKeyThemeTypeInt);
    if (themeSavedInt != null) {
      themeNotifier.value = ThemeType.fromInt(themeSavedInt);
    }
    // Async loading.
    initCollectedAmount();
  }

  Future<void> initCollectedAmount() async {
    try {
      final collectAmountJson = await compute(
        TypeConverter.mapFromJson,
        (await http.get(Uri.parse(collectedAmountLink))).body,
      );
      collectAmntNotifier.value = CollectAmount(
        month: TypeConverter.stringToInt(collectAmountJson[amountJsonMonthKey]),
        current: TypeConverter.stringToInt(collectAmountJson[amountJsonCurKey]),
        total: TypeConverter.stringToInt(collectAmountJson[amountJsonTotalKey]),
      );
    } catch (_) {
      collectAmntNotifier.value = null;
    }
  }

  @override
  void cleanValues() {
    systemLocaleCode = null;
  }

  @override
  void onDispose() {
    cleanValues();
    localeCodeNotifier.dispose();
    themeNotifier.dispose();
  }

  @override
  Future updateTheme(ThemeType themeType) async {
    await _prefs.setInt(sharedPrefKeyThemeTypeInt, themeType.value);
    themeNotifier.value = themeType;
  }

  @override
  Locale getCorrectLocale(String localeCode, String systemCode) {
    if (localeCode == autoLocaleCode) {
      for (var supportedLocale in uiLocator.supportLocales) {
        if (supportedLocale.languageCode == systemCode ||
            systemCode.startsWith(supportedLocale.languageCode)) {
          // Return auto-found language.
          return supportedLocale;
        }
      }
      // Return default language.
      return const Locale(defLocaleCode);
    } else {
      // Return user-selected language.
      return Locale(localeCode);
    }
  }

  @override
  void setNewSystemLocaleCodeAndNotify(systemLocaleCode) {
    this.systemLocaleCode = systemLocaleCode;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (localeCodeNotifier.value == autoLocaleCode) {
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        localeCodeNotifier.notifyListeners();
      }
    });
  }

  @override
  Future updateLocalizationCode(String? newLocaleCode) async {
    if (newLocaleCode == null) {
      return;
    }
    await _prefs.setString(sharedPrefKeyLocaleString, newLocaleCode);
    localeCodeNotifier.value = newLocaleCode;
  }
}
