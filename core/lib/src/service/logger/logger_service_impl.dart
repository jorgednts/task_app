import 'package:logger/logger.dart';

import 'logger_service.dart';

class LoggerServiceImpl implements LoggerService {
  static final Logger _logger = Logger(printer: PrettyPrinter());

  @override
  void d(String message) {
    _logger.d(message);
  }

  @override
  void e(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
