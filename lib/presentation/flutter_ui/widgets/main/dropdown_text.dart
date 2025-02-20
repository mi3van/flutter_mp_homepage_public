import 'package:flutter/material.dart';
import 'package:my_precious_homepage/presentation/common/theme/theme_palette.dart';
import 'package:my_precious_homepage/presentation/config.dart';
import 'package:my_precious_homepage/presentation/flutter_ui/widgets/main/tooltip.dart';
import 'package:my_precious_homepage/service_locator.dart';

class DropdownText extends StatelessWidget {
  const DropdownText({
    super.key,
    required this.lclInfo,
  });

  final LocaleInfo lclInfo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = uiLocator.localesController.getAppLocale(context);

    final color = ThemePalette.of(context).secondary[60];

    return PreciousTooltip(
      key: Key("dropdown_tooltip_${lclInfo.sysName}"),
      message: _getLocalizedTooltip(locale, lclInfo.sysName),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            lclInfo.iconData,
            color: color,
            size: elementIconSizeMini,
          ),
          const SizedBox(width: paddingSmaller),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              lclInfo.displayName,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _getLocalizedTooltip(AppLocale locale, String langName) {
  String tooltip;
  if (langName == LocaleSysNames.auto) {
    tooltip = locale.autoIconToolbar;
  } else if (langName == LocaleSysNames.ar) {
    tooltip = locale.arabIconToolbar;
  } else if (langName == LocaleSysNames.da) {
    tooltip = locale.danIconToolbar;
  } else if (langName == LocaleSysNames.de) {
    tooltip = locale.germIconToolbar;
  } else if (langName == LocaleSysNames.en) {
    tooltip = locale.engIconToolbar;
  } else if (langName == LocaleSysNames.es) {
    tooltip = locale.spanIconToolbar;
  } else if (langName == LocaleSysNames.fi) {
    tooltip = locale.finnIconToolbar;
  } else if (langName == LocaleSysNames.fr) {
    tooltip = locale.frenIconToolbar;
  } else if (langName == LocaleSysNames.hi) {
    tooltip = locale.hinIconToolbar;
  } else if (langName == LocaleSysNames.hu) {
    tooltip = locale.hungIconToolbar;
  } else if (langName == LocaleSysNames.id) {
    tooltip = locale.indoIconToolbar;
  } else if (langName == LocaleSysNames.it) {
    tooltip = locale.itaIconToolbar;
  } else if (langName == LocaleSysNames.ja) {
    tooltip = locale.japIconToolbar;
  } else if (langName == LocaleSysNames.ko) {
    tooltip = locale.korIconToolbar;
  } else if (langName == LocaleSysNames.nl) {
    tooltip = locale.nethIconToolbar;
  } else if (langName == LocaleSysNames.no) {
    tooltip = locale.norvIconToolbar;
  } else if (langName == LocaleSysNames.pt) {
    tooltip = locale.portIconToolbar;
  } else if (langName == LocaleSysNames.ru) {
    tooltip = locale.rusIconToolbar;
  } else if (langName == LocaleSysNames.sv) {
    tooltip = locale.swedIconToolbar;
  } else if (langName == LocaleSysNames.ur) {
    tooltip = locale.urduIconToolbar;
  } else if (langName == LocaleSysNames.zh) {
    tooltip = locale.chinIconToolbar;
  } else {
    tooltip = "";
  }
  return tooltip;
}
