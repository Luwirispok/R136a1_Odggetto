part of 'registration_bloc.dart';

class RegistrationState {
  String? surname;
  String? name;
  String? fatherName;
  EmailForm email;
  PasswordForm password;
  ErrorRegState? error;
  bool isLoading;

  RegistrationState({
    this.surname,
    this.name,
    this.fatherName,
    required this.email,
    required this.password,
    this.isLoading = false,
    this.error,
  });

  RegistrationState copyWith({
    String? surname,
    String? name,
    String? fatherName,
    EmailForm? email,
    PasswordForm? password,
    bool? isLoading,
    ErrorRegState? error,
  }) {
    return RegistrationState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      fatherName: fatherName ?? this.fatherName,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? false,
      error: error,
    );
  }
}

class SuccessState extends RegistrationState{
  SuccessState({required super.email, required super.password});
}

// class BlankPasswordAndMailFields extends RegistrationState {}
//
// class NetworkError extends RegistrationState {
//   String error;
//
//   NetworkError({required this.error});
// }

class ErrorRegState{}

class NetworkError extends ErrorRegState{
  final String error;

  NetworkError({required this.error});
}

class NotValidError extends ErrorRegState{
  final String error;

  NotValidError({required this.error});
}