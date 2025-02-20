import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/features_block/text_title.dart';

class DonationsTitle extends StatelessWidget {
  const DonationsTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FeaturesTextTitle(
        text,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
