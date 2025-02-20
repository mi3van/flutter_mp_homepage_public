import 'package:my_precious_homepage/presentation/contract/service_locator/controller/app_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/locales_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/controller/app_controller.dart';
import 'package:my_precious_homepage/presentation/controller/locales_controller.dart';
import 'package:my_precious_homepage/presentation/controller/settings_controller.dart';
import 'package:my_precious_homepage/presentation/controller/ui_controller.dart';

abstract class ControllerFactory {
  static AppControllerMixin get appController => AppController();
  static LocalesControllerMixin get localesController => LocalesController();
  static SettingsModelControllerMixin get settingsController =>
      SettingsController();
  static UiModelControllerMixin get uiController => UiController();
}
