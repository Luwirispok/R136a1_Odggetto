class UserSignUp {
  UserSignUp({
    required this.name,
    required this.email,
    required this.surname,
    this.patronymic,
  });

  final String name;
  final String email;
  final String surname;
  final String? patronymic;
}

