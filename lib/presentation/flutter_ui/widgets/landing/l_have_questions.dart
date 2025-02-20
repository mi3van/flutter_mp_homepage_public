import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/large_header.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/medium_header.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/landing/medium_header_underline.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/page_max_width_padding.dart';
import 'package:my_precious_homepage/service_locator.dart';

class LandingHaveQuestions extends StatelessWidget {
  const LandingHaveQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = uiLocator.localesController.getAppLocale(context);

    return PageMaxWidthWithPadding(
      child: Wrap(
        spacing: paddingRegular,
        runSpacing: paddingRegular,
        children: [
          LargeHeader(
            locale.titleHaveQuestions,
          ),
          GestureDetector(
            onTap: uiLocator.appController.onEmailClick,
            onLongPress: () {
              uiLocator.appController.onEmailLongClick();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(locale.emailCopied),
                  duration: snackBarDurationFast,
                ),
              );
            },
            child: HeaderMediumUnderline(
              appSupportEmail,
              color: theme.colorScheme.primary,
            ),
          ),
          HeaderMedium(
            locale.haveQuestionsLinkTitle,
          ),
          GestureDetector(
            onTap: uiLocator.appController.onArticleClick,
            child: HeaderMediumUnderline(
              locale.haveQuestionsTextOfLinkItself,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
