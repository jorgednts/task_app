import 'package:easy_task_app/data/remote/model/task/easy_task_category_response.dart';
import 'package:easy_task_app/domain/model/tasks/easy_task_category_color.dart';
import 'package:easy_task_app/domain/model/tasks/params/create_category_param.dart';
import 'package:easy_task_app/domain/model/tasks/params/edit_category_params.dart';

final mockCategoriesResponse = [
  EasyTaskCategoryResponse(
    id: '1',
    name: 'Work',
    color: 'categoryBlue',
    userId: 'user123',
  ),
  EasyTaskCategoryResponse(
    id: '2',
    name: 'Personal',
    color: 'categoryRed',
    userId: 'user123',
  ),
];

final createCategoryParams = CreateCategoryParams(
  name: 'New Category',
  color: EasyTaskCategoryColorModel.categoryGreen,
);

final editCategoryParams = EditCategoryParams(
  id: '1',
  name: 'Updated Category',
  color: EasyTaskCategoryColorModel.categoryPurple,
  userId: 'user123',
);
