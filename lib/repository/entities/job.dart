class Job {
  String? jobTitle;
  String? grade;
  List<String>? projects;
  String? team;

  Job({
    this.jobTitle,
    this.grade,
    this.projects,
    this.team,
  });

  Job.fromJson(Map<String, dynamic> json) {
    jobTitle = json['jobTitle'];
    grade = json['grade'];
    projects = json['projects'].cast<String>();
    team = json['team'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['jobTitle'] = this.jobTitle;
    data['grade'] = this.grade;
    data['projects'] = this.projects;
    data['team'] = this.team;
    return data;
  }
}
