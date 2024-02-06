import 'package:core/src/cache/core/cache_model.dart';

/// An abstract class representing a cache manager.
abstract class CacheManager {
  /// Creates a new instance of [CacheManager] with the given [path].
  CacheManager({this.path});

  /// The path where the cache is stored.
  final String? path;

  /// Initializes the cache manager with the provided [items].
  Future<void> init({
    required List<CacheModel> items,
  });

  /// Removes the cache.
  void remove();
}
