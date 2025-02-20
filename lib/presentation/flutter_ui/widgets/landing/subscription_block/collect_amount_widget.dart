import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_precious_homepage/presentation/common/entity/dto/collect_amount.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/model_controller/settings_model_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/common/helper_format.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/subscription_block/amount_text.dart';
import 'package:my_precious_homepage/service_locator.dart';

class CollectAmountWidget extends StatelessWidget with GetItMixin {
  CollectAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);
    final amount = watchX<SettingsModelControllerMixin, CollectAmount?>(
      (model) => model.collectAmntNotifier,
    );
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (amount != null) ...[
        DonationsAmountText(
          locale.premiumPageCurrentAmount(
              amount.current,
              amount.total,
              HelperFormat.getMonthText(
                locale.localeName,
                DateTime(minYearValue, min(amount.month, 12)),
              )),
        ),
        if (amount.current >= amount.total) ...[
          Padding(
            padding: const EdgeInsets.only(top: paddingSmaller),
            child: DonationsAmountText(
              locale.premiumPageAmountCollectedTitle,
            ),
          ),
        ],
      ],
    ]);
  }
}
