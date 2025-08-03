import 'dart:math';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internationalization/internationalization.dart';

import '../../../domain/model/tasks/easy_task_category_model.dart';
import '../../bloc/categories/categories_bloc.dart';
import '../../bloc/categories/categories_event.dart';
import '../../bloc/categories/categories_state.dart';
import 'widgets/categories_form.dart';
import 'widgets/category_card.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  void handleCategoriesOperation(
    BuildContext context,
    CategoriesState state, {
    EasyTaskCategoryModel? category,
  }) async {
    final bloc = context.read<CategoriesBloc>();
    final result = await CustomModalBottomSheet.show<CategoriesEvent?>(
      context,
      child: CategoriesForm(
        category: category,
      ),
    );
    if (result != null) {
      bloc.add(result);
    }
  }

  void handleError(BuildContext context, String message) {
    ScaffoldMessengerHandler.showErrorSnackBar(
      context,
      title: AppIntl.of(context).common_error_title,
      message: message,
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: Spacing.medium,
          children: [
            Icon(
              Icons.style,
              color: theme.colorScheme.onSecondary,
            ),
            FittedBox(
              child: StyledText.t3(
                strings.categories_title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontColor: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        leading: BackButton(color: theme.colorScheme.onSecondary),
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: BlocConsumer<CategoriesBloc, CategoriesState>(
        listener: (context, state) {
          if (state is CategoryErrorState) {
            handleError(
              context,
              state.exception is NetworkException
                  ? strings.common_error_network
                  : strings.common_error_message,
            );
          } else if (state is CategorySuccessState) {
            ScaffoldMessengerHandler.showSuccessSnackBar(
              context,
              message: strings.common_success_message,
              title: strings.common_success_title,
            );
            context.read<CategoriesBloc>().add(const InitCategories());
          }
        },
        builder: (context, state) => Padding(
          padding: const EdgeInsets.all(Spacing.medium),
          child: Stack(
            children: [
              Positioned.fill(
                child: state is CategoriesListLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : (state is CategoriesListSuccessState &&
                          state.categories.isEmpty)
                    ? Center(
                        child: StyledText.t2(
                          strings.categories_empty_message,
                          isBold: true,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Wrap(
                              spacing: Spacing.medium,
                              runSpacing: Spacing.medium,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              children: List.generate(
                                state.categories.length,
                                (index) {
                                  return SizedBox(
                                    width: min(
                                      MediaQuery.sizeOf(context).width,
                                      WidthResponsiveBreakpoints.small / 2,
                                    ),
                                    child: CategoryCard(
                                      category: state.categories[index],
                                      onTap: () => handleCategoriesOperation(
                                        context,
                                        state,
                                        category: state.categories[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () => handleCategoriesOperation(context, state),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
