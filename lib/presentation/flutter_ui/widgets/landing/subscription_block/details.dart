// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/screen_type.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/ui_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/block_type/for_title.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/medium_bold_header.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/mini_text_left.dart';
import 'package:my_precious_homepage/service_locator.dart';

class DonationsDetails extends StatelessWidget {
  const DonationsDetails({
    super.key,
    required this.iconData,
    required this.detailTitle,
    this.detailDescription,
    this.onTap,
  });

  final IconData iconData;
  final String detailTitle;
  final String? detailDescription;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlockForTitle(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadiusBig),
        child: Padding(
          padding: const EdgeInsets.all(paddingRegular),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SubscriptionIcon(iconData: iconData),
              const SizedBox(width: paddingSmall),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderBoldMedium(
                      detailTitle,
                    ),
                    const SizedBox(height: paddingSmaller),
                    if (detailDescription != null)
                      MiniTextLeft(
                        detailDescription!,
                        color: theme.colorScheme.outline,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubscriptionIcon extends StatelessWidget with GetItMixin {
  _SubscriptionIcon({
    required this.iconData,
  });

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    watchX<UiModelControllerMixin, ScreenType?>(
        (model) => (model as UiModelMixin).screenTypeNotifier);

    return Icon(
      iconData,
      size: uiLocator.uiModel.subscriptionIconSize,
    );
  }
}
