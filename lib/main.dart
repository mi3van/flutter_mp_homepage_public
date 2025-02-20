import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_precious_homepage/optional/desktop_init.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/application.dart';
import 'package:my_precious_homepage/service_locator.dart' as sl;

Future<void> main() async {
  BindingBase.debugZoneErrorsAreFatal = true;

  await runZonedGuarded(() async {
    if (!kIsWeb) {
      WidgetsFlutterBinding.ensureInitialized();
      desktopInit();
    }
    sl.initServiceLocator();

    await sl.uiLocator.appController.onAppInitSync();
    runApp(Application());
  }, (error, stack) {
    if (kDebugMode) {
      print(error);
    }
  });
}
