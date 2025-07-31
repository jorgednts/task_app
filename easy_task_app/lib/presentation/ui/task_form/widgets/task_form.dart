import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/tasks/easy_task_category_model.dart';
import '../../../../domain/model/tasks/easy_task_model.dart';
import '../../../../domain/model/tasks/params/create_task_params.dart';
import '../../../../domain/model/tasks/params/edit_task_params.dart';
import '../../../../domain/model/tasks/task_status.dart';
import '../../../bloc/task_form/task_form_state.dart';
import '../../../utils/form_field_validators.dart';
import '../../tasks/widgets/categories_selector.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({
    super.key,
    this.task,
    required this.onAddCategory,
    required this.onCreateTask,
    required this.onEditTask,
    required this.onDeleteTask,
    required this.state,
  });

  final EasyTaskModel? task;
  final VoidCallback onAddCategory;
  final void Function(CreateTaskParams params) onCreateTask;
  final void Function(EditTaskParams params) onEditTask;
  final void Function(String id) onDeleteTask;
  final TaskFormState state;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController nameController, descriptionController;
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  late EasyTaskStatus selectedStatus;
  EasyTaskCategoryModel? selectedCategory;

  @override
  void initState() {
    super.initState();
    initFields();
  }

  void initFields() {
    nameController = TextEditingController(text: widget.task?.title);
    descriptionController = TextEditingController(
      text: widget.task?.description,
    );
    setState(() {
      selectedCategory = widget.task?.category;
      selectedStatus = widget.task?.status ?? EasyTaskStatus.toDo;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: WidthResponsiveBreakpoints.large,
          ),
          padding: const EdgeInsets.all(Spacing.medium),
          child: Column(
            spacing: Spacing.medium,
            children: [
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
                    CustomDatePicker(
                      onDateSelected: (date) {
                        setState(() => selectedDate = date);
                      },
                      label: DateFormat.yMMMd().format(selectedDate),
                      title: strings.tasks_due_date,
                      initialDate: selectedDate,
                    ),
                    CustomDropdownButton<EasyTaskStatus>(
                      hint: strings.tasks_status_label,
                      initialValue: selectedStatus,
                      options: EasyTaskStatus.values,
                      nameBuilder: (status) => status.translated(strings),
                      onChanged: (status) {
                        if (status != null) {
                          setState(() => selectedStatus = status);
                        }
                      },
                    ),
                    (widget.state is CategoryListState &&
                            widget.state.type == TaskFormStateType.loading)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CategoriesSelector(
                            selectedCategory: selectedCategory,
                            categories: widget.state.categories,
                            onChanged: (selected) {
                              setState(() => selectedCategory = selected);
                            },
                            onAddCategory: widget.onAddCategory,
                          ),
                    CustomTextFormField(
                      label: strings.tasks_description_label,
                      maxLines: 3,
                      controller: descriptionController,
                      validator: FormFieldValidators.generic(
                        emptyMessage: strings.tasks_description_empty_error,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                spacing: Spacing.small,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.task == null
                      ? const Spacer()
                      : Flexible(
                          child: CustomTextButton(
                            label: strings.tasks_delete_title,
                            onPressed: () =>
                                widget.onDeleteTask(widget.task!.id),
                            isBold: true,
                          ),
                        ),
                  Flexible(
                    child: CustomFilledButton(
                      label: widget.task == null
                          ? strings.tasks_create_title
                          : strings.tasks_edit_title,
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          // TODO: Implement task creation and editing category and media
                          if (widget.task == null) {
                            widget.onCreateTask(
                              CreateTaskParams(
                                title: nameController.text,
                                description: descriptionController.text,
                                dueDate: selectedDate,
                                category: selectedCategory,
                                status: selectedStatus,
                                media: [],
                              ),
                            );
                          } else {
                            widget.onEditTask(
                              EditTaskParams(
                                id: widget.task!.id,
                                title: nameController.text,
                                description: descriptionController.text,
                                dueDate: selectedDate,
                                category: selectedCategory,
                                status: selectedStatus,
                                media: [],
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
