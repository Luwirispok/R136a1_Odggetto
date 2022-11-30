class CheckItem {
  String? title;
  String? description;
  bool? completed;

  CheckItem({this.title, this.description, this.completed});

  CheckItem.fromJson(Map<String, dynamic> json) {
    title = json['checkTitle'];
    description = json['description'];
    completed = json['flagCheck'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['checkTitle'] = this.title;
    data['description'] = this.description;
    data['flagCheck'] = this.completed;
    return data;
  }
}