import 'package:auto_route/auto_route.dart';
import 'package:fiadisyon/features/auth/forgotpassword/cubit/forgot_password_cubit.dart';
import 'package:fiadisyon/product/state/base/base_state.dart';
import 'package:fiadisyon/product/state/container/product_state_items.dart';
import 'package:fiadisyon/product/widget/button/product_button.dart';
import 'package:fiadisyon/product/widget/error/show_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends BaseState<ForgotPasswordView> {
  late final ForgotPasswordCubit _forgotPasswordCubit;

  final emailController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _forgotPasswordCubit = ProductStateItems.forgotPasswordCubit;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _forgotPasswordCubit,
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            showErrorMessage(context, state.errorMessage);
          }
          if (state.status.isSuccess) {
            context.router.pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Forgot Password'),
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
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProductButton(
                        onPressed: () {
                          _forgotPasswordCubit.forgotPassword(
                            email: emailController.text,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 20,
                          ),
                        ),
                        child: const Text('Send Reset Link'),
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
