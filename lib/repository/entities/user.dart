import 'about_me.dart';
import 'job.dart';

class User {
  String? name;
  String? surname;
  String? patronymic;
  String? photoUrl;
  Job? job;
  AboutMe? aboutMe;

  User({this.name, this.surname, this.patronymic, this.photoUrl, this.job, this.aboutMe});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    patronymic = json['patronymic'];
    photoUrl = json['photoUrl'];
    job = json['job'] != null ? Job.fromJson(json['job']) : null;
    aboutMe = json['aboutMe'] != null ? AboutMe.fromJson(json['aboutMe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['patronymic'] = this.patronymic;
    data['photoUrl'] = this.photoUrl;
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }
    if (this.aboutMe != null) {
      data['aboutMe'] = this.aboutMe!.toJson();
    }
    return data;
  }
}
