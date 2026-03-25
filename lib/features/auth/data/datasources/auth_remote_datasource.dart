import 'package:injectable/injectable.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/auth_response_model.dart';

@lazySingleton
class AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSource(this.client);

  Future<AuthResponseModel> login({
    required String username,
    required String password,
  }) async {
    final res = await client.post(
      ApiConstants.login,
      data: {'username': username, 'password': password},
    );

    return AuthResponseModel.fromJson(res.data);
  }
}
