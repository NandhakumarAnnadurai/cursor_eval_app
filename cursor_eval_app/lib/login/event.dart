abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  LoginSubmitted({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

