class MediaFile {
  MediaFile({
    required this.path,
    required this.name,
    required this.mimeType,
    required this.size,
    required this.bytesGetter,
  });

  final String path;
  final String name;
  final String mimeType;
  final int size;
  final Future<List<int>> Function() bytesGetter;

  bool get isImage => mimeType.contains('image');

  Future<List<int>> readBytes() => bytesGetter();
}
