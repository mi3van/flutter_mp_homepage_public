import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/common/entity/enum/assets.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/large_header.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/page_max_width_padding.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/tooltip.dart';
import 'package:my_precious_homepage/service_locator.dart';

class LandingAppSourcesTilte extends StatelessWidget {
  const LandingAppSourcesTilte({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: appPageVertPadding),
      child: PageMaxWidthWithPadding(
        topPadding: 0.0,
        bottomPadding: 0.0,
        child: LargeHeader(
          uiLocator.localesController
              .getAppLocale(context)
              .titleOfficialAppSources,
        ),
      ),
    );
  }
}

class LandingAppSources extends StatelessWidget {
  const LandingAppSources({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);

    return PageMaxWidthWithPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: paddingRegular,
            runSpacing: paddingRegular,
            children: [
              ...uiLocator.uiModel.uiByLocale.additionalBadges(
                context,
              ),
              BadgeButton(
                assetLink: Assets.imgBadgeGooglePlay.link,
                onTap: uiLocator.appController.onGoogleStoreClick,
              ),
              PreciousTooltip(
                message: locale.syncUnavailableYet,
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    BadgeButton(
                      assetLink: Assets.imgBadgeAppGallery.link,
                      onTap: uiLocator.appController.onHuaweiStoreClick,
                    ),
                    IgnorePointer(
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: paddingSmaller,
                          vertical: paddingMicro,
                        ),
                        child: Icon(
                          Icons.cloud_off_rounded,
                          size: elementIconSizeRegular,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BadgeButton extends StatelessWidget {
  const BadgeButton({
    super.key,
    required this.assetLink,
    this.onTap,
  });

  final String assetLink;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(paddingSmaller),
        child: Stack(
          children: [
            SizedBox(
              height: appLinkBadgeHeight,
              child: Image.asset(assetLink),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      width: 1.8,
                    ),
                    borderRadius: BorderRadius.circular(paddingSmaller),
                  ),
                  child: InkWell(onTap: onTap),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
