import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_study_case/controllers/preferences.dart';
import 'package:login_study_case/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String apiUrl = "https://reqres.in/api";

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/login'),
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        final userModel = UserModel.fromJson(response.body);
        PreferenceManager.setToken(userModel.token!);
        return UserModel.fromJson(response.body);
      } else {
        // print("BURDASIN ŞU ANAA");
        throw Exception("An error occured in logging process");
      }
    } catch (error) {
      throw Exception("An error occured in logging process");
    }
  }
}
