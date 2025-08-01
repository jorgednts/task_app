import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internationalization/internationalization.dart';

class TaskMediaPicker extends StatelessWidget {
  const TaskMediaPicker({
    super.key,
    required this.onSelectFile,
    required this.mediaService,
  });

  final void Function(MediaFile?) onSelectFile;
  final MediaController mediaService;

  void handleMediaOperation(
    BuildContext context, {
    required Future<MediaFile?> Function() onOperation,
  }) async {
    try {
      context.pop();
      final file = await onOperation();
      if (file != null) {
        onSelectFile(file);
      }
    } on CustomException catch (e) {
      if (context.mounted) {
        ScaffoldMessengerHandler.showErrorSnackBar(
          context,
          message: e.message,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    return MediaPickerButton(
      label: strings.tasks_add_media,
      onShowMediaOptions: () {
        CustomModalBottomSheet.show(
          context,
          child: MediaPickerSheet(
            addMediaLabel: strings.tasks_add_media,
            captureLabel: strings.tasks_capture,
            galleryLabel: strings.tasks_gallery,
            takePhotoLabel: strings.tasks_take_photo_title,
            takePhotoSubtitle: strings.tasks_take_photo_subtitle,
            recordVideoLabel: strings.tasks_record_video_title,
            recordVideoSubtitle: strings.tasks_record_video_subtitle,
            choosePhotoLabel: strings.tasks_choose_photo_title,
            chooseVideoLabel: strings.tasks_choose_video_title,
            chooseFromGalleryLabel: strings.tasks_choose_from_gallery,
            onCaptureImage: () => handleMediaOperation(
              context,
              onOperation: mediaService.capturePhoto,
            ),
            onCaptureVideo: () => handleMediaOperation(
              context,
              onOperation: mediaService.captureVideo,
            ),
            onChoosePhotoFromGallery: () => handleMediaOperation(
              context,
              onOperation: mediaService.pickImageFromGallery,
            ),
            onChooseVideoFromGallery: () => handleMediaOperation(
              context,
              onOperation: mediaService.pickVideoFromGallery,
            ),
          ),
        );
      },
    );
  }
}
