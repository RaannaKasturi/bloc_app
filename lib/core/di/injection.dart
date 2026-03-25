import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// ignore: unused_import
import 'register_module.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
}
