// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious_homepage/presentation/common/theme/theme_palette.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/dropdown_text.dart';
import 'package:my_precious_homepage/service_locator.dart';

class LanguageDropdown extends StatelessWidget with GetItMixin {
  LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCode = watchX((SettingsModelControllerMixin model) =>
        (model as SettingsModelMixin).localeCodeNotifier);

    return SizedBox(
      height: heightWebToolbar,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: paddingSmaller),
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              menuMaxHeight: appPageBlockMaxWidthDesktop,
              value: localeCode,
              items: _languageMenuItems,
              onChanged: uiLocator.settingsController.updateLocalizationCode,
              elevation: menuElevation,
              borderRadius: BorderRadius.circular(borderRadiusSmall),
              icon: const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.arrow_drop_down_rounded,
                  size: elementIconSizeMini,
                ),
              ),
              iconEnabledColor: ThemePalette.of(context).secondary[60],
              focusColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}

final _languageMenuItems = localesInfo.entries
    .map((entry) => DropdownMenuItem(
          value: entry.key,
          child: DropdownText(
            lclInfo: entry.value,
          ),
        ))
    .toList();
