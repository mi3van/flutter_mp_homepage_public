import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/common/init_dispose_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/common_locator_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/app_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/locales_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/settings_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/ui_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/ui_service_locator_mixin.dart';
import 'package:my_precious_homepage/presentation/controller/controller_factory.dart';

GetIt _sl = GetIt.instance;

final UiServiceLocatorMixin uiLocator = UiLocator();

void initServiceLocator() {
  /// Register app-controllers for basic model-control.
  _sl.registerLazySingleton(() => ControllerFactory.appController);
  _sl.registerLazySingleton(() => ControllerFactory.localesController);
  _sl.registerLazySingleton(() => ControllerFactory.settingsController);
  _sl.registerLazySingleton(() => ControllerFactory.uiController);
}

class UiLocator extends MainHolder implements UiServiceLocatorMixin {}

abstract class MainHolder
    implements ModelHolderMixin, ControllerHolderMixin, CommonLocatorMixin {
  @override
  Set<InitDisposeMixin> get necessaryInitsInScope => {settingsMC};

  @override
  Set<DisposeMixin> get disposablesInScope => necessaryInitsInScope;

  AppControllerMixin get appMC => _sl();
  LocalesControllerMixin get localeC => _sl();
  SettingsModelControllerMixin get settingsMC => _sl();
  UiModelControllerMixin get uiMC => _sl();

  // Controllers
  @override
  AppControllerMixin get appController => appMC;
  @override
  SettingsControllerMixin get settingsController => settingsMC;
  @override
  LocalesControllerMixin get localesController => localeC;
  @override
  UiControllerMixin get uiController => uiMC;

  // Models
  @override
  SettingsModelMixin get settingsModel => settingsMC;
  @override
  UiModelMixin get uiModel => uiMC;

  // Common part
  @override
  bool get isDebugMode => kDebugMode;
  @override
  List<Locale> get supportLocales => appSupportLocales;
}
