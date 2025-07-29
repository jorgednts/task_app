import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonAppBar extends AppBar {
  CommonAppBar({
    super.key,
    required this.appThemeMode,
    required this.statusBarColor,
  }) : super(
         toolbarHeight: 0,
         systemOverlayStyle: SystemUiOverlayStyle(
           statusBarIconBrightness: switch (appThemeMode) {
             ThemeMode.system => null,
             ThemeMode.light => Brightness.dark,
             ThemeMode.dark => Brightness.light,
           },
           statusBarColor: statusBarColor,
         ),
       );
  final ThemeMode appThemeMode;
  final Color statusBarColor;
}
