import '../data/api_service.dart';

class LoginRepository {
  LoginRepository({required this.apiService});

  final ApiService apiService;

  Future<bool> login({
    required String email,
    required String password,
  }) {
    return apiService.login(email: email, password: password);
  }
}

