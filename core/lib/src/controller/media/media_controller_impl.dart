import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../../exceptions/custom_exceptions.dart';
import '../../service/logger/logger_service.dart';
import 'media_controller.dart';
import 'model/media_file.dart';

class MediaControllerImpl implements MediaController {
  MediaControllerImpl({required LoggerService logger}) : _logger = logger;

  static const int maxFileSize = 50 * 1024 * 1024;
  final ImagePicker _picker = ImagePicker();

  final LoggerService _logger;

  @override
  Future<MediaFile?> capturePhoto() async {
    try {
      final xFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1080,
      );
      _logger.d('Captured photo: ${xFile?.path}');
      return _convertXFile(xFile);
    } catch (e) {
      return _throwException('Error capturing photo: $e');
    }
  }

  @override
  Future<MediaFile?> captureVideo() async {
    try {
      final xFile = await _picker.pickVideo(
        source: ImageSource.camera,
        maxDuration: const Duration(minutes: 5),
      );
      _logger.d('Captured video: ${xFile?.path}');
      return _convertXFile(xFile);
    } catch (e) {
      return _throwException('Error recording video: $e');
    }
  }

  @override
  Future<MediaFile?> pickImageFromGallery() async {
    try {
      final xFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1080,
      );
      _logger.d('Picked image from gallery: ${xFile?.path}');
      return _convertXFile(xFile);
    } catch (e) {
      return _throwException('Error selecting image: $e');
    }
  }

  @override
  Future<MediaFile?> pickVideoFromGallery() async {
    try {
      final xFile = await _picker.pickVideo(
        source: ImageSource.gallery,
      );
      _logger.d('Picked video from gallery: ${xFile?.path}');
      return _convertXFile(xFile);
    } catch (e) {
      return _throwException('Error selecting video: $e');
    }
  }

  @override
  Future<bool> isFileSizeValid(XFile file) async {
    final size = await file.length();
    return size <= maxFileSize;
  }

  @override
  bool isFileSupported(String filePath) {
    final mimeType = lookupMimeType(filePath);
    if (mimeType == null) return false;

    return mimeType.startsWith('image/') || mimeType.startsWith('video/');
  }

  Future<MediaFile?> _convertXFile(XFile? file) async {
    if (file == null) return null;

    final mimeType = lookupMimeType(file.path) ?? 'application/octet-stream';

    return MediaFile(
      path: file.path,
      name: file.name,
      mimeType: mimeType,
      size: await file.length(),
      bytesGetter: () => file.readAsBytes(),
    );
  }

  Never _throwException(String message) {
    _logger.e(message);
    throw GenericException(message: message);
  }
}
