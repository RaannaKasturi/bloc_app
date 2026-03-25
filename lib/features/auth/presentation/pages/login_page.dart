import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/app_routes.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LoginView();
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.splash,
              (_) => false,
            );
          },
          error: (msg) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(msg)));
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(controller: usernameCtrl),
              TextField(controller: passwordCtrl, obscureText: true),
              const SizedBox(height: 20),

              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final loading = state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );
                  return ElevatedButton(
                    onPressed: loading
                        ? null
                        : () {
                            context.read<AuthBloc>().add(
                              AuthEvent.login(
                                username: usernameCtrl.text,
                                password: passwordCtrl.text,
                              ),
                            );
                          },
                    child: loading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
