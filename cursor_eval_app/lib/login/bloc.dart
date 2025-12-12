import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'login_repository.dart';
import 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.loginRepository}) : super(LoginState.initial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final LoginRepository loginRepository;

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final didLogin = await loginRepository.login(
        email: event.email,
        password: event.password,
      );

      if (didLogin) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Login failed.',
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}

