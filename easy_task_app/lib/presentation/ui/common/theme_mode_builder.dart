import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/theme/app_theme_bloc.dart';
import '../../bloc/theme/app_theme_state.dart';

class ThemeModeBuilder extends StatelessWidget {
  const ThemeModeBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(AppThemeState) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return builder(state);
      },
    );
  }
}
