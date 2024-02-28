import 'package:auto_route/auto_route.dart';
import 'package:fiadisyon/features/auth/login/cubit/login_cubit.dart';
import 'package:fiadisyon/features/auth/register/cubit/register_cubit.dart';
import 'package:fiadisyon/product/navigation/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status == RegisterStatus.success) {
            context.router.popAndPush(const MainRoute());
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Username'),
                    onChanged: (value) => context
                        .read<RegisterCubit>()
                        .usernameController
                        .text = value,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    onChanged: (value) => context
                        .read<RegisterCubit>()
                        .emailController
                        .text = value,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    onChanged: (value) => context
                        .read<RegisterCubit>()
                        .passwordController
                        .text = value,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password Confirmation',
                    ),
                    onChanged: (value) => context
                        .read<RegisterCubit>()
                        .passwordConfirmationController
                        .text = value,
                  ),
                  if (state.status == RegisterStatus.loading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton(
                      onPressed: () async {
                        final response =
                            await context.read<RegisterCubit>().register();
                        if (response != null) {
                          if (!context.mounted) return;
                          final loginCubit = context.read<LoginCubit>();

                          await loginCubit.login(
                            state.email,
                            state.password,
                          );
                        }
                      },
                      child: const Text('Register'),
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
