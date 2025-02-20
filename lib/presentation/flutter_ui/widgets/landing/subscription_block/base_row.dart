import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';

class SubscriptionBaseRow extends StatelessWidget {
  const SubscriptionBaseRow({
    super.key,
    required this.leftChild,
    required this.rightChild,
  });

  final Widget leftChild;
  final Widget rightChild;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: paddingSmaller,
            ),
            child: leftChild,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: paddingSmaller,
            ),
            child: rightChild,
          ),
        ),
      ],
    );
  }
}
