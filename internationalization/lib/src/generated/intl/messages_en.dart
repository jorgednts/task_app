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
    "auth_error_network": MessageLookupByLibrary.simpleMessage(
      "Check your internet connection and try again.",
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
    "common_error_message": MessageLookupByLibrary.simpleMessage(
      "Something went wrong, please try again",
    ),
    "common_error_title": MessageLookupByLibrary.simpleMessage("Oops! :("),
    "common_hello": MessageLookupByLibrary.simpleMessage("Hello"),
    "common_success_message": MessageLookupByLibrary.simpleMessage(
      "Operation completed successfully",
    ),
    "common_success_title": MessageLookupByLibrary.simpleMessage("Success! :)"),
    "tasks_category_add_message": MessageLookupByLibrary.simpleMessage(
      "+ Add category",
    ),
    "tasks_category_label": MessageLookupByLibrary.simpleMessage("Category"),
    "tasks_category_loading_message": MessageLookupByLibrary.simpleMessage(
      "Loading categories...",
    ),
    "tasks_create_title": MessageLookupByLibrary.simpleMessage("Create Task"),
    "tasks_delete_title": MessageLookupByLibrary.simpleMessage("Delete Task"),
    "tasks_description_empty_error": MessageLookupByLibrary.simpleMessage(
      "Description is required",
    ),
    "tasks_description_label": MessageLookupByLibrary.simpleMessage(
      "Description",
    ),
    "tasks_due_date": MessageLookupByLibrary.simpleMessage("Due date"),
    "tasks_edit_title": MessageLookupByLibrary.simpleMessage("Edit Task"),
    "tasks_name_empty_error": MessageLookupByLibrary.simpleMessage(
      "Name is required",
    ),
    "tasks_name_label": MessageLookupByLibrary.simpleMessage("Name"),
    "tasks_status_done": MessageLookupByLibrary.simpleMessage("Done"),
    "tasks_status_in_progress": MessageLookupByLibrary.simpleMessage(
      "In progress",
    ),
    "tasks_status_label": MessageLookupByLibrary.simpleMessage("Status"),
    "tasks_status_to_do": MessageLookupByLibrary.simpleMessage("To do"),
  };
}
