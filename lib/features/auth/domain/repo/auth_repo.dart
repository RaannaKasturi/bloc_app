import 'package:bloc_app/features/auth/data/models/auth_response_model.dart';

abstract class AuthRepo {
  Future<AuthResponseModel> login(String username, String password);
}
