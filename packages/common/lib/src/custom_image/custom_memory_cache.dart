/// Custom memory cache for using network image
final class CustomMemoryCache {
  /// [height] and [width] is used for caching image
  const CustomMemoryCache({required this.height, required this.width});

  /// memCacheHeight
  final int height;

  /// memCacheWidth
  final int width;
}
