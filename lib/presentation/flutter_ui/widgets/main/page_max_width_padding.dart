import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';

class PageMaxWidthWithPadding extends StatelessWidget {
  const PageMaxWidthWithPadding({
    super.key,
    required this.child,
    this.topPadding = appPageVertPadding,
    this.bottomPadding = appPageVertPadding,
  });

  final Widget child;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          appPageHorizPadding,
          topPadding,
          appPageHorizPadding,
          bottomPadding,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: appMaxWidth,
            minWidth: appMaxWidth,
          ),
          child: child,
        ),
      ),
    );
  }
}
