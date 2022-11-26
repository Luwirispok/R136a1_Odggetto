class CheckItem {
  String? title;
  String? description;
  bool? completed;

  CheckItem({this.title, this.description, this.completed});

  CheckItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['completed'] = this.completed;
    return data;
  }
}