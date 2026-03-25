import 'package:bloc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_app/features/auth/presentation/pages/login_page.dart';
import 'package:bloc_app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:bloc_app/features/splash/presentation/bloc/splash_event.dart';
import 'package:bloc_app/features/splash/presentation/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'app_routes.dart';

class AppRouter {
  static String get initial => AppRoutes.splash;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _material(
          BlocProvider(
            create: (_) =>
                GetIt.I<SplashBloc>()..add(const SplashEvent.started()),
            child: const SplashPage(),
          ),
        );

      case AppRoutes.login:
        return _material(
          BlocProvider(
            create: (_) => GetIt.I<AuthBloc>(),
            child: const LoginPage(),
          ),
        );

      // case AppRoutes.register:
      //   return _material(const RegisterPage());

      // case AppRoutes.home:
      //   return _material(const HomePage());

      default:
        return _errorRoute(settings.name);
    }
  }

  static MaterialPageRoute _material(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> _errorRoute(String? routeName) {
    return MaterialPageRoute(
      builder: (_) =>
          Scaffold(body: Center(child: Text('Route not found: $routeName'))),
    );
  }
}
