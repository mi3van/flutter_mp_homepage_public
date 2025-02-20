import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:window_size/window_size.dart';

// Run only single instance of flutter desktop application
// https://stackoverflow.com/questions/67233239/run-only-single-instance-of-flutter-desktop-application

void desktopInit() {
  setWindowTitle(appName);
  if (kDebugMode) {
    const debugWindowWidth = 554.0;
    const debugWindowHeight = 1026.0;
    const debugWindowLeft = 1373.0;
    const debugWindowTop = 1.0;
    const frame = Rect.fromLTWH(
      debugWindowLeft,
      debugWindowTop,
      debugWindowWidth,
      debugWindowHeight,
    );
    setWindowFrame(frame);
  }

  setWindowMinSize(const Size(_desktopMinWidth, _desktopMinHeight));
  // setWindowMaxSize(const Size(desktopMaxWidth, desktopMaxHeight));
}

const _desktopMinWidth = 400.0;
const _desktopMinHeight = 600.0;
