import 'package:bloc_app/features/auth/data/models/auth_response_model.dart';
import 'package:bloc_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase {
  final AuthRepo repo;

  LoginUseCase(this.repo);

  Future<AuthResponseModel> call(String username, String password) {
    return repo.login(username, password);
  }
}
