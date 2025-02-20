// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/screen_type.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';
import 'package:my_precious_homepage/service_locator.dart';

class BlockForTitle extends StatelessWidget with GetItMixin {
  BlockForTitle({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    watchX<UiModelControllerMixin, ScreenType?>(
        (model) => (model as UiModelMixin).screenTypeNotifier);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: uiLocator.uiModel.pageBlockMaxWidth,
        minWidth: uiLocator.uiModel.pageBlockMaxWidth,
      ),
      child: child,
    );
  }
}
