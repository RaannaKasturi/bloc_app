import 'package:dio/dio.dart';
import '../../storage/shared_prefs/shared_prefs_service.dart';

class AuthInterceptor extends Interceptor {
  final SharedPrefsService prefs;

  AuthInterceptor(this.prefs);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = prefs.getAccessToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
