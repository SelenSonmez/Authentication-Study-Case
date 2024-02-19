import 'package:login_study_case/models/user_model.dart';
import 'package:login_study_case/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
Future<UserModel> userModel(
    UserModelRef ref, Map<String, dynamic> credentials) async {
  final user =
      await AuthService().login(credentials['email'], credentials['password']);
  print(user);
  return user;
}
