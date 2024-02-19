import 'dart:convert';

class AtendeeModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  AtendeeModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "avatar": avatar
    };
  }

  factory AtendeeModel.fromMap(Map<String, dynamic> map) {
    return AtendeeModel(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AtendeeModel.fromJson(String source) =>
      AtendeeModel.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  String toString() {
    return "id: $id email: $email firstName: $firstName lastName: $lastName avatar: $avatar";
  }
}
