// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/screen_type.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/mini_text.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/center_column.dart';
import 'package:my_precious_homepage/service_locator.dart';

class SubscriptionDetailEmpty extends StatelessWidget {
  const SubscriptionDetailEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return CenterColumn(
      children: [
        _SubscriptionEmptyIcon(),
        const SizedBox(height: paddingMicro),
        MiniText(
          "-",
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ],
    );
  }
}

class _SubscriptionEmptyIcon extends StatelessWidget with GetItMixin {
  _SubscriptionEmptyIcon();

  @override
  Widget build(BuildContext context) {
    watchX<UiModelControllerMixin, ScreenType?>(
        (model) => (model as UiModelMixin).screenTypeNotifier);

    return SizedBox(height: uiLocator.uiModel.subscriptionIconSize);
  }
}
