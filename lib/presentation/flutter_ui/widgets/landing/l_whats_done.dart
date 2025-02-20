import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/controller/const.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/subscription_block/details.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/subscription_block/title.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/page_max_width_padding.dart';
import 'package:my_precious_homepage/service_locator.dart';

class LandingWhatsDone extends StatelessWidget {
  const LandingWhatsDone({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);

    return PageMaxWidthWithPadding(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: appBlockSpacing,
        runSpacing: appBlockSpacing,
        children: [
          DonationsTitle(
            locale.premiumPageFeaturesDoneTitle,
          ),
          DonationsDetails(
            iconData: Icons.burst_mode_outlined,
            detailTitle: locale.premiumPageItemsMultiAddingTitle,
            detailDescription: locale.premiumPageItemsMultiAddingDescription(
              maxImagesForGroupPick,
            ),
          ),
          DonationsDetails(
            iconData: Icons.diversity_1_outlined,
            detailTitle: locale.premiumPageAccessSharingTitle,
            detailDescription: locale.premiumPageAccessSharingDescription(
              shareToUsersMaxCount,
            ),
          ),
          DonationsDetails(
            iconData: Icons.qr_code_scanner_rounded,
            detailTitle: locale.premiumPageQrScanTitle,
            detailDescription: locale.premiumPageQrScanDescription,
          ),
          DonationsDetails(
            iconData: Icons.description_outlined,
            detailTitle: locale.premiumPageInvReportTitle,
            detailDescription: locale.premiumPageInvReportDescription,
          ),
          DonationsDetails(
            iconData: Icons.table_chart_outlined,
            detailTitle: locale.premiumPageExportSheetTitle,
            detailDescription: locale.premiumPageExportSheetDescription,
          ),
        ],
      ),
    );
  }
}
