import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.url,
    required this.fromPath,
    this.fit = BoxFit.contain,
  });

  final String url;
  final bool fromPath;
  final BoxFit fit;

  Widget _loadingBuilder(context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

  Widget _errorBuilder(context, error, stackTrace) {
    return Container(
      color: Colors.grey[200],
      child: const Icon(
        Icons.broken_image,
        color: Colors.grey,
        size: IconSize.large,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (fromPath) {
      return Image.file(
        File(url),
        fit: fit,
        errorBuilder: _errorBuilder,
      );
    }
    return Image.network(
      url,
      fit: fit,
      errorBuilder: _errorBuilder,
      loadingBuilder: _loadingBuilder,
    );
  }
}
