import 'package:dio/dio.dart';

import '../config/app_environment.dart';

class ApiService {
  ApiService({
    Dio? dioClient,
    String? baseUrlOverride,
  })  : baseUrl = baseUrlOverride ?? AppEnvironmentManager.config.baseUrl,
        dio = dioClient ??
            Dio(
              BaseOptions(
                baseUrl: baseUrlOverride ?? AppEnvironmentManager.config.baseUrl,
              ),
            );

  final Dio dio;
  final String baseUrl;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      '/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}

