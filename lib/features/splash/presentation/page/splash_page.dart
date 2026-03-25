import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SplashView();
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        // state.whenOrNull(
        //   authenticated: () {
        //     Navigator.pushNamedAndRemoveUntil(
        //       context,
        //       AppRoutes.home,
        //       (route) => false,
        //     );
        //   },
        //   unauthenticated: () {
        //     Navigator.pushNamedAndRemoveUntil(
        //       context,
        //       AppRoutes.login,
        //       (route) => false,
        //     );
        //   },
        // );
      },
      child: const Scaffold(body: Center(child: _SplashAnimation())),
    );
  }
}

class _SplashAnimation extends StatelessWidget {
  const _SplashAnimation();

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/splash.json',
      onLoaded: (composition) async {
        await Future.delayed(
          composition.duration + const Duration(seconds: 1),
          () {
            if (!context.mounted) return;
            final bloc = context.read<SplashBloc>();
            final state = bloc.state;
            state.whenOrNull(
              authenticated: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (_) => false,
                );
              },
              unauthenticated: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (_) => false,
                );
              },
            );
          },
        );
      },
      width: 200,
      height: 200,
      fit: BoxFit.contain,
    );
  }
}
