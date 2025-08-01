import 'package:image_picker/image_picker.dart';

import 'model/media_file.dart';

abstract class MediaController {
  Future<MediaFile?> capturePhoto();

  Future<MediaFile?> captureVideo();

  Future<MediaFile?> pickImageFromGallery();

  Future<MediaFile?> pickVideoFromGallery();

  bool isFileSupported(String filePath);

  Future<bool> isFileSizeValid(XFile file);
}
