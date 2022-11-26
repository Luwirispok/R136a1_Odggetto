class UserSignUp {
  String name;
  String email;
  String surname;
  String? patronymic;

  UserSignUp({required this.name, required this.email, required this.surname, this.patronymic});

  factory UserSignUp.fromJson(Map<String, dynamic> json) => UserSignUp(
        name: json['name'],
        email: json['email'],
        surname: json['surname'],
        patronymic: json['patronymic'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['surname'] = this.surname;
    data['patronymic'] = this.patronymic;
    return data;
  }
}