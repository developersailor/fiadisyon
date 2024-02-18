import 'package:easy_localization/easy_localization.dart';
import 'package:fiadisyon/product/init/application_initialize.dart';
import 'package:fiadisyon/product/init/product_localization.dart';
import 'package:fiadisyon/product/init/state_initialize.dart';
import 'package:fiadisyon/product/navigation/app_router.dart';
import 'package:fiadisyon/product/state/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme/theme.dart';
import 'package:widgets/widgets.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: const StateInitialize(child: _MyApp())));
}

final class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: CustomResponsive.build,
      theme: MaterialTheme(GoogleFonts.robotoTextTheme()).light(),
      darkTheme: MaterialTheme(GoogleFonts.robotoTextTheme()).dark(),
      themeMode: context.watch<ProductViewModel>().state.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
