import 'package:core/core.dart';
import 'package:fiadisyon/features/auth/login/cubit/login_cubit.dart';
import 'package:fiadisyon/features/auth/register/cubit/register_cubit.dart';
import 'package:fiadisyon/product/cache/product_cache.dart';
import 'package:fiadisyon/product/network/manager/product_service_manager.dart';
import 'package:fiadisyon/product/state/viewmodel/product_view_model.dart';
import 'package:get_it/get_it.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt
      ..registerSingleton(ProductCache(cacheManager: HiveCacheManager()))
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base())
      ..registerLazySingleton<ProductViewModel>(
        ProductViewModel.new,
      )
      ..registerLazySingleton<LoginCubit>(
        LoginCubit.new,
      )
      ..registerLazySingleton<RegisterCubit>(
        RegisterCubit.new,
      );
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
