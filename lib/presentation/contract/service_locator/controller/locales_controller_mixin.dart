import 'package:flutter/widgets.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/theme_type.dart';
import 'package:my_precious_homepage/presentation/config.dart';

mixin LocalesControllerMixin {
  AppLocale getAppLocale(BuildContext context);
  Future<AppLocale> getAppLocaleByCode(Locale locale);
  AppLocale getAppDefaultLocale();
  String getThemeTypeTitle(AppLocale locale, ThemeType type);
}
