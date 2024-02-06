import 'package:auto_route/auto_route.dart';
import 'package:fiadisyon/product/cache/model/token_cache_model.dart';
import 'package:fiadisyon/product/navigation/app_router.gr.dart';
import 'package:fiadisyon/product/state/base/base_state.dart';
import 'package:fiadisyon/product/state/container/product_state_items.dart';
import 'package:fiadisyon/product/widget/checkbox/kvkk_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fiadisyon/features/auth/login/cubit/login_cubit.dart';
import 'package:fiadisyon/product/cache/product_cache.dart';
import 'package:fiadisyon/product/widget/button/product_button.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  late final LoginCubit _loginCubit;
  late final ProductCache _productCache;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _autovalidateMode = AutovalidateMode.onUserInteraction;

  @override
  void initState() {
    super.initState();
    _loginCubit = ProductStateItems.loginCubit;
    _productCache = ProductStateItems.productCache;
    // token cache olarak tutulduğunda login aşaması başlamadan önce token cache kontrol edilir.
    if (_productCache.tokenCacheOperation.get('fiskindal') != null) {
      context.router.replace(const MainRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginCubit,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            context.router.replace(const MainRoute());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            _loginCubit.emailChanged(value);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email',
                          ),
                        ),
                        TextField(
                          onChanged: (value) {
                            _loginCubit.passwordChanged(value);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                        Checkbox(
                          value: state.rememberMe,
                          onChanged: (value) {
                            _loginCubit.rememberMeChanged(value: value);
                          },
                        ),
                        //KvkkCheckBox(_autovalidateMode),
                        ProductButton(
                          onPressed: () async {
                            final data = await _loginCubit.login();
                            if (data != null) {
                              _productCache.tokenCacheOperation
                                  .add(TokenCacheModel(token: data));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.onSurface,
                          ),
                          child: const Text('Giriş yap'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
