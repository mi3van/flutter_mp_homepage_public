import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/controller/privacy_data.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/for_my_precious/mp_divider.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/page_max_width.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/toolbar/privacy_top_toolbar.dart';
import 'package:my_precious_homepage/service_locator.dart';

const _chapterTextAlign = TextAlign.center;
const _titleTextAlign = TextAlign.left;
const _textTextAlign = TextAlign.justify;

const _textIndent = WidgetSpan(child: SizedBox(width: paddingHuge));

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  static const route = '/privacy';
  static const _toolbarHeight = heightWebToolbar + 1;

  @override
  Widget build(BuildContext context) {
    final locale = uiLocator.localesController.getAppLocale(context);
    final theme = Theme.of(context);

    final chapterStyle = theme.textTheme.headlineMedium;
    final titleStyle = theme.textTheme.headlineSmall;
    final textStyle = theme.textTheme.bodyLarge?.copyWith();
    final linkStyle = textStyle?.copyWith(
        color: theme.primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: theme.primaryColor);

    return SelectionArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(
              _toolbarHeight,
            ), // here the desired height
            child: Column(
              children: [
                PrivacyTopToolbar(),
                MpDivider(),
              ],
            )),
        body: ListView(
          children: [
            PageMaxWidth(
                child: _PolicyChapter(
              PrivacyData.summaryTitle,
              style: chapterStyle,
            )),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.summaryDescription,
                style: textStyle,
              ),
            ])),

            // Policy block.
            PageMaxWidth(
                child: _PolicyChapter(
              PrivacyData.policyTitle,
              style: chapterStyle,
            )),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.policyDescriptionP1,
                style: textStyle,
              ),
            ])),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.policyDescriptionP2,
                style: textStyle,
              ),
            ])),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.policyDescriptionP3,
                style: textStyle,
              ),
              TextSpan(
                  text: PrivacyData.policyGdprLinkTitle,
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = uiLocator.appController.onGDPRClick),
              TextSpan(
                text: PrivacyData.policyDescriptionP3_2,
                style: textStyle,
              ),
            ])),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.policyDescriptionP4,
                style: textStyle,
              ),
            ])),

            // Personal data block.
            PageMaxWidth(
                child: _PolicyTitle(
              PrivacyData.personalDataTitle,
              style: titleStyle,
            )),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.personalDataDescription,
                style: textStyle,
              )
            ])),
            // Data storage block.
            PageMaxWidth(
                child: _PolicyTitle(
              PrivacyData.dataStorageTitle,
              style: titleStyle,
            )),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.dataStorageDescriptionP1,
                style: textStyle,
              ),
              TextSpan(
                  text: appSupportEmail,
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = uiLocator.appController.onEmailClick),
              TextSpan(
                text: PrivacyData.dataStorageDescriptionP2,
                style: textStyle,
              ),
            ])),

            // Processing block.
            PageMaxWidth(
                child: _PolicyTitle(
              PrivacyData.processingTitle,
              style: titleStyle,
            )),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.processingDescriptionP1,
                style: textStyle,
              ),
            ])),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.processingDescriptionP2,
                style: textStyle,
              ),
            ])),

            // Children block.
            PageMaxWidth(
              child: _PolicyTitle(PrivacyData.childrenTitle, style: titleStyle),
            ),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.childrenDescriptionP1,
                style: textStyle,
              ),
            ])),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.childrenDescriptionP2,
                style: textStyle,
              ),
              TextSpan(
                  text: PrivacyData.childrenCoppaLinkTitle,
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = uiLocator.appController.onCOPPAClick),
              TextSpan(
                text: PrivacyData.childrenDescriptionP2_2,
                style: textStyle,
              ),
            ])),

            // Cookies block.
            PageMaxWidth(
              child: _PolicyTitle(PrivacyData.cookiesTitle, style: titleStyle),
            ),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.cookiesDescriptionP1,
                style: textStyle,
              ),
            ])),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.cookiesDescriptionP2,
                style: textStyle,
              ),
              TextSpan(
                  text: PrivacyData.cookiesLinkTitle,
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = uiLocator.appController.onCookiesClick),
              TextSpan(
                text: PrivacyData.cookiesDescriptionP2_2,
                style: textStyle,
              ),
            ])),

            // Log data block.
            PageMaxWidth(
              child: _PolicyTitle(PrivacyData.logDataTitle, style: titleStyle),
            ),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.logDataDescription,
                style: textStyle,
              ),
            ])),

            // Services block.
            PageMaxWidth(
              child: _PolicyTitle(PrivacyData.servicesTitle, style: titleStyle),
            ),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.servicesDescriptionP1,
                style: textStyle,
              ),
            ])),
            const SizedBox(height: paddingSmall),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.servicesDescriptionP2,
                style: textStyle,
              ),
              TextSpan(
                  text: PrivacyData.servicesGoogleLinkTitle,
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = uiLocator.appController.onGoogleServicesClick),
              TextSpan(
                text: PrivacyData.servicesDescriptionP2_2,
                style: textStyle,
              ),
            ])),
            const SizedBox(height: paddingSmall),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.servicesDescriptionP3,
                style: textStyle,
              ),
            ])),

            // Comply with services block.
            PageMaxWidth(
              child: _PolicyTitle(
                PrivacyData.complyWithServicesTitle,
                style: titleStyle,
              ),
            ),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.complyWithServicesDescriptionP1,
                style: textStyle,
              ),
              TextSpan(
                text: PrivacyData.complyWithServicesGoogleLinkTitle,
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = uiLocator.appController.onGoogleUserApiScopesClick,
              ),
              TextSpan(
                text: PrivacyData.complyWithServicesDescriptionP2,
                style: textStyle,
              ),
            ])),

            // Links block.
            PageMaxWidth(
              child: _PolicyTitle(PrivacyData.linksTitle, style: titleStyle),
            ),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(text: PrivacyData.linksDescription, style: textStyle),
            ])),

            // Security block.
            PageMaxWidth(
              child: _PolicyTitle(PrivacyData.securityTitle, style: titleStyle),
            ),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(text: PrivacyData.securityDescription, style: textStyle),
            ])),

            // Changes block.
            PageMaxWidth(
              child: _PolicyTitle(PrivacyData.changesTitle, style: titleStyle),
            ),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(text: PrivacyData.changesDescription, style: textStyle),
            ])),

            // Contacts block.
            PageMaxWidth(
              child: _PolicyTitle(PrivacyData.contactsTitle, style: titleStyle),
            ),
            PageMaxWidth(
                child: _PolicyRichText([
              _textIndent,
              TextSpan(
                text: PrivacyData.contactsDescriptionP1,
                style: textStyle,
              ),
              TextSpan(
                  text: appSupportEmail,
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = uiLocator.appController.onEmailClick),
              TextSpan(
                text: PrivacyData.contactsDescriptionP1_1,
                style: textStyle,
              ),
            ])),
            const SizedBox(height: paddingHuge),
            PageMaxWidth(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  PrivacyData.getFormattedOnUpdatedTitle(locale),
                  style: textStyle?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const SizedBox(height: paddingHuge),
          ],
        ),
      ),
    );
  }
}

class _PolicyChapter extends StatelessWidget {
  const _PolicyChapter(this.text, {required this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: paddingBig),
        child: Text(text, style: style, textAlign: _chapterTextAlign),
      ),
    );
  }
}

class _PolicyTitle extends StatelessWidget {
  const _PolicyTitle(this.text, {required this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: paddingBig),
      child: Text(text, style: style, textAlign: _titleTextAlign),
    );
  }
}

class _PolicyRichText extends StatelessWidget {
  const _PolicyRichText(this.spans);

  final List<InlineSpan> spans;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: paddingSmaller),
      child: Text.rich(
        TextSpan(children: spans),
        textAlign: _textTextAlign,
      ),
    );
  }
}
