// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(currentThemeMode) =>
      "Toggle Theme (current: ${currentThemeMode})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "app_name": MessageLookupByLibrary.simpleMessage("EasyTask"),
    "auth_email": MessageLookupByLibrary.simpleMessage("e-mail"),
    "auth_error_email_address_invalid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address.",
    ),
    "auth_error_email_exists": MessageLookupByLibrary.simpleMessage(
      "An account with this email already exists. Try signing in instead.",
    ),
    "auth_error_email_not_confirmed": MessageLookupByLibrary.simpleMessage(
      "Please check your email and confirm your account before signing in.",
    ),
    "auth_error_generic": MessageLookupByLibrary.simpleMessage(
      "Please try again.",
    ),
    "auth_error_invalid_credentials": MessageLookupByLibrary.simpleMessage(
      "Invalid email or password. Please check your credentials and try again.",
    ),
    "auth_error_weak_password": MessageLookupByLibrary.simpleMessage(
      "Please choose a stronger password.",
    ),
    "auth_name": MessageLookupByLibrary.simpleMessage("name"),
    "auth_password": MessageLookupByLibrary.simpleMessage("password"),
    "auth_sign_in_label": MessageLookupByLibrary.simpleMessage("Sign In"),
    "auth_sign_in_message": MessageLookupByLibrary.simpleMessage(
      "Enter with your account!",
    ),
    "auth_sign_up_label": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "auth_sign_up_message": MessageLookupByLibrary.simpleMessage(
      "New here? Create an account!",
    ),
    "auth_validator_email_empty_error": MessageLookupByLibrary.simpleMessage(
      "Email is required",
    ),
    "auth_validator_email_invalid_error": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "auth_validator_name_empty_error": MessageLookupByLibrary.simpleMessage(
      "Name is required",
    ),
    "auth_validator_name_invalid_error": MessageLookupByLibrary.simpleMessage(
      "Name can only contain letters, spaces, hyphens, and apostrophes",
    ),
    "auth_validator_name_too_short_error": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 2 characters long",
    ),
    "auth_validator_password_empty_error": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "auth_validator_password_too_short_error":
        MessageLookupByLibrary.simpleMessage(
          "Password must be at least 6 characters long",
        ),
    "auth_validator_sign_in_message": MessageLookupByLibrary.simpleMessage(
      "Enter with your account!",
    ),
    "auth_verifying_user_message": MessageLookupByLibrary.simpleMessage(
      "Verifying user...",
    ),
    "auth_welcome_message": MessageLookupByLibrary.simpleMessage(
      "Your task management app",
    ),
    "auth_welcome_title": MessageLookupByLibrary.simpleMessage(
      "Welcome to EasyTask!",
    ),
    "categories_create_title": MessageLookupByLibrary.simpleMessage(
      "Create Category",
    ),
    "categories_delete_title": MessageLookupByLibrary.simpleMessage(
      "Delete Category",
    ),
    "categories_edit_title": MessageLookupByLibrary.simpleMessage(
      "Edit Category",
    ),
    "categories_empty_message": MessageLookupByLibrary.simpleMessage(
      "No categories found. Click the button below and add a new one!",
    ),
    "categories_loading_message": MessageLookupByLibrary.simpleMessage(
      "Loading categories...",
    ),
    "categories_title": MessageLookupByLibrary.simpleMessage("Categories"),
    "category_blue": MessageLookupByLibrary.simpleMessage("Blue"),
    "category_brown": MessageLookupByLibrary.simpleMessage("Brown"),
    "category_green": MessageLookupByLibrary.simpleMessage("Green"),
    "category_grey": MessageLookupByLibrary.simpleMessage("Grey"),
    "category_orange": MessageLookupByLibrary.simpleMessage("Orange"),
    "category_purple": MessageLookupByLibrary.simpleMessage("Purple"),
    "category_red": MessageLookupByLibrary.simpleMessage("Red"),
    "category_yellow": MessageLookupByLibrary.simpleMessage("Yellow"),
    "common_clear_tooltip": MessageLookupByLibrary.simpleMessage(
      "Clear search",
    ),
    "common_color": MessageLookupByLibrary.simpleMessage("Color"),
    "common_empty_title": MessageLookupByLibrary.simpleMessage("Empty List"),
    "common_error_message": MessageLookupByLibrary.simpleMessage(
      "Something went wrong, please try again",
    ),
    "common_error_network": MessageLookupByLibrary.simpleMessage(
      "Check your internet connection and try again.",
    ),
    "common_error_title": MessageLookupByLibrary.simpleMessage("Oops! :("),
    "common_hello": MessageLookupByLibrary.simpleMessage("Hello"),
    "common_logout_title": MessageLookupByLibrary.simpleMessage("Logout"),
    "common_name_empty_error": MessageLookupByLibrary.simpleMessage(
      "Name is required",
    ),
    "common_name_title": MessageLookupByLibrary.simpleMessage("Name"),
    "common_search_tooltip": MessageLookupByLibrary.simpleMessage("Search"),
    "common_success_message": MessageLookupByLibrary.simpleMessage(
      "Operation completed successfully",
    ),
    "common_success_title": MessageLookupByLibrary.simpleMessage("Success! :)"),
    "common_toggle_language": MessageLookupByLibrary.simpleMessage(
      "Toggle language",
    ),
    "common_toggle_theme": m0,
    "common_try_again": MessageLookupByLibrary.simpleMessage("Try Again"),
    "tasks_add_media": MessageLookupByLibrary.simpleMessage("Add media"),
    "tasks_capture": MessageLookupByLibrary.simpleMessage("Capture"),
    "tasks_category_add_message": MessageLookupByLibrary.simpleMessage(
      "+ Add category",
    ),
    "tasks_category_label": MessageLookupByLibrary.simpleMessage("Category"),
    "tasks_choose_from_gallery": MessageLookupByLibrary.simpleMessage(
      "Select from your gallery",
    ),
    "tasks_choose_photo_title": MessageLookupByLibrary.simpleMessage(
      "Choose photo",
    ),
    "tasks_choose_video_title": MessageLookupByLibrary.simpleMessage(
      "Choose video",
    ),
    "tasks_create_title": MessageLookupByLibrary.simpleMessage("Create Task"),
    "tasks_create_with_error": MessageLookupByLibrary.simpleMessage(
      "The task was created successfully, but there was an error uploading the media. But don\'t worry, you can try inserting it again by editing the task ;)",
    ),
    "tasks_create_with_error_title": MessageLookupByLibrary.simpleMessage(
      "Warning!",
    ),
    "tasks_current_media_title": MessageLookupByLibrary.simpleMessage(
      "Saved media",
    ),
    "tasks_delete_title": MessageLookupByLibrary.simpleMessage("Delete Task"),
    "tasks_description_empty_error": MessageLookupByLibrary.simpleMessage(
      "Description is required",
    ),
    "tasks_description_label": MessageLookupByLibrary.simpleMessage(
      "Description",
    ),
    "tasks_due_date": MessageLookupByLibrary.simpleMessage("Due date"),
    "tasks_edit_title": MessageLookupByLibrary.simpleMessage("Edit Task"),
    "tasks_empty_message": MessageLookupByLibrary.simpleMessage(
      "No tasks found. Click the button below and add a new one!",
    ),
    "tasks_gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "tasks_loading_message": MessageLookupByLibrary.simpleMessage(
      "Loading data, please wait...",
    ),
    "tasks_new_media_title": MessageLookupByLibrary.simpleMessage("New media"),
    "tasks_record_video_subtitle": MessageLookupByLibrary.simpleMessage(
      "Record a new video",
    ),
    "tasks_record_video_title": MessageLookupByLibrary.simpleMessage(
      "Record video",
    ),
    "tasks_save_changes": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "tasks_search_label": MessageLookupByLibrary.simpleMessage("Search Tasks"),
    "tasks_status_done": MessageLookupByLibrary.simpleMessage("Done"),
    "tasks_status_in_progress": MessageLookupByLibrary.simpleMessage(
      "In progress",
    ),
    "tasks_status_label": MessageLookupByLibrary.simpleMessage("Status"),
    "tasks_status_to_do": MessageLookupByLibrary.simpleMessage("To do"),
    "tasks_take_photo_subtitle": MessageLookupByLibrary.simpleMessage(
      "Capture new photo",
    ),
    "tasks_take_photo_title": MessageLookupByLibrary.simpleMessage(
      "Take photo",
    ),
  };
}
