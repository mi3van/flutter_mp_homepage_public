import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/for_my_precious/mp_divider.dart';

class SubscriptionDivider extends StatelessWidget {
  const SubscriptionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingRegular,
        vertical: paddingSmaller,
      ),
      child: MpDivider(),
    );
  }
}
