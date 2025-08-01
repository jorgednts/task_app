import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MediaViewerType {
  const MediaViewerType.fromPath(
    this.url, {
    required this.isImage,
  }) : fromPath = true;

  const MediaViewerType.fromUrl(
    this.url, {
    required this.isImage,
  }) : fromPath = false;
  final bool fromPath;
  final bool isImage;
  final String url;
}

class TaskMediaViewer extends StatelessWidget {
  const TaskMediaViewer({
    super.key,
    required this.media,
    required this.label,
    required this.onDeleteItem,
  });

  final List<MediaViewerType> media;
  final String label;
  final void Function(int index) onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Spacing.small,
      children: [
        StyledText.b3(
          label,
          isBold: true,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.center,
          spacing: Spacing.medium,
          runSpacing: Spacing.medium,
          children: media
              .map(
                (item) => MediaViewerItem(
                  url: item.url,
                  type: item.isImage
                      ? MediaItemTypeImage(item.fromPath)
                      : MediaItemTypeVideo(item.fromPath),
                  onTap: () {
                    CustomModalBottomSheet.show(
                      context,
                      boxConstraints: BoxConstraints(
                        maxHeight: min(
                          MediaQuery.sizeOf(context).height * 0.8,
                          HeightResponsiveBreakpoints.large,
                        ),
                      ),
                      child: FullscreenMediaViewer(
                        item.url,
                        fromPath: item.fromPath,
                        isImage: item.isImage,
                      ),
                    );
                  },
                  onRemove: () => onDeleteItem(media.indexOf(item)),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
