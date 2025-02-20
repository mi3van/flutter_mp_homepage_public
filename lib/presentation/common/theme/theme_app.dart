import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/theme_type.dart';
import 'package:my_precious_homepage/presentation/common/theme/lib_color_schemes.g.dart';
import 'package:my_precious_homepage/presentation/common/theme/theme_for_text.dart'
    show robotoMyTextTheme;
import 'package:my_precious_homepage/presentation/config.dart';

class Theming {
  static get light => _getThemeDataByScheme(lightColorScheme);
  static get dark => _getThemeDataByScheme(darkColorScheme);

  static ThemeMode adaptToPlatformTheme(ThemeType appTheme) {
    switch (appTheme) {
      case ThemeType.auto:
        return ThemeMode.system;
      case ThemeType.dark:
        return ThemeMode.dark;
      case ThemeType.light:
        return ThemeMode.light;
    }
  }

  static ThemeData _getThemeDataByScheme(ColorScheme colorScheme) => ThemeData(
        pageTransitionsTheme: _pageTransitionsTheme,
        colorScheme: colorScheme,
        textTheme: _getTextTheme(colorScheme),
        chipTheme: _getChipThemeData(colorScheme),
        scaffoldBackgroundColor: colorScheme.surface,
        iconTheme: _getIconThemeData(colorScheme),
        useMaterial3: true,
      );
}

const _pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: _NoAnimationPageTransitionsBuilder(),
    TargetPlatform.macOS: _NoAnimationPageTransitionsBuilder(),
    TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
    TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
  },
  // [FadeUpwardsPageTransitionsBuilder], which defines a page transition
  ///    that's similar to the one provided by Android O.
  ///  * [OpenUpwardsPageTransitionsBuilder], which defines a page transition
  ///    that's similar to the one provided by Android P.
  ///  * [ZoomPageTransitionsBuilder], which defines the default page transition
  ///    that's similar to the one provided in Android Q.
  ///  * [CupertinoPageTransitionsBuilder],
);

final currentTextTheme = robotoMyTextTheme;

TextTheme _getTextTheme(ColorScheme colorScheme) => currentTextTheme.apply(
    bodyColor: colorScheme.onSurfaceVariant,
    displayColor: colorScheme.onSurfaceVariant);

ChipThemeData _getChipThemeData(ColorScheme colorScheme) {
  return ChipThemeData(
    pressElevation: 0,
    backgroundColor: Colors.transparent,
    checkmarkColor: colorScheme.onSurfaceVariant,
    selectedColor: colorScheme.primaryContainer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusSmall),
      side: BorderSide(color: colorScheme.outline),
    ),
    labelStyle: currentTextTheme.labelLarge?.copyWith(
      color: colorScheme.onSurfaceVariant,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

IconThemeData _getIconThemeData(ColorScheme colorScheme) {
  return IconThemeData(color: colorScheme.onSurfaceVariant);
}

class _NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const _NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
