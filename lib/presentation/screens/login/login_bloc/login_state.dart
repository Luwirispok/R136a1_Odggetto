part of 'login_bloc.dart';

class LoginState {
  final String? email;
  final String? password;
  final bool isLoading;
  final ErrorState? error;

  LoginState({
    this.error,
    this.email,
    this.password,
    this.isLoading = false,
  });

  LoginState copyWith({
    ErrorState? error,
    String? email,
    String? password,
    bool? isLoading,
  }) {
    return LoginState(
      error: error,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? false,
    );
  }
}

class ErrorState {}

class NetworkError extends ErrorState {
  final String error;

  NetworkError({required this.error});
}

class NotLoginError extends ErrorState {
  final String error;

  NotLoginError({required this.error});
}
