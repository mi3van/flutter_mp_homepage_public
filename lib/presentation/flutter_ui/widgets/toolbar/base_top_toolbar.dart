import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/common/helper_text.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/page_max_width.dart';
import 'package:my_precious_homepage/service_locator.dart';

class BaseTopToolbar extends StatelessWidget {
  const BaseTopToolbar({
    super.key,
    required this.startWidget,
    required this.toolbarTitle,
    this.endWidget,
  });
  static const childHeight = heightWebToolbar - paddingSmaller - paddingSmaller;

  final Widget startWidget;
  final String toolbarTitle;
  final Widget? endWidget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = uiLocator.localesController.getAppLocale(context);

    final double appIconLeftPadding, appIconRightPadding;
    final TextAlign textAlign;

    if (HelperText.isRtlLocale(Locale(locale.localeName))) {
      textAlign = TextAlign.right;
      appIconLeftPadding = paddingSmaller;
      appIconRightPadding = 0.0;
    } else {
      textAlign = TextAlign.left;
      appIconLeftPadding = 0.0;
      appIconRightPadding = paddingSmaller;
    }
    final appIconPadding = EdgeInsets.fromLTRB(
      appIconLeftPadding,
      paddingSmaller,
      appIconRightPadding,
      paddingSmaller,
    );

    return PageMaxWidth(
      child: Row(
        children: [
          SizedBox(
            height: heightWebToolbar,
            child: Padding(
              padding: appIconPadding,
              child: startWidget,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                toolbarTitle.toUpperCase(),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
                textAlign: textAlign,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          if (endWidget != null) ...[
            const SizedBox(width: paddingMicro),
            endWidget!,
          ],
        ],
      ),
    );
  }
}
