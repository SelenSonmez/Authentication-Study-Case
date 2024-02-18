// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatarURL;
  String? password;
  UserModel(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.avatarURL,
      this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatarURL': avatarURL,
      'password': password
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'] as int,
        email: map['email'] as String,
        firstName: map['first_name'] as String,
        lastName: map['last_name'] as String,
        avatarURL: map['avatar'] as String,
        password: map['password'] as String);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
