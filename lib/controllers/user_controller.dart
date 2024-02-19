import 'package:login_study_case/models/atendee_model.dart';
import 'package:login_study_case/models/user_model.dart';
import 'package:login_study_case/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

// Controller for managing the UserModel and AtendeeModel data with the service class. Providers UserModelProvider and AttendeeModelProvider
// are already generated with @riverpod annotation.
@riverpod
Future<UserModel> userModel(
    UserModelRef ref, Map<String, dynamic> credentials) async {
  final user =
      await AuthService().login(credentials['email'], credentials['password']);
  return user;
}

@riverpod
Future<List<AtendeeModel>> attendeeModel(AttendeeModelRef ref) async {
  List<AtendeeModel> atendees = await AuthService().fetchUsers();
  return atendees;
}
