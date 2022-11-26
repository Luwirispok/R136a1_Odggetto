part of 'login_bloc.dart';

abstract class LoginEvent {}

class SendClickedEnterEvent extends LoginEvent {}

class EmailEvent extends LoginEvent {
  final String email;

  EmailEvent({required this.email});
}

class PasswordEvent extends LoginEvent {
  final String password;

  PasswordEvent({required this.password});
}

