import 'dart:convert';

class Task {
  String title;
  DateTime createdAt;
  int user;
  int id;

  Task({this.id, this.title, this.user, this.createdAt});

  Task.fromJSON(data) {
    var task = jsonDecode(data);
    this.title = task["title"];
    this.id = task["id"];
    this.user = task["user"];
    this.createdAt = task["created_at"];
  }
}
