// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_app/core/di/register_module.dart' as _i267;
import 'package:bloc_app/core/network/api_client.dart' as _i544;
import 'package:bloc_app/core/storage/shared_prefs/shared_prefs_service.dart'
    as _i385;
import 'package:bloc_app/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i307;
import 'package:bloc_app/features/auth/data/repo/auth_repo_impl.dart' as _i568;
import 'package:bloc_app/features/auth/domain/repo/auth_repo.dart' as _i794;
import 'package:bloc_app/features/auth/domain/usecases/login_usecase.dart'
    as _i83;
import 'package:bloc_app/features/auth/presentation/bloc/auth_bloc.dart'
    as _i33;
import 'package:bloc_app/features/splash/presentation/bloc/splash_bloc.dart'
    as _i181;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i385.SharedPrefsService>(
        () => _i385.SharedPrefsService(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i544.ApiClient>(() => _i544.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i181.SplashBloc>(
        () => _i181.SplashBloc(gh<_i385.SharedPrefsService>()));
    gh.lazySingleton<_i307.AuthRemoteDataSource>(
        () => _i307.AuthRemoteDataSource(gh<_i544.ApiClient>()));
    gh.lazySingleton<_i794.AuthRepo>(
        () => _i568.AuthRepoImpl(gh<_i307.AuthRemoteDataSource>()));
    gh.lazySingleton<_i83.LoginUseCase>(
        () => _i83.LoginUseCase(gh<_i794.AuthRepo>()));
    gh.factory<_i33.AuthBloc>(() => _i33.AuthBloc(
          gh<_i83.LoginUseCase>(),
          gh<_i385.SharedPrefsService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i267.RegisterModule {}
