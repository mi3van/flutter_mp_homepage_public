import 'package:flutter/widgets.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/theme_type.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/locales_controller_mixin.dart';

class LocalesController implements LocalesControllerMixin {
  @override
  AppLocale getAppLocale(BuildContext context) => AppLocale.of(context)!;

  @override
  Future<AppLocale> getAppLocaleByCode(Locale locale) =>
      AppLocale.delegate.load(locale);

  @override
  AppLocale getAppDefaultLocale() => AppDefaultLocale();

  @override
  String getThemeTypeTitle(locale, ThemeType type) {
    throw UnimplementedError("Theme type title");
    // switch (type) {
    //   case ThemeType.auto:
    //     return locale.auto;
    //   case ThemeType.light:
    //     return locale.lightTheme;
    //   case ThemeType.dark:
    //     return locale.darkTheme;
    // }
  }
}
