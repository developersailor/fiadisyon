import 'package:core/core.dart';
import 'package:fiadisyon/product/cache/model/token_cache_model.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [TokenCacheModel.empty()],
    );
  }

  late final HiveCacheOperation<TokenCacheModel> tokenCacheOperation =
      HiveCacheOperation<TokenCacheModel>();
  // late final HiveCacheOperation<UserCacheModel> userCacheOperation =
  //     HiveCacheOperation<UserCacheModel>();
}
