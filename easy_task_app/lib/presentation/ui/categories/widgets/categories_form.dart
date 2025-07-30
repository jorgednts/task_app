import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/tasks/easy_task_category_color.dart';
import '../../../../domain/model/tasks/easy_task_category_model.dart';
import '../../../../domain/model/tasks/params/create_category_param.dart';
import '../../../../domain/model/tasks/params/edit_category_params.dart';
import '../../../bloc/categories/categories_event.dart';
import '../../../utils/form_field_validators.dart';

class CategoriesForm extends StatefulWidget {
  const CategoriesForm({
    super.key,
    this.category,
  });

  final EasyTaskCategoryModel? category;

  @override
  State<CategoriesForm> createState() => _CategoriesFormState();
}

class _CategoriesFormState extends State<CategoriesForm> {
  late TextEditingController nameController;
  final formKey = GlobalKey<FormState>();
  late EasyTaskCategoryColorModel selectedColor;

  @override
  void initState() {
    super.initState();
    initFields();
  }

  void initFields() {
    nameController = TextEditingController(text: widget.category?.name);
    setState(() {
      selectedColor =
          widget.category?.color ?? EasyTaskCategoryColorModel.values.first;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.medium),
        child: Column(
          spacing: Spacing.medium,
          children: [
            Row(
              spacing: Spacing.medium,
              children: [
                Expanded(
                  child: StyledText.t3(
                    widget.category == null
                        ? strings.categories_create_title
                        : strings.categories_edit_title,
                    isBold: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CloseButton(
                  onPressed: () => context.pop(null),
                ),
              ],
            ),
            Form(
              key: formKey,
              child: Column(
                spacing: Spacing.medium,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    label: strings.common_name_title,
                    maxLines: 1,
                    controller: nameController,
                    validator: FormFieldValidators.generic(
                      emptyMessage: strings.common_name_empty_error,
                    ),
                  ),
                  CustomDropdownButton<EasyTaskCategoryColorModel>(
                    hint: strings.common_color,
                    initialValue: selectedColor,
                    options: EasyTaskCategoryColorModel.values,
                    nameBuilder: (color) => color.translated(strings),
                    leadingBuilder: (color) => Container(
                      decoration: BoxDecoration(
                        color: color.materialColor(Theme.of(context)),
                        shape: BoxShape.circle,
                      ),
                      width: RadiusSize.large,
                      height: RadiusSize.large,
                    ),
                    onChanged: (color) {
                      if (color != null) {
                        setState(() => selectedColor = color);
                      }
                    },
                  ),
                ],
              ),
            ),
            Row(
              spacing: Spacing.small,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                widget.category == null
                    ? const Spacer()
                    : Flexible(
                        child: CustomTextButton(
                          label: strings.categories_delete_title,
                          onPressed: () => context.pop(
                            DeleteCategory(id: widget.category!.id),
                          ),
                          isBold: true,
                        ),
                      ),
                Flexible(
                  child: CustomFilledButton(
                    label: widget.category == null
                        ? strings.categories_create_title
                        : strings.categories_edit_title,
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        final CategoriesEvent event = widget.category == null
                            ? CreateCategory(
                                params: CreateCategoryParams(
                                  name: nameController.text,
                                  color: selectedColor,
                                ),
                              )
                            : EditCategory(
                                params: EditCategoryParams(
                                  id: widget.category!.id,
                                  name: nameController.text,
                                  userId: widget.category!.userId,
                                  color: selectedColor,
                                ),
                              );
                        context.pop(event);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
