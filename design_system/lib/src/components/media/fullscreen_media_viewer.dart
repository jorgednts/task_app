import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'custom_video_player.dart';

class FullscreenMediaViewer extends StatelessWidget {
  const FullscreenMediaViewer(
    this.url, {
    super.key,
    required this.fromPath,
    required this.isImage,
  });

  final String url;
  final bool fromPath;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(bottom: Spacing.small),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusSize.large),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.all(Spacing.small),
                child: CloseButton(),
              ),
              Expanded(
                child: isImage
                    ? InteractiveViewer(
                        panEnabled: true,
                        minScale: 0.8,
                        maxScale: 4,
                        child: CustomImage(
                          url: url,
                          fromPath: fromPath,
                        ),
                      )
                    : CustomVideoPlayer(url, fromPath: fromPath),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
