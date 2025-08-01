import 'package:flutter/material.dart';

import '../../../design_system.dart';

class MediaPickerSheet extends StatelessWidget {
  const MediaPickerSheet({
    super.key,
    required this.addMediaLabel,
    required this.captureLabel,
    required this.galleryLabel,
    required this.takePhotoLabel,
    required this.takePhotoSubtitle,
    required this.recordVideoLabel,
    required this.recordVideoSubtitle,
    required this.choosePhotoLabel,
    required this.chooseVideoLabel,
    required this.chooseFromGalleryLabel,
    required this.onCaptureImage,
    required this.onCaptureVideo,
    required this.onChoosePhotoFromGallery,
    required this.onChooseVideoFromGallery,
  });

  final String addMediaLabel;
  final String captureLabel;
  final String galleryLabel;
  final String takePhotoLabel;
  final String takePhotoSubtitle;
  final String recordVideoLabel;
  final String recordVideoSubtitle;
  final String choosePhotoLabel;
  final String chooseVideoLabel;
  final String chooseFromGalleryLabel;
  final VoidCallback onCaptureImage;
  final VoidCallback onCaptureVideo;
  final VoidCallback onChoosePhotoFromGallery;
  final VoidCallback onChooseVideoFromGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.medium),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Spacing.small,
        children: [
          StyledText.t3(
            addMediaLabel,
            isBold: true,
          ),
          _CustomSectionTitle(title: captureLabel),
          Row(
            spacing: Spacing.small,
            children: [
              Expanded(
                child: _OptionCard(
                  icon: Icons.camera_alt,
                  title: takePhotoLabel,
                  subtitle: takePhotoSubtitle,
                  onTap: onCaptureImage,
                ),
              ),
              Expanded(
                child: _OptionCard(
                  icon: Icons.video_camera_back,
                  title: recordVideoLabel,
                  subtitle: recordVideoSubtitle,
                  onTap: onCaptureVideo,
                ),
              ),
            ],
          ),
          _CustomSectionTitle(title: galleryLabel),
          Row(
            spacing: Spacing.small,
            children: [
              Expanded(
                child: _OptionCard(
                  icon: Icons.photo_library,
                  title: choosePhotoLabel,
                  subtitle: chooseFromGalleryLabel,
                  onTap: onChoosePhotoFromGallery,
                ),
              ),
              Expanded(
                child: _OptionCard(
                  icon: Icons.video_library,
                  title: chooseVideoLabel,
                  subtitle: chooseFromGalleryLabel,
                  onTap: onChooseVideoFromGallery,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomSectionTitle extends StatelessWidget {
  const _CustomSectionTitle({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: StyledText.b2(
        title,
        isBold: true,
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.onTap,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(RadiusSize.medium),
      child: Container(
        padding: const EdgeInsets.all(Spacing.medium),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusSize.medium),
        ),
        child: Column(
          spacing: Spacing.extraSmall,
          children: [
            Icon(
              icon,
              size: IconSize.medium,
              color: Theme.of(context).colorScheme.primary,
            ),
            StyledText.l2(
              title,
              textAlign: TextAlign.center,
              isBold: true,
            ),
            StyledText.l1(
              subtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
