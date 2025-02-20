import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/contract/common/init_dispose_mixin.dart';
import 'package:my_precious_homepage/presentation/contract/service_locator/controller/app_controller_mixin.dart';
import 'package:my_precious_homepage/presentation/controller/const.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/pages/privacy_policy_page.dart';
import 'package:my_precious_homepage/service_locator.dart';
import 'package:url_launcher/url_launcher_string.dart' as url_lib;

class AppController implements AppControllerMixin {
  @override
  Future<void> onAppInitSync() async {
    await Future.forEach<InitsAsyncMixin>(
      uiLocator.necessaryInitsInScope,
      (initializable) => initializable.onInit(),
    );
  }

  @override
  void cleanValues() {
    for (var cleanables in uiLocator.disposablesInScope) {
      cleanables.cleanValues();
    }
  }

  @override
  void onDispose() {
    for (var disposable in uiLocator.disposablesInScope) {
      disposable.onDispose();
    }
  }

  @override
  Future<void> onEmailClick() => _launchUrlString('mailto:$appSupportEmail');

  @override
  Future<void> onEmailLongClick() async {
    await Clipboard.setData(const ClipboardData(text: appSupportEmail));
  }

  @override
  Future<void> onArticleClick() => _launchUrlString(appArticleLink);

  @override
  Future<void> onCasaPdfClick() => _launchUrlString(casaPdfLink);

  @override
  Future<void> onGoogleStoreClick() => _launchUrlString(appGoogleLink);

  @override
  Future<void> onRuStoreClick() => _launchUrlString(ruStoreLink);

  @override
  Future<void> onHuaweiStoreClick() => _launchUrlString(appHuaweiLink);

  @override
  Future<void> onPrivacyPageClick(context) async {
    await Navigator.pushNamed(context, PrivacyPolicyPage.route);
  }

  @override
  void onBackClick(BuildContext context) => Navigator.pop(context);

  @override
  Future<void> onGDPRClick() => _launchUrlString(gdprLink);

  @override
  Future<void> onCOPPAClick() => _launchUrlString(coppaLink);

  @override
  Future<void> onCookiesClick() => _launchUrlString(cookieLink);

  @override
  Future<void> onGoogleServicesClick() => _launchUrlString(googleServicesLink);

  @override
  Future<void> onGoogleUserApiScopesClick() => _launchUrlString(
        googleUserApiScopesLink,
      );

  @override
  Future<void> oneTimeBoosty() => _launchUrlString(donateBoostyLink);

  @override
  Future<void> oneTimeBankCard() => _setClipboardData(donateTBankCardNumber);

  @override
  Future<void> oneTimeCryptoTRC20() => _setClipboardData(donateTrc20Address);

  @override
  Future<void> oneTimeCryptoERC20() => _setClipboardData(donateErc20Address);

  @override
  Future<void> oneTimeCryptoBTC() => _setClipboardData(donateBtcAddress);

  @override
  Future<void> oneTimeCryptoTON() => _setClipboardData(donateTonAddress);
}

Future<void> _launchUrlString(String urlString) async {
  await url_lib.launchUrlString(urlString);
}

Future<void> _setClipboardData(String data) async {
  await Clipboard.setData(ClipboardData(text: data));
}
