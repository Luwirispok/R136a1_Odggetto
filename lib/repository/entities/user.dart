import 'about_me.dart';
import 'job.dart';

class UserOd {
  String? name;
  String? surname;
  String? patronymic;
  String? photoUrl;
  Job? job;
  AboutMe? aboutMe;

  UserOd({this.name, this.surname, this.patronymic, this.photoUrl, this.job, this.aboutMe});

  UserOd.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['sureName'];
    patronymic = json['patronymic'];
    photoUrl = json['photoUrl'];
    job = json['job'] != null ? Job.fromJson(json['job']) : null;
    aboutMe = json['aboutMe'] != null ? AboutMe.fromJson(json['aboutMe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['sureName'] = this.surname;
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
