import 'dart:convert';

class Item {
  String title;
  DateTime createdAt;
  int task;
  int id;
  bool status;

  Item({this.id, this.title, this.task, this.createdAt, this.status});

  Item.fromJSON(data) {
    var item = jsonDecode(data);
    this.title = item["title"];
    this.id = item["id"];
    this.task = item["task"];
    this.status = item["status"];
    this.createdAt = item["created_at"];
  }

  toJSON() {
    return {
      "title": this.title,
      "task": this.task,
      "status": this.status,
    };
  }
}
