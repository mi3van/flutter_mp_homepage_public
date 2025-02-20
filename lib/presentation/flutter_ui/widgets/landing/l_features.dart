import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/assets.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/block_type/container.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/features_block/divider_text.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/features_block/text.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/features_block/text_title.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/features_block/text_underline.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/large_header.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/center_column.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/page_max_width_padding.dart';
import 'package:my_precious_homepage/service_locator.dart';

class LandingFeaturesTilte extends StatelessWidget {
  const LandingFeaturesTilte({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: appPageVertPadding),
      child: PageMaxWidthWithPadding(
        topPadding: 0.0,
        child: LargeHeader(
          uiLocator.localesController.getAppLocale(context).titleAppFeatures,
        ),
      ),
    );
  }
}

class LandingFeaturesForWhatAndHowTo extends StatelessWidget {
  const LandingFeaturesForWhatAndHowTo({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);

    return _BaseLandingFeatures(
      firstFeature: BlockContainerPadding(
        child: CenterColumn(
          children: [
            FeaturesTextTitle(
              locale.appFeaturesCardForWhatTitle,
            ),
            const FeaturesDividerText(),
            FeaturesText(
              locale.appFeaturesCardForWhatDescriptionPart1,
            ),
            const FeaturesDividerText(),
            FeaturesText(
              locale.appFeaturesCardForWhatDescriptionPart2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
      secondFeature: BlockContainerCustomPadding(
        padding: EdgeInsets.fromLTRB(
          paddingHuge,
          paddingHuge,
          paddingHuge,
          paddingSmall,
        ),
        child: CenterColumn(
          children: [
            FeaturesTextTitle(
              locale.appFeaturesCardHowToTitle,
            ),
            const FeaturesDividerText(),
            FeaturesText(
              locale.appFeaturesCardHowToDescription,
            ),
            const SizedBox(height: paddingSmaller),
            SizedBox(
              height: elementHeightBig,
              child: Image.asset(
                Assets.imgPathCircles.link,
                // cacheHeight: _featuresImgCache,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LandingFeaturesCloudAndPrint extends StatelessWidget {
  const LandingFeaturesCloudAndPrint({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);
    final theme = Theme.of(context);

    return _BaseLandingFeatures(
      firstFeature: BlockContainerPadding(
        child: CenterColumn(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: paddingRegular,
              runSpacing: paddingRegular,
              children: [
                Icon(
                  Icons.cloud_done_rounded,
                  size: 36.0,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                FeaturesTextTitle(
                  locale.appFeaturesCardSynchronizationTitle,
                ),
              ],
            ),
            const FeaturesDividerText(),
            FeaturesText(
              locale.appFeaturesCardSynchronizationDescription,
            ),
            const FeaturesDividerText(),
            GestureDetector(
              onTap: uiLocator.appController.onCasaPdfClick,
              child: FeaturesTextUnderline(
                locale.titlePdfCertificate,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      secondFeature: BlockContainerPadding(
        child: CenterColumn(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: paddingRegular,
              runSpacing: paddingRegular,
              children: [
                FeaturesTextTitle(
                  locale.appFeaturesCardPrintAndScanTitle,
                ),
                Icon(
                  Icons.print_rounded,
                  size: elementHeightRegular,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ],
            ),
            const FeaturesDividerText(),
            FeaturesText(
              locale.appFeaturesCardPrintAndScanDescriptionPart1,
            ),
            const FeaturesDividerText(),
            FeaturesText(
              locale.appFeaturesCardPrintAndScanDescriptionPart2,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class LandingFeaturesOfflineAndSecure extends StatelessWidget {
  const LandingFeaturesOfflineAndSecure({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);
    final theme = Theme.of(context);

    return _BaseLandingFeatures(
      firstFeature: BlockContainerPadding(
        child: CenterColumn(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: paddingRegular,
              runSpacing: paddingRegular,
              children: [
                FeaturesTextTitle(
                  locale.appFeaturesCardOfflineWorkTitle,
                ),
                Transform.rotate(
                  angle: pi / 4,
                  child: Icon(
                    Icons.airplanemode_active_rounded,
                    size: elementIconSizeBig,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const FeaturesDividerText(),
            FeaturesText(
              locale.appFeaturesCardOfflineWorkDescription,
            ),
          ],
        ),
      ),
      secondFeature: BlockContainerPadding(
        child: CenterColumn(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: paddingRegular,
              runSpacing: paddingRegular,
              children: [
                Icon(
                  Icons.lock_rounded,
                  size: elementHeightSmall,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                FeaturesTextTitle(
                  locale.appFeaturesCardConfidentialTitle,
                ),
              ],
            ),
            const FeaturesDividerText(),
            FeaturesText(
              locale.appFeaturesCardConfidentialDescription,
            ),
          ],
        ),
      ),
    );
  }
}

class _BaseLandingFeatures extends StatelessWidget {
  final Widget _firstFeature;
  final Widget _secondFeature;

  const _BaseLandingFeatures({
    required Widget firstFeature,
    required Widget secondFeature,
  })  : _secondFeature = secondFeature,
        _firstFeature = firstFeature;

  @override
  Widget build(BuildContext context) {
    return PageMaxWidthWithPadding(
      topPadding: 0.0,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: appBlockSpacing,
        runSpacing: appBlockSpacing,
        children: [
          _firstFeature,
          _secondFeature,
        ],
      ),
    );
  }
}

class LandingFeaturesMadeFor extends StatelessWidget {
  const LandingFeaturesMadeFor({super.key});

  @override
  Widget build(BuildContext context) {
    return PageMaxWidthWithPadding(
      topPadding: 0.0,
      child: SizedBox(
        width: double.infinity,
        child: FeaturesText(
          uiLocator.localesController
              .getAppLocale(context)
              .appFeaturesEndOurMissionTitle,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
