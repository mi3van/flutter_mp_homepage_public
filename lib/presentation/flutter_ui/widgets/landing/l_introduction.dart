import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/assets.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/block_type/container.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/block_type/for_title.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/title_block/description.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/title_block/title.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/page_max_width_padding.dart';
import 'package:my_precious_homepage/service_locator.dart';

class LandingIntroduction extends StatelessWidget {
  const LandingIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);
    final theme = Theme.of(context);

    return PageMaxWidthWithPadding(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: appBlockSpacing,
        runSpacing: appBlockSpacing,
        children: [
          BlockForTitle(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleBlockTitle(
                  locale.titleMainPart1,
                ),
                TitleBlockTitle(
                  locale.titleMainPart2,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: appBlockSpacing),
                TitleBlockDescription(
                  locale.descriptionMain,
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: appTitleImageBlockHeight,
              minHeight: appTitleImageBlockHeight,
            ),
            child: BlockContainerZeroPadding(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  appTitleImageBlockPadding,
                  appTitleImageBlockPadding,
                  appTitleImageBlockPadding,
                  0,
                ),
                child: SizedBox(
                  height: appTitleImageHeight,
                  child: Image.asset(
                    Assets.imgAppScreen.link,
                    // cacheHeight: appTitleImageCacheHeight,
                    // cacheWidth: appTitleImageCacheWidth,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
