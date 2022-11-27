class Event {
  String? title;
  String? description;
  String? date;
  String? time;
  String? address;
  String? photoUrl;
  String? creatorId;
  List<String>? membersId;

  Event(
      {this.title,
      this.description,
      this.date,
      this.time,
      this.address,
      this.photoUrl,
      this.creatorId,
      this.membersId});

  Event.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    date = json['date'];
    time = json['time'];
    address = json['address'];
    photoUrl = json['photoUrl'];
    creatorId = json['creator'];
    membersId = json['members'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    data['time'] = this.time;
    data['address'] = this.address;
    data['photoUrl'] = this.photoUrl;
    data['creator'] = this.creatorId;
    data['members'] = this.membersId;
    return data;
  }
}
