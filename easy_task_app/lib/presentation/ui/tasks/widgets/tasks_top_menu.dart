import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internationalization/internationalization.dart';

import '../../../bloc/global/global_bloc.dart';
import '../../../bloc/global/global_event.dart';
import '../../../constants/image_constants.dart';
import '../../common/global_builder.dart';

class TasksTopMenu extends StatelessWidget {
  const TasksTopMenu({
    super.key,
    required this.username,
    required this.onLogoutPressed,
    required this.onCategoriesPressed,
  });

  final String username;
  final void Function() onLogoutPressed;
  final void Function() onCategoriesPressed;

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
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
                      child: GlobalBuilder(
                        builder: (state) => IconButton.filledTonal(
                          onPressed: () => context.read<GlobalBloc>().add(
                            ChangeLocale(locale: state.inverseLocale),
                          ),
                          icon: FittedBox(
                            child: StyledText.l1(state.localeName),
                          ),
                          tooltip: strings.common_toggle_language,
                          iconSize: IconSize.small,
                        ),
                      ),
                    ),
                    Flexible(
                      child: GlobalBuilder(
                        builder: (state) => IconButton.filledTonal(
                          onPressed: () => context.read<GlobalBloc>().add(
                            const SwitchThemeMode(),
                          ),
                          icon: Icon(state.icon),
                          tooltip: AppIntl.of(
                            context,
                          ).common_toggle_theme(state.displayName),
                          iconSize: IconSize.small,
                        ),
                      ),
                    ),
                    Flexible(
                      child: IconButton.filledTonal(
                        onPressed: onCategoriesPressed,
                        icon: const Icon(Icons.style),
                        iconSize: IconSize.small,
                        tooltip: strings.categories_title,
                      ),
                    ),
                    Flexible(
                      child: IconButton.filledTonal(
                        onPressed: onLogoutPressed,
                        icon: const Icon(Icons.logout),
                        iconSize: IconSize.small,
                        tooltip: strings.common_logout_title,
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
