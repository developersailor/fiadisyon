import 'package:core/src/cache/core/cache_model.dart';

/// An abstract class representing a cache operation.
///
/// This class defines the basic operations that can be performed on a cache,
/// such as adding items, removing items, clearing the cache, and retrieving items.
///
/// The type parameter `T` represents the type of the cache model.
abstract class CacheOperation<T extends CacheModel> {
  /// Adds an item to the cache.
  void add(T item);

  /// Adds a list of items to the cache.
  void addAll(List<T> items);

  /// Removes an item from the cache based on its ID.
  void remove(String id);

  /// Clears the cache, removing all items.
  void clear();

  /// Retrieves all items from the cache.
  List<T> getAll();

  /// Retrieves an item from the cache based on its ID.
  /// Returns `null` if the item is not found.
  T? get(String id);
}
