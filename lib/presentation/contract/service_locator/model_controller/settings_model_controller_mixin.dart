import 'package:flutter/foundation.dart';
import 'package:my_precious_homepage/presentation/common/entity/dto/collect_amount.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/theme_type.dart';
import 'package:my_precious_homepage/presentation/contract/common/init_dispose_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/settings_controller_mixin.dart';

mixin SettingsModelControllerMixin
    implements SettingsControllerMixin, SettingsModelMixin, InitDisposeMixin {}

mixin SettingsModelMixin {
  String? get systemLocaleCode;
  ValueNotifier<ThemeType> get themeNotifier;
  ValueNotifier<String> get localeCodeNotifier;
  ValueNotifier<CollectAmount?> get collectAmntNotifier;
}
