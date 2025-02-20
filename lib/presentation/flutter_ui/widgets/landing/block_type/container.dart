// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/screen_type.dart';
import 'package:my_precious_homepage/presentation/common/theme/theme_palette.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';
import 'package:my_precious_homepage/service_locator.dart';

class BlockContainerPadding extends BaseBlockContainer {
  BlockContainerPadding({super.key, required super.child})
      : super(padding: const EdgeInsets.all(paddingHuge), clip: Clip.none);
}

class BlockContainerZeroPadding extends BaseBlockContainer {
  BlockContainerZeroPadding({super.key, required super.child})
      : super(padding: EdgeInsets.zero, clip: Clip.antiAlias);
}

class BlockContainerCustomPadding extends BaseBlockContainer {
  BlockContainerCustomPadding(
      {super.key, required super.child, required super.padding})
      : super(clip: Clip.none);
}

abstract class BaseBlockContainer extends StatelessWidget with GetItMixin {
  BaseBlockContainer({
    super.key,
    required this.child,
    required this.padding,
    required this.clip,
  });

  final Widget child;
  final EdgeInsets padding;
  final Clip clip;

  @override
  Widget build(BuildContext context) {
    watchX<UiModelControllerMixin, ScreenType?>(
        (model) => (model as UiModelMixin).screenTypeNotifier);

    return Container(
      constraints: BoxConstraints(
        maxWidth: uiLocator.uiModel.pageBlockMaxWidth,
        minWidth: uiLocator.uiModel.pageBlockMaxWidth,
      ),
      clipBehavior: clip,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusHuge),
        color: ThemePalette.of(context).surface[1],
      ),
      padding: padding,
      child: child,
    );
  }
}
