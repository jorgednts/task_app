// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppIntl {
  AppIntl();

  static AppIntl? _current;

  static AppIntl get current {
    assert(
      _current != null,
      'No instance of AppIntl was loaded. Try to initialize the AppIntl delegate before accessing AppIntl.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppIntl> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppIntl();
      AppIntl._current = instance;

      return instance;
    });
  }

  static AppIntl of(BuildContext context) {
    final instance = AppIntl.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppIntl present in the widget tree. Did you add AppIntl.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppIntl? maybeOf(BuildContext context) {
    return Localizations.of<AppIntl>(context, AppIntl);
  }

  /// `EasyTask`
  String get app_name {
    return Intl.message('EasyTask', name: 'app_name', desc: '', args: []);
  }

  /// `Oops! :(`
  String get common_error_title {
    return Intl.message(
      'Oops! :(',
      name: 'common_error_title',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again`
  String get common_error_message {
    return Intl.message(
      'Something went wrong, please try again',
      name: 'common_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Success! :)`
  String get common_success_title {
    return Intl.message(
      'Success! :)',
      name: 'common_success_title',
      desc: '',
      args: [],
    );
  }

  /// `Operation completed successfully`
  String get common_success_message {
    return Intl.message(
      'Operation completed successfully',
      name: 'common_success_message',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get common_hello {
    return Intl.message('Hello', name: 'common_hello', desc: '', args: []);
  }

  /// `Sign Up`
  String get auth_sign_up_label {
    return Intl.message(
      'Sign Up',
      name: 'auth_sign_up_label',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get auth_sign_in_label {
    return Intl.message(
      'Sign In',
      name: 'auth_sign_in_label',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get auth_name {
    return Intl.message('name', name: 'auth_name', desc: '', args: []);
  }

  /// `e-mail`
  String get auth_email {
    return Intl.message('e-mail', name: 'auth_email', desc: '', args: []);
  }

  /// `password`
  String get auth_password {
    return Intl.message('password', name: 'auth_password', desc: '', args: []);
  }

  /// `Welcome to EasyTask!`
  String get auth_welcome_title {
    return Intl.message(
      'Welcome to EasyTask!',
      name: 'auth_welcome_title',
      desc: '',
      args: [],
    );
  }

  /// `Your task management app`
  String get auth_welcome_message {
    return Intl.message(
      'Your task management app',
      name: 'auth_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Verifying user...`
  String get auth_verifying_user_message {
    return Intl.message(
      'Verifying user...',
      name: 'auth_verifying_user_message',
      desc: '',
      args: [],
    );
  }

  /// `New here? Create an account!`
  String get auth_sign_up_message {
    return Intl.message(
      'New here? Create an account!',
      name: 'auth_sign_up_message',
      desc: '',
      args: [],
    );
  }

  /// `Enter with your account!`
  String get auth_sign_in_message {
    return Intl.message(
      'Enter with your account!',
      name: 'auth_sign_in_message',
      desc: '',
      args: [],
    );
  }

  /// `Enter with your account!`
  String get auth_validator_sign_in_message {
    return Intl.message(
      'Enter with your account!',
      name: 'auth_validator_sign_in_message',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get auth_validator_email_empty_error {
    return Intl.message(
      'Email is required',
      name: 'auth_validator_email_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get auth_validator_email_invalid_error {
    return Intl.message(
      'Please enter a valid email address',
      name: 'auth_validator_email_invalid_error',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get auth_validator_password_empty_error {
    return Intl.message(
      'Password is required',
      name: 'auth_validator_password_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get auth_validator_password_too_short_error {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'auth_validator_password_too_short_error',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get auth_validator_name_empty_error {
    return Intl.message(
      'Name is required',
      name: 'auth_validator_name_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 2 characters long`
  String get auth_validator_name_too_short_error {
    return Intl.message(
      'Name must be at least 2 characters long',
      name: 'auth_validator_name_too_short_error',
      desc: '',
      args: [],
    );
  }

  /// `Name can only contain letters, spaces, hyphens, and apostrophes`
  String get auth_validator_name_invalid_error {
    return Intl.message(
      'Name can only contain letters, spaces, hyphens, and apostrophes',
      name: 'auth_validator_name_invalid_error',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection and try again.`
  String get auth_error_network {
    return Intl.message(
      'Check your internet connection and try again.',
      name: 'auth_error_network',
      desc: '',
      args: [],
    );
  }

  /// `Please try again.`
  String get auth_error_generic {
    return Intl.message(
      'Please try again.',
      name: 'auth_error_generic',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email and confirm your account before signing in.`
  String get auth_error_email_not_confirmed {
    return Intl.message(
      'Please check your email and confirm your account before signing in.',
      name: 'auth_error_email_not_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get auth_error_email_address_invalid {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'auth_error_email_address_invalid',
      desc: '',
      args: [],
    );
  }

  /// `An account with this email already exists. Try signing in instead.`
  String get auth_error_email_exists {
    return Intl.message(
      'An account with this email already exists. Try signing in instead.',
      name: 'auth_error_email_exists',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a stronger password.`
  String get auth_error_weak_password {
    return Intl.message(
      'Please choose a stronger password.',
      name: 'auth_error_weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password. Please check your credentials and try again.`
  String get auth_error_invalid_credentials {
    return Intl.message(
      'Invalid email or password. Please check your credentials and try again.',
      name: 'auth_error_invalid_credentials',
      desc: '',
      args: [],
    );
  }

  /// `Create Task`
  String get tasks_create_title {
    return Intl.message(
      'Create Task',
      name: 'tasks_create_title',
      desc: '',
      args: [],
    );
  }

  /// `Edit Task`
  String get tasks_edit_title {
    return Intl.message(
      'Edit Task',
      name: 'tasks_edit_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete Task`
  String get tasks_delete_title {
    return Intl.message(
      'Delete Task',
      name: 'tasks_delete_title',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get tasks_name_label {
    return Intl.message('Name', name: 'tasks_name_label', desc: '', args: []);
  }

  /// `Name is required`
  String get tasks_name_empty_error {
    return Intl.message(
      'Name is required',
      name: 'tasks_name_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get tasks_description_label {
    return Intl.message(
      'Description',
      name: 'tasks_description_label',
      desc: '',
      args: [],
    );
  }

  /// `Description is required`
  String get tasks_description_empty_error {
    return Intl.message(
      'Description is required',
      name: 'tasks_description_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get tasks_category_label {
    return Intl.message(
      'Category',
      name: 'tasks_category_label',
      desc: '',
      args: [],
    );
  }

  /// `Loading categories...`
  String get tasks_category_loading_message {
    return Intl.message(
      'Loading categories...',
      name: 'tasks_category_loading_message',
      desc: '',
      args: [],
    );
  }

  /// `+ Add category`
  String get tasks_category_add_message {
    return Intl.message(
      '+ Add category',
      name: 'tasks_category_add_message',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get tasks_status_label {
    return Intl.message(
      'Status',
      name: 'tasks_status_label',
      desc: '',
      args: [],
    );
  }

  /// `Due date`
  String get tasks_due_date {
    return Intl.message('Due date', name: 'tasks_due_date', desc: '', args: []);
  }

  /// `To do`
  String get tasks_status_to_do {
    return Intl.message(
      'To do',
      name: 'tasks_status_to_do',
      desc: '',
      args: [],
    );
  }

  /// `In progress`
  String get tasks_status_in_progress {
    return Intl.message(
      'In progress',
      name: 'tasks_status_in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get tasks_status_done {
    return Intl.message('Done', name: 'tasks_status_done', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppIntl> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppIntl> load(Locale locale) => AppIntl.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
