import 'package:flutter/widgets.dart';
import 'package:my_precious_homepage/presentation/contract/common/init_dispose_mixin.dart';

mixin AppControllerMixin
    implements
        _AppControllerAdditionalMixin,
        DisposeMixin,
        _OneTimeDonationsMixin {
  Future<void> onAppInitSync();
}

mixin _AppControllerAdditionalMixin {
  Future<void> onEmailClick();
  Future<void> onEmailLongClick();
  Future<void> onArticleClick();
  Future<void> onCasaPdfClick();

  Future<void> onGoogleStoreClick();
  Future<void> onRuStoreClick();
  Future<void> onHuaweiStoreClick();

  void onBackClick(BuildContext context);
  Future<void> onPrivacyPageClick(BuildContext context);

  Future<void> onGDPRClick();
  Future<void> onCOPPAClick();
  Future<void> onCookiesClick();
  Future<void> onGoogleServicesClick();
  Future<void> onGoogleUserApiScopesClick();
}

mixin _OneTimeDonationsMixin {
  Future<void> oneTimeBoosty();
  Future<void> oneTimeBankCard();
  Future<void> oneTimeCryptoTRC20();
  Future<void> oneTimeCryptoERC20();
  Future<void> oneTimeCryptoBTC();
  Future<void> oneTimeCryptoTON();
}
