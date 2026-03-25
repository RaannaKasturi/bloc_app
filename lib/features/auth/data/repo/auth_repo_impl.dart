import 'package:bloc_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:bloc_app/features/auth/data/models/auth_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repo/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remote;

  AuthRepoImpl(this.remote);

  @override
  Future<AuthResponseModel> login(String username, String password) {
    return remote.login(username: username, password: password);
  }
}
