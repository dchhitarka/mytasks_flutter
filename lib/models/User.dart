import 'dart:convert';

class User {
  int id;
  String username;
  String email;
  String bio;

  User(Map data) {
    this.id = data['id'];
    this.username = data['username'];
    this.email = data['email'];
  }

  User.fromJSON(String jsonData) {
    Map data = jsonDecode(jsonData);
    this.id = data['id'];
    this.username = data['username'];
    this.email = data['email'];
  }
}
