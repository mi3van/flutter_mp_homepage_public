import 'package:flutter/widgets.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/screen_type.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/common/const.dart';

abstract class MediaQueryHelper {
  static ScreenType getScreenType(BuildContext context) {
    // Use .shortestSide to detect device type regardless of orientation
    double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth > desktopMinWidth) return ScreenType.desktop;
    if (deviceWidth > tabletMinWidth) return ScreenType.tablet;
    return ScreenType.handset;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static ScreenType getScreenTypeByWidth(double screenWidth) {
    // Use .shortestSide to detect device type regardless of orientation
    if (screenWidth > desktopMinWidth) return ScreenType.desktop;
    // if (screenWidth > tabletMinWidth) return ScreenType.tablet;
    return ScreenType.handset;
  }
}
