import 'package:easy_task_app/data/remote/model/user/easy_task_user_response.dart';
import 'package:easy_task_app/data/remote/model/user/sign_in_params.dart';
import 'package:easy_task_app/domain/model/user/easy_task_user_model.dart';
import 'package:easy_task_app/domain/model/user/register_user_params.dart';

final mockUserModel = const EasyTaskUserModel(id: '', name: '', email: '');

final registerParams = RegisterUserParams(
  email: 'test@example.com',
  password: 'password123',
  name: 'Test User',
);

final mockUserResponse = const EasyTaskUserResponse(
  id: '123',
  email: 'test@example.com',
  name: 'Test User',
);

final signInParams = SignInParams(
  email: 'test@example.com',
  password: 'password123',
);
