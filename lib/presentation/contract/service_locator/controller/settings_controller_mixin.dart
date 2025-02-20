import 'dart:ui';

import 'package:my_precious_homepage/presentation/common/entity/enum/theme_type.dart';
import 'package:my_precious_homepage/presentation/contract/common/init_dispose_mixin.dart';

mixin SettingsControllerMixin implements InitDisposeMixin {
  Locale getCorrectLocale(String localeCode, String systemCode);

  void setNewSystemLocaleCodeAndNotify(String systemLocaleCode);

  Future<void> updateTheme(ThemeType themeType);

  Future<void> updateLocalizationCode(String? newLocaleCode);
}
