// import 'dart:convert';
//
// import 'package:core/core.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../remote/model/easy_task_user_response.dart';
// import '../model/easy_task_local_cache.dart';
// import 'auth_local_data_source.dart';
// import 'constants/shared_preferences_constants.dart';
//
// class AuthLocalDataSourceImpl implements AuthLocalDataSource {
//   AuthLocalDataSourceImpl({
//     required this.sharedPreferences,
//   });
//
//   final SharedPreferences sharedPreferences;
//
//   @override
//   Future<EasyTaskUserCache?> getLastUser() async {
//     try {
//       final jsonString = sharedPreferences.getString(
//         SharedPreferencesConstants.cachedUserKey,
//       );
//       if (jsonString != null) {
//         return EasyTaskUserCache.fromJsonString(jsonString);
//       }
//       throw NullUserException();
//     } catch (e) {
//       throw CacheException();
//     }
//   }
//
//   @override
//   Future<void> cacheUser(EasyTaskUserResponse user) async {
//     try {
//       await sharedPreferences.setString(
//         SharedPreferencesConstants.cachedUserKey,
//         json.encode(user.toJson()),
//       );
//     } catch (e) {
//       throw CacheException();
//     }
//   }
//
//   @override
//   Future<void> clearCache() async {
//     try {
//       await sharedPreferences.remove(SharedPreferencesConstants.cachedUserKey);
//     } catch (e) {
//       throw CacheException();
//     }
//   }
// }
