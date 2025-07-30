import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/theme/app_theme_bloc.dart';
import '../../bloc/theme/app_theme_event.dart';
import '../../constants/image_constants.dart';
import '../../navigation/app_navigator.dart';
import 'theme_mode_builder.dart';

class CommonTopMenu extends StatelessWidget {
  const CommonTopMenu({
    super.key,
    required this.username,
    required this.onLogoutPressed,
  });

  final String username;
  final void Function() onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: Spacing.medium,
            children: [
              Flexible(
                child: CustomSvgImage(
                  assetName: SvgConstants.expandedLogo,
                  height: kTextTabBarHeight * 0.6,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: Spacing.small,
                  children: [
                    Flexible(
                      child: ThemeModeBuilder(
                        builder: (state) => IconButton.filledTonal(
                          onPressed: () => context.read<AppThemeBloc>().add(
                            const SwitchThemeMode(),
                          ),
                          icon: Icon(state.icon),
                          tooltip: 'Toggle theme (${state.displayName})',
                          iconSize: IconSize.small,
                        ),
                      ),
                    ),
                    Flexible(
                      child: IconButton.filledTonal(
                        onPressed: context.navigateToCategoriesPage,
                        icon: const Icon(Icons.style),
                        iconSize: IconSize.small,
                      ),
                    ),
                    Flexible(
                      child: IconButton.filledTonal(
                        onPressed: onLogoutPressed,
                        icon: const Icon(Icons.logout),
                        iconSize: IconSize.small,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
