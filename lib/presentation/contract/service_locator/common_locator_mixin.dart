import 'dart:ui';

import 'package:my_precious_homepage/presentation/contract/common/init_dispose_mixin.dart';

mixin CommonLocatorMixin {
  bool get isDebugMode;
  List<Locale> get supportLocales;
  Set<InitsAsyncMixin> get necessaryInitsInScope;
  Set<DisposeMixin> get disposablesInScope;
}
