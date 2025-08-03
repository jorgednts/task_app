import 'package:easy_task_app/data/remote/model/task/easy_task_response.dart';
import 'package:easy_task_app/domain/model/tasks/easy_task_category_color.dart';
import 'package:easy_task_app/domain/model/tasks/easy_task_category_model.dart';
import 'package:easy_task_app/domain/model/tasks/easy_task_model.dart';
import 'package:easy_task_app/domain/model/tasks/params/create_task_params.dart';
import 'package:easy_task_app/domain/model/tasks/params/delete_media_params.dart';
import 'package:easy_task_app/domain/model/tasks/params/edit_task_params.dart';
import 'package:easy_task_app/domain/model/tasks/params/get_tasks_filter_params.dart';
import 'package:easy_task_app/domain/model/tasks/params/upload_media_params.dart';
import 'package:easy_task_app/domain/model/tasks/task_status.dart';

final filtersParams = const GetTasksFiltersParams(
  query: 'test',
  limit: 10,
  offset: 0,
);

const taskId = 'task123';

final mockTasksModel = EasyTaskModel(
  id: '',
  title: '',
  description: '',
  dueDate: DateTime.now(),
  category: null,
  status: EasyTaskStatus.done,
  media: [],
);

final mockTasksResponse = [
  EasyTaskResponse(
    id: '1',
    title: 'Test Task 1',
    description: 'Description 1',
    dueDate: DateTime(2024, 1, 1),
    status: 'done',
    userId: 'user123',
    media: [],
    category: null,
  ),
  EasyTaskResponse(
    id: '2',
    title: 'Test Task 2',
    description: 'Description 2',
    dueDate: DateTime(2024, 1, 2),
    status: 'done',
    userId: 'user123',
    media: [],
    category: null,
  ),
];

final createTaskParams = CreateTaskParams(
  title: 'New Task',
  description: 'New task description',
  dueDate: DateTime(2024, 1, 1),
  category: const EasyTaskCategoryModel(
    id: 'cat1',
    name: 'Work',
    color: EasyTaskCategoryColorModel.categoryBlue,
    userId: 'user123',
  ),
  status: EasyTaskStatus.done,
  currentMedia: [],
  newMedia: [],
);

final editTaskParams = EditTaskParams(
  id: '1',
  title: 'Updated Task',
  description: 'Updated description',
  dueDate: DateTime(2024, 1, 1),
  category: const EasyTaskCategoryModel(
    id: 'cat1',
    name: 'Work',
    color: EasyTaskCategoryColorModel.categoryBlue,
    userId: 'user123',
  ),
  status: EasyTaskStatus.done,
  currentMedia: [],
  newMedia: [],
);

final deleteTaskParams = DeleteMediaParams(
  currentMedia: [],
  taskId: 'id123',
  fileName: 'path/fileName.jpg',
);

final mockTaskResponse = EasyTaskResponse(
  id: '1',
  title: 'New Task',
  description: 'New task description',
  dueDate: DateTime(2024, 1, 1),
  status: 'done',
  userId: 'user123',
  media: [],
  category: null,
);

final uploadMediaParams = UploadMediaParams(
  taskId: 'taskId123',
  title: 'Task Title',
  description: 'Task Description',
  dueDate: DateTime.now(),
  category: null,
  status: EasyTaskStatus.done,
  newMedia: [],
  currentMedia: [],
);
