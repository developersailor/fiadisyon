/// A mixin representing a cache model.
mixin CacheModel {
  /// Gets the ID of the cache model.
  String get id;

  /// Converts the cache model from JSON.
  CacheModel fromDynamicJson(dynamic json);

  /// Converts the cache model to JSON.
  Map<String, dynamic>? toJson();
}
