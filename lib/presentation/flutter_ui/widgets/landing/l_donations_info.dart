import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/controller/ui_controller.dart'
    show UiController;
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/features_block/text.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/large_header.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/subscription_block/collect_amount_widget.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/subscription_block/details.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/subscription_block/title.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/page_max_width_padding.dart';
import 'package:my_precious_homepage/service_locator.dart';

class LandingDonationsInfoTilte extends StatelessWidget {
  const LandingDonationsInfoTilte({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);

    return Padding(
      padding: const EdgeInsets.only(top: appPageVertPadding),
      child: PageMaxWidthWithPadding(
        topPadding: 0.0,
        bottomPadding: 0.0,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: appBlockSpacing,
          runSpacing: appBlockSpacing,
          children: [
            LargeHeader(
              uiLocator.localesController
                  .getAppLocale(context)
                  .supportProjectTitle,
            ),
            FeaturesText(
              locale.premiumPageDescription,
              color: Theme.of(context).colorScheme.outline,
            ),
            CollectAmountWidget(),
          ],
        ),
      ),
    );
  }
}

class LandingDonationsInfo extends StatelessWidget {
  const LandingDonationsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);

    return PageMaxWidthWithPadding(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: appBlockSpacing,
        runSpacing: appBlockSpacing,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: paddingSmaller),
            child: DonationsTitle(
              locale.premiumPageOneTimeDonateTitle,
            ),
          ),
          ...uiLocator.uiModel.uiByLocale.additionalDonationWidgets(
            context,
          ),
          DonationsDetails(
              iconData: Icons.monetization_on_outlined,
              detailTitle: cryptoTRC20Title,
              detailDescription: locale.clickToCopyTitle,
              onTap: () {
                uiLocator.appController.oneTimeCryptoTRC20();
                UiController.showValueCopied(context, cryptoTRC20Title);
              }),
          DonationsDetails(
              iconData: Icons.monetization_on_sharp,
              detailTitle: cryptoERC20Title,
              detailDescription: locale.clickToCopyTitle,
              onTap: () {
                uiLocator.appController.oneTimeCryptoERC20();
                UiController.showValueCopied(context, cryptoERC20Title);
              }),
          DonationsDetails(
              iconData: Icons.currency_bitcoin_rounded,
              detailTitle: cryptoBitcoinTitle,
              detailDescription: locale.clickToCopyTitle,
              onTap: () {
                uiLocator.appController.oneTimeCryptoBTC();
                UiController.showValueCopied(context, cryptoBitcoinTitle);
              }),
          DonationsDetails(
              iconData: Icons.details_rounded,
              detailTitle: cryptoTonTitle,
              detailDescription: locale.clickToCopyTitle,
              onTap: () {
                uiLocator.appController.oneTimeCryptoTON();
                UiController.showValueCopied(context, cryptoTonTitle);
              }),
        ],
      ),
    );
  }
}
