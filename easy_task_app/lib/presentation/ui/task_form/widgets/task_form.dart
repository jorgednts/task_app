import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/tasks/easy_task_category_model.dart';
import '../../../../domain/model/tasks/easy_task_media_item_model.dart';
import '../../../../domain/model/tasks/params/create_task_params.dart';
import '../../../../domain/model/tasks/params/delete_media_params.dart';
import '../../../../domain/model/tasks/params/edit_task_params.dart';
import '../../../../domain/model/tasks/task_status.dart';
import '../../../bloc/task_form/task_form_state.dart';
import '../../../utils/form_field_validators.dart';
import '../../tasks/widgets/categories_selector.dart';
import 'task_media_picker.dart';
import 'task_media_viewer.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({
    super.key,
    required this.onAddCategory,
    required this.onCreateTask,
    required this.onEditTask,
    required this.onDeleteTask,
    required this.state,
    required this.mediaService,
    required this.onDeleteMedia,
  });

  final VoidCallback onAddCategory;
  final void Function(CreateTaskParams params) onCreateTask;
  final void Function(EditTaskParams params) onEditTask;
  final void Function(String id) onDeleteTask;
  final TaskFormState state;
  final MediaController mediaService;
  final void Function(DeleteMediaParams params) onDeleteMedia;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController nameController, descriptionController;
  final formKey = GlobalKey<FormState>();
  late DateTime selectedDate;
  late EasyTaskStatus selectedStatus;
  EasyTaskCategoryModel? selectedCategory;
  final media = <MediaFile>[];
  final currentMedia = <EasyTaskMediaItemModel>[];

  @override
  void initState() {
    super.initState();
    initFields();
  }

  void initFields() {
    nameController = TextEditingController(text: widget.state.task?.title);
    descriptionController = TextEditingController(
      text: widget.state.task?.description,
    );
    setState(() {
      selectedDate =
          widget.state.task?.dueDate ??
          DateTime.now().add(const Duration(days: 1));
      selectedCategory = widget.state.task?.category;
      selectedStatus = widget.state.task?.status ?? EasyTaskStatus.toDo;
      currentMedia.addAll(widget.state.task?.media ?? []);
    });
  }

  void updateMediaList(MediaFile? file) {
    setState(() {
      if (file != null) {
        media.add(file);
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void onPressedButton() {
    if (widget.state.task == null) {
      widget.onCreateTask(
        CreateTaskParams(
          title: nameController.text,
          description: descriptionController.text,
          dueDate: selectedDate,
          category: selectedCategory,
          status: selectedStatus,
          currentMedia: [],
          newMedia: media,
        ),
      );
    } else {
      widget.onEditTask(
        EditTaskParams(
          id: widget.state.task!.id,
          title: nameController.text,
          description: descriptionController.text,
          dueDate: selectedDate,
          category: selectedCategory,
          status: selectedStatus,
          newMedia: media,
          currentMedia: currentMedia,
        ),
      );
    }
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
                      onDateSelected: (date) =>
                          setState(() => selectedDate = date),
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
                            onChanged: (selected) =>
                                setState(() => selectedCategory = selected),
                            onAddCategory: widget.onAddCategory,
                          ),
                    if (currentMedia.isNotEmpty) ...[
                      TaskMediaViewer(
                        label: strings.tasks_current_media_title,
                        onDeleteItem: (index) => widget.onDeleteMedia(
                          DeleteMediaParams(
                            taskId: widget.state.task!.id,
                            fileName: currentMedia[index].fileName,
                            currentMedia: currentMedia,
                          ),
                        ),
                        media: (currentMedia)
                            .map(
                              (e) => MediaViewerType.fromUrl(
                                e.url,
                                isImage: e.isImage,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                    if (media.isNotEmpty) ...[
                      TaskMediaViewer(
                        label: strings.tasks_new_media_title,
                        onDeleteItem: (index) {
                          setState(() => media.removeAt(index));
                        },
                        media: media
                            .map(
                              (e) => MediaViewerType.fromPath(
                                e.path,
                                isImage: e.isImage,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                    TaskMediaPicker(
                      onSelectFile: updateMediaList,
                      mediaService: widget.mediaService,
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
                  widget.state.task == null
                      ? const Spacer()
                      : Flexible(
                          child: CustomTextButton(
                            label: strings.tasks_delete_title,
                            onPressed: () =>
                                widget.onDeleteTask(widget.state.task!.id),
                            isBold: true,
                          ),
                        ),
                  Flexible(
                    child: CustomFilledButton(
                      label: widget.state.task == null
                          ? strings.tasks_create_title
                          : strings.tasks_save_changes,
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          onPressedButton();
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
