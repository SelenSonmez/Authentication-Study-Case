// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//Since the API only has token value as a response in login endpoint, only field is token.
class UserModel {
  String? token;
  UserModel({this.token});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'token': token};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(token: map['token'] as String);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  String toString() {
    return "token: $token";
  }
}
