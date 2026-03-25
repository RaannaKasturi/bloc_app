import 'package:dio/dio.dart';
import '../env/env.dart';

class DioClient {
  final Dio dio;

  DioClient._(this.dio);

  factory DioClient.create({required List<Interceptor> interceptors}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.addAll(interceptors);

    return DioClient._(dio);
  }
}
