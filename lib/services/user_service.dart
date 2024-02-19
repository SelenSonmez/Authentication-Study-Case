import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_study_case/controllers/token_preference_controller.dart';
import 'package:login_study_case/models/atendee_model.dart';
import 'package:login_study_case/models/user_model.dart';

class AuthService {
  final String apiUrl = "https://reqres.in/api";

  // Login method to  authenticate user in the system with email and password. Response token is saved to SharedPreferences.
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        final userModel = UserModel.fromJson(response.body);
        TokenPreferenceController.setToken(userModel.token!);
        return UserModel.fromJson(response.body);
      } else {
        throw Exception("User not found");
      }
    } catch (error) {
      throw Exception("User not found");
    }
  }

  // Fetching atendee list from API.
  Future<List<AtendeeModel>> fetchUsers() async {
    List<AtendeeModel> atendees = [];
    try {
      final response =
          await http.get(Uri.parse('$apiUrl/users?page=1&per_page=12'));

      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);
        Iterable l = decodedJson['data'];
        atendees = List<AtendeeModel>.from(
            l.map((model) => AtendeeModel.fromMap(model)));
      } else {
        throw Exception('Failed to load atendees');
      }
    } catch (e) {
      throw Exception("Failed to load atendees");
    }

    return atendees;
  }
}
