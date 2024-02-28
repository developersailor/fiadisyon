import 'package:fiadisyon/features/auth/forgotpassword/cubit/forgot_password_cubit.dart';
import 'package:fiadisyon/features/auth/login/cubit/login_cubit.dart';
import 'package:fiadisyon/features/auth/register/cubit/register_cubit.dart';
import 'package:fiadisyon/product/cache/product_cache.dart';
import 'package:fiadisyon/product/network/manager/product_service_manager.dart';
import 'package:fiadisyon/product/state/container/product_state_container.dart';
import 'package:fiadisyon/product/state/viewmodel/product_view_model.dart';

/// A container class for accessing various product-related state items.
final class ProductStateItems {
  const ProductStateItems._();

  /// Retrieves the [ProductNetworkManager] instance from the [ProductContainer].
  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  /// Retrieves the [ProductViewModel] instance from the [ProductContainer].
  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();
  static ProductCache get productCache => ProductContainer.read<ProductCache>();
  static LoginCubit get loginCubit => ProductContainer.read<LoginCubit>();
  static RegisterCubit get registerCubit =>
      ProductContainer.read<RegisterCubit>();
  static ForgotPasswordCubit get forgotPasswordCubit =>
      ProductContainer.read<ForgotPasswordCubit>();
}
