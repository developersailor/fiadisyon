import 'package:auto_route/auto_route.dart';
import 'package:fiadisyon/features/auth/login/cubit/login_cubit.dart';
import 'package:fiadisyon/product/cache/model/token_cache_model.dart';
import 'package:fiadisyon/product/cache/product_cache.dart';
import 'package:fiadisyon/product/navigation/app_router.gr.dart';
import 'package:fiadisyon/product/state/base/base_state.dart';
import 'package:fiadisyon/product/state/container/product_state_items.dart';
import 'package:fiadisyon/product/widget/button/product_button.dart';
import 'package:fiadisyon/product/widget/error/show_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  late final LoginCubit _loginCubit;
  late final ProductCache _productCache;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loginCubit = ProductStateItems.loginCubit;
    _productCache = ProductStateItems.productCache;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginCubit,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            showErrorMessage(context, state.errorMessage);
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
                  Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          emailController.text = value;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          passwordController.text = value;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: state.rememberMe,
                            onChanged: (value) {
                              _loginCubit.rememberMeChanged(value: value);
                            },
                            semanticLabel: 'Remember me',
                          ),
                          const Text('Remember me'),
                        ],
                      ),
                      //KvkkCheckBox(_autovalidateMode),
                      ProductButton(
                        onPressed: () async {
                          if (_productCache.tokenCacheOperation
                                  .get('fiskindal')
                                  ?.token !=
                              null) {
                            await context.router.popAndPush(const MainRoute());
                            return;
                          }
                          final response = await _loginCubit.login(
                            emailController.text,
                            passwordController.text,
                          );
                          if (response?.authResponse != null) {
                            final tokenCacheModel = TokenCacheModel(
                              token: response?.authResponse,
                            );
                            if (state.rememberMe == true) {
                              _productCache.tokenCacheOperation.add(
                                tokenCacheModel,
                              );
                            }
                            if (!context.mounted) return;
                            await context.router.popAndPush(const MainRoute());
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
