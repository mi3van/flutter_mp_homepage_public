import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/page_max_width.dart';
import 'package:my_precious_homepage/service_locator.dart';

class BottomToolbar extends StatelessWidget {
  const BottomToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = uiLocator.localesController.getAppLocale(context);

    return PageMaxWidth(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: heightWebToolbar),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: paddingRegular,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: paddingRegular),
              child: Text(
                locale.titleAppRights(currentYear),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: paddingSmall),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SelectionContainer.disabled(
                  child: GestureDetector(
                    onTap: () =>
                        uiLocator.appController.onPrivacyPageClick(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: paddingMicro,
                      ),
                      child: Text(
                        locale.privacyPolicyTextOfLinkItself,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
