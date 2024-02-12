import 'package:fiadisyon/features/auth/login/cubit/login_cubit.dart';
import 'package:fiadisyon/features/auth/register/cubit/register_cubit.dart';
import 'package:fiadisyon/product/state/container/product_state_items.dart';
import 'package:fiadisyon/product/state/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Ürün görünüm modeli için durum başlatıcı sınıfı.
///
/// Bu sınıf, ürün görünüm modeli için gereken durumu başlatır. Bu sınıf,
/// `MultiBlocProvider` ile sarmalanmış alt widget'a `ProductViewModel`'i sağlar ve böylece
/// alt öğelere erişim imkanı verir.
class StateInitialize extends StatelessWidget {
  /// Ürün görünüm modelini alt widget ağacına sağlar.
  const StateInitialize({
    required this.child,
    super.key,
  });

  /// Alt widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    /// `MultiBlocProvider` ile `ProductViewModel`'i sağlar.
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>.value(
          value: ProductStateItems.productViewModel,
        ),
        BlocProvider<LoginCubit>.value(
          value: ProductStateItems.loginCubit,
        ),
        BlocProvider<RegisterCubit>.value(
          value: ProductStateItems.registerCubit,
        ),
      ],
      child: child,
    );
  }
}
