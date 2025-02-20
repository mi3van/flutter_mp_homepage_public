import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/for_my_precious/mp_divider.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/l_app_sources.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/l_donations_info.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/l_features.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/l_have_questions.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/l_introduction.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/l_whats_done.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/subscription_block/divider.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/toolbar/btm_toolbar.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/toolbar/landing_top_toolbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        body: ListView(
          children: const [
            LandingTopToolbar(),
            MpDivider(),
            LandingIntroduction(),
            LandingFeaturesTilte(),
            LandingFeaturesForWhatAndHowTo(),
            LandingFeaturesCloudAndPrint(),
            LandingFeaturesOfflineAndSecure(),
            LandingFeaturesMadeFor(),
            LandingAppSourcesTilte(),
            LandingAppSources(),
            LandingDonationsInfoTilte(),
            LandingDonationsInfo(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingRegular),
              child: SubscriptionDivider(),
            ),
            LandingWhatsDone(),
            LandingHaveQuestions(),
            MpDivider(),
            BottomToolbar(),
          ],
        ),
      ),
    );
  }
}
