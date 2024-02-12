import 'package:fiadisyon/features/auth/login/cubit/login_cubit.dart';
import 'package:fiadisyon/features/auth/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status == RegisterStatus.success) {
            Navigator.of(context).pop();
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
                    onChanged: (value) =>
                        context.read<RegisterCubit>().usernameChanged(value),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    onChanged: (value) =>
                        context.read<RegisterCubit>().emailChanged(value),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    onChanged: (value) =>
                        context.read<RegisterCubit>().passwordChanged(value),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password Confirmation',
                    ),
                    onChanged: (value) => context
                        .read<RegisterCubit>()
                        .passwordConfirmationChanged(value),
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

                          await loginCubit.login();
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
