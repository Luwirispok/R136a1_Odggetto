class AboutMe {
  String? city;
  String? description;
  List<String>? professionalSkills;
  List<String>? hobby;
  List<String>? facts;


  AboutMe({this.city, this.description, this.professionalSkills, this.hobby, this.facts});

  AboutMe.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    description = json['description'];
    professionalSkills = json['professional skills'].cast<String>();
    hobby = json['hobby'].cast<String>();
    facts = json['facts'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['city'] = this.city;
    data['description'] = this.description;
    data['professional skills'] = this.professionalSkills;
    data['hobby'] = this.hobby;
    data['facts'] = this.facts;
    return data;
  }
}
