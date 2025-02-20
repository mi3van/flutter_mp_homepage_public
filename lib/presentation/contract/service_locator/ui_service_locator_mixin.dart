import 'package:my_precious_homepage/presentation/contract/service_locator/common_locator_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/app_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/locales_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/settings_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/ui_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';

mixin UiServiceLocatorMixin
    on ControllerHolderMixin, ModelHolderMixin, CommonLocatorMixin {}

mixin ControllerHolderMixin {
  AppControllerMixin get appController;
  LocalesControllerMixin get localesController;
  SettingsControllerMixin get settingsController;
  UiControllerMixin get uiController;
}

mixin ModelHolderMixin {
  SettingsModelMixin get settingsModel;
  UiModelMixin get uiModel;
}
