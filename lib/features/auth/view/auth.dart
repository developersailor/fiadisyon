import 'package:auto_route/auto_route.dart';
import 'package:fiadisyon/features/auth/login/view/login_view.dart';
import 'package:fiadisyon/features/auth/register/view/register_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Register'),
              //Tab(text: 'Forgot Password'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LoginView(),
            RegisterView(),
            //ForgotPasswordView(),
          ],
        ),
      ),
    );
  }
}
