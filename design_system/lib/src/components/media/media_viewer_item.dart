import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

sealed class MediaItemType {
  const MediaItemType(this.fromPath);

  final bool fromPath;
}

class MediaItemTypeImage extends MediaItemType {
  const MediaItemTypeImage(super.fromPath);
}

class MediaItemTypeVideo extends MediaItemType {
  const MediaItemTypeVideo(super.fromPath);
}

class MediaViewerItem extends StatelessWidget {
  const MediaViewerItem({
    super.key,
    required this.url,
    required this.type,
    this.onRemove,
    this.onTap,
  });

  final String url;
  final MediaItemType type;
  final VoidCallback? onRemove;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isImage = type is MediaItemTypeImage;
    final isSmall =
        MediaQuery.sizeOf(context).width < WidthResponsiveBreakpoints.small;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isSmall ? 100 : 120,
        height: isSmall ? 100 : 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusSize.medium),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(RadiusSize.medium),
                child: isImage
                    ? CustomImage(
                        url: url,
                        fromPath: type.fromPath,
                      )
                    : Container(
                        color: Colors.grey[200],
                        child: const Stack(
                          children: [
                            Center(
                              child: Icon(
                                Icons.play_circle_outline,
                                color: Colors.grey,
                                size: IconSize.extraLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(Spacing.extraSmall),
                margin: const EdgeInsets.all(Spacing.extraSmall / 2),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(RadiusSize.small),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isImage ? Icons.image : Icons.play_circle_outline,
                      color: Theme.of(context).colorScheme.surface,
                      size: IconSize.extraSmall,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: onRemove,
                child: Container(
                  padding: const EdgeInsets.all(Spacing.extraSmall),
                  margin: const EdgeInsets.all(Spacing.extraSmall / 2),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.error.withValues(alpha: 0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.onError,
                    size: IconSize.extraSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
