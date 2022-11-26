part of 'registration_bloc.dart';

abstract class RegistrationEvent {}

class SurnameEvent extends RegistrationEvent {
  final String surname;
  SurnameEvent({required this.surname});
}

class NameEvent extends RegistrationEvent {
  final String name;
  NameEvent({required this.name});
}

class FatherNameEvent extends RegistrationEvent {
  final String fatherName;
  FatherNameEvent({required this.fatherName});
}

class EmailEvent extends RegistrationEvent {
  final String email;

  EmailEvent({required this.email});
}

class PasswordEvent extends RegistrationEvent {
  final String password;
  PasswordEvent({required this.password});
}

class SignUpEvent extends RegistrationEvent {}