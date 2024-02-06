import 'package:fiadisyon/product/state/base/base_cubit.dart';
import 'package:fiadisyon/product/state/viewmodel/product_state.dart';
import 'package:flutter/material.dart';

final class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel() : super(const ProductState());

  /// Change the theme mode of the app.
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
