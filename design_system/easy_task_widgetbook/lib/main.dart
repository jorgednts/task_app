import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';
import 'package:widgetbook/widgetbook.dart';

import 'src/components.dart';

void main() {
  runApp(const WidgetBookMarvel());
}

class WidgetBookMarvel extends StatelessWidget {
  const WidgetBookMarvel({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: CustomTheme.fromContext(context).light(),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: CustomTheme.fromContext(context).dark(),
            ),
          ],
        ),
        LocalizationAddon(
          locales: AppIntl.delegate.supportedLocales,
          localizationsDelegates: const [
            AppIntl.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
        ViewportAddon([
          Viewports.none,
          IosViewports.iPhone13,
          AndroidViewports.mediumTablet,
          AndroidViewports.samsungGalaxyS20,
          MacosViewports.macbookPro,
          WindowsViewports.desktop,
          LinuxViewports.desktop,
        ]),
      ],
      directories: [
        CustomMessageCardComponent(),
        CustomDropdownButtonComponent(),
        CustomDatePickerComponent(),
        StyledTextComponent(),
        BreakpointDoubleSplitViewComponent(),
      ],
    );
  }
}
