import 'dart:ui';

abstract class HelperText {
  static bool isRtlLocale(Locale locale) =>
      _rtlLocales.contains(locale.languageCode);
}

const _rtlLocales = [
  'ar', // Arabic
  'ur', // Urdu
  // 'fa', // Farsi
  // 'he', // Hebrew
  // 'ps', // Pashto
];
