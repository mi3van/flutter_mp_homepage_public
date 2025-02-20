// Basic application configurations
import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/theme_type.dart';
import 'package:my_precious_homepage/presentation/controller/helper_date.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/common/const.dart';

const appName = 'My Precious';
const appNameShort = 'MP';
const appSupportEmail = 'mi3van.sup@gmail.com';

// Landing links
const appGoogleLink =
    'https://play.google.com/store/apps/details?id=com.mi3van.my_precious';
const ruStoreLink = 'https://www.rustore.ru/catalog/app/com.mi3van.my_precious';
const appHuaweiLink =
    'https://appgallery.huawei.com/#/app/C108821689?sharePrepath=ag';
const appArticleLink =
    'https://medium.com/@mi3van/cozy-home-inventory-solution-you-dont-expect-da1dd8e5ddb9';
const casaPdfLink =
    'https://raw.githubusercontent.com/mi3van/CASA-completed/main/My_Precious_CASA.pdf';

// Privacy links
const String gdprLink =
    "https://ec.europa.eu/info/law/law-topic/data-protection_en";
const String coppaLink = "https://www.ftc.gov/legal-library/browse/rules/"
    "childrens-online-privacy-protection-rule-coppa";
const String cookieLink = "https://en.wikipedia.org/wiki/HTTP_cookie";
const String googleServicesLink = "https://www.google.com/policies/privacy/";
const String googleUserApiScopesLink = "https://developers.google.com/terms/"
    "api-services-user-data-policy#additional_requirements_for_specific_api_scopes";
const minYearValue = 2025;
final currentYear = HelperDate.nowSecure().year.toString();

const isBodyExtend = true;

const heightWebToolbar = 48.0;

// Default settings
const elementHeightHuge = 96.0;
const elementHeightBig = 56.0;
const elementHeightRegular = 40.0;
const elementHeightSmall = 32.0;
const elementHeightSmaller = 26.0;
const elementHeightMicro = 20.0;
const elementHeightNano = 14.0;
const elementIconSizeBig = 36.0;
const elementIconSizeRegular = 24.0;
const elementIconSizeMini = 20.0;
const snackBarDurationFast = Duration(seconds: 1);

const paddingHuge = 32.0;
const paddingBig = 24.0;
const paddingRegular = 16.0;
const paddingSmall = 12.0;
const paddingSmaller = 8.0;
const paddingMicro = 4.0;
const paddingForChip = 2.0;

const borderRadiusHuge = 32.0;
const borderRadiusBig = 16.0;
const borderRadiusRegular = 12.0;
const borderRadiusSmall = 8.0;

const animationDurationFast = Duration(milliseconds: 300);
const animationDurationRegular = Duration(milliseconds: 600);
const animationDurationSlow = Duration(milliseconds: 900);
const animationDurationSlowest = Duration(milliseconds: 2000);
const pageTransitionDuration = animationDurationRegular;
const tooltipDuration = animationDurationRegular;
const durationItemDetailsSwitcher = animationDurationRegular;

// Elements design config-s
const fabElevation = 4.0;
const fabClickedElevation = 8.0;
const menuElevation = 4;
const buttonSplashRadius = 28.0;
const dropdownBtnMaxWidth = 90.0;

const titleTextFieldHeightCoef = 1.2;

// Widget coordinates setup
const appMaxWidth = desktopMinWidth;
const appBlockSpacing = paddingBig;
const appPageVertPadding = paddingBig;
const appPageHorizPadding = paddingRegular;
const appPageBlockMaxWidthDesktop = (appMaxWidth -
        appBlockSpacing -
        appPageHorizPadding -
        appPageHorizPadding) /
    2;
final appPageBlockMaxWidthHandset =
    min(appPageBlockMaxWidthDesktop + elementHeightBig, appMaxWidth);

const appTitleImageBlockHeight = 384.0;
const appTitleImageBlockPadding = paddingRegular;
final appTitleImageHeight =
    appTitleImageBlockHeight - appTitleImageBlockPadding;
const appTitleImageAspectRatio = 0.70424597;
// final appTitleImageCacheHeight = appTitleImageHeight.toInt() << 1;
// final appTitleImageCacheWidth =
//     (appTitleImageCacheHeight * appTitleImageAspectRatio).toInt();

const appLinkBadgeHeight = elementHeightBig;
// final appLinkBadgeImageCacheHeight = elementHeightBig.toInt() << 1;

const subscriptionDetailIconSizeDesktop = elementHeightSmall;
const subscriptionDetailIconSizeHandset = elementHeightSmaller;

typedef AppContextType = BuildContext;
typedef AppLocale = AppLocalizations;
typedef AppLocaleM = MaterialLocalizations;
typedef AppDefaultLocale = AppLocalizationsEn;
const defaultLocale = Locale(autoLocaleCode);
const appSupportLocales = [defaultLocale, ...AppLocale.supportedLocales];
final Map<String, LocaleInfo> localesInfo = {
  for (var locale in appSupportLocales)
    locale.toLanguageTag(): getLocaleInfo(locale.toString()),
};

const bankNumberTitle = "По номеру карты (Т-Банк)";
const cryptoTRC20Title = "USDT (TRC20)";
const cryptoERC20Title = "USDT (ERC20)";
const cryptoBitcoinTitle = "BTC (Bitcoin)";
const cryptoTonTitle = "TON (TON)";

// Settings
const autoLocaleCode = "--";
const defLocaleCode = "en";

const settingsDefaultTheme = ThemeType.auto;

// Languages
LocaleInfo getLocaleInfo(key) {
  return _isoLangs[key] ?? (throw Exception("Language key is incorrect"));
}

typedef LocaleInfo = ({String sysName, IconData iconData, String displayName});

abstract class LocaleSysNames {
  static const auto = "Device language";
  static const ar = "Arabic";
  static const da = "Danish";
  static const de = "German";
  static const en = "English";
  static const es = "Spanish";
  static const fi = "Finnish";
  static const fr = "French";
  static const hi = "Hindi";
  static const hu = "Hungarian";
  static const id = "Indonesian";
  static const it = "Italian";
  static const ja = "Japanese";
  static const ko = "Korean";
  static const nl = "Dutch";
  static const no = "Norwegian";
  static const pt = "Portuguese";
  static const ru = "Russian";
  static const sv = "Swedish";
  static const ur = "Urdu";
  static const zh = "Chinese";
}

const Map<String, LocaleInfo> _isoLangs = {
  autoLocaleCode: (
    sysName: LocaleSysNames.auto,
    iconData: Icons.language_rounded,
    displayName: "Auto"
  ),
  "ar": (
    sysName: LocaleSysNames.ar,
    iconData: Icons.mosque_rounded,
    displayName: "اَلْعَرَبِيَّةُ"
  ),
  "da": (
    sysName: LocaleSysNames.da,
    iconData: Icons.kebab_dining_outlined,
    displayName: "Dan."
  ),
  "de": (
    sysName: LocaleSysNames.de,
    iconData: Icons.breakfast_dining_rounded,
    displayName: "Deu."
  ),
  "en": (
    sysName: LocaleSysNames.en,
    iconData: Icons.egg_alt_rounded,
    displayName: "Eng."
  ),
  "es": (
    sysName: LocaleSysNames.es,
    iconData: Icons.tapas_rounded,
    displayName: "Esp."
  ),
  "fi": (
    sysName: LocaleSysNames.fi,
    iconData: Icons.cookie_rounded,
    displayName: "Suo."
  ),
  "fr": (
    sysName: LocaleSysNames.fr,
    iconData: Icons.bakery_dining_rounded,
    displayName: "Fra."
  ),
  "hi": (
    sysName: LocaleSysNames.hi,
    iconData: Icons.temple_hindu_rounded,
    displayName: "हिन्दी"
  ),
  "hu": (
    sysName: LocaleSysNames.hu,
    iconData: Icons.dinner_dining_rounded,
    displayName: "Mag."
  ),
  "id": (
    sysName: LocaleSysNames.id,
    iconData: Icons.rice_bowl_outlined,
    displayName: "Ind."
  ),
  "it": (
    sysName: LocaleSysNames.it,
    iconData: Icons.local_pizza_rounded,
    displayName: "Ita."
  ),
  "ja": (
    sysName: LocaleSysNames.ja,
    iconData: Icons.ramen_dining_rounded,
    displayName: "日本語"
  ),
  "ko": (
    sysName: LocaleSysNames.ko,
    iconData: Icons.bug_report_rounded,
    displayName: "한국어"
  ),
  "nl": (
    sysName: LocaleSysNames.nl,
    iconData: Icons.cookie_outlined,
    displayName: "Ned."
  ),
  "no": (
    sysName: LocaleSysNames.no,
    iconData: Icons.lunch_dining_outlined,
    displayName: "Nor."
  ),
  "pt": (
    sysName: LocaleSysNames.pt,
    iconData: Icons.set_meal_rounded,
    displayName: "Por."
  ),
  "ru": (
    sysName: LocaleSysNames.ru,
    iconData: Icons.soup_kitchen_rounded,
    displayName: "Рус."
  ),
  "sv": (
    sysName: LocaleSysNames.sv,
    iconData: Icons.egg_rounded,
    displayName: "Sve."
  ),
  "ur": (
    sysName: LocaleSysNames.ur,
    iconData: Icons.kebab_dining_rounded,
    displayName: "اُردُو"
  ),
  "zh": (
    sysName: LocaleSysNames.zh,
    iconData: Icons.rice_bowl_rounded,
    displayName: "官话"
  ),
};
