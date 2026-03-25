import 'package:bloc_app/core/routes/app_router.dart';
import 'package:flutter/material.dart';

import 'core/di/injection.dart';
import 'core/storage/hive/hive_service.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init local storage
  await HiveService.init();
  // Init dependency injection
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.initial,
    );
  }
}
