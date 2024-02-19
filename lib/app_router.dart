import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_study_case/controllers/token_preference_controller.dart';
import 'package:login_study_case/views/atendee_list.dart';
import 'package:login_study_case/views/login_screen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Routes of the application are listed.
enum AppRoutes {
  login('/login'),
  atendeeList('/atendeeList');

  const AppRoutes(this.path);
  final String path;
}

// Error page in case of any errors.
Page errorPage(BuildContext context, GoRouterState state) {
  return CupertinoPage<Widget>(
    child: const Scaffold(),
    key: state.pageKey,
  );
}

// Router class  that handles all routes and their transitions.
class AppRouter {
  AppRouter(this.ref);
  final Ref ref;

  GoRouter get router {
    return GoRouter(
      errorPageBuilder: errorPage,
      initialLocation: AppRoutes.login.path,
      routes: [
        GoRoute(
          path: AppRoutes.login.path,
          name: AppRoutes.login.name,
          pageBuilder: (context, state) => CupertinoPage<LoginScreenView>(
            child: const LoginScreenView(),
            key: state.pageKey,
            restorationId: state.pageKey.value,
          ),
        ),
        GoRoute(
          path: AppRoutes.atendeeList.path,
          name: AppRoutes.atendeeList.name,
          pageBuilder: (context, state) => CupertinoPage<AttendeeListView>(
            child: const AttendeeListView(),
            key: state.pageKey,
            restorationId: state.pageKey.value,
          ),
        ),
      ],
      // Redirect to the attendeeList Screen if user is already logged in by checking the tokene existance.
      redirect: (context, state) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.clear();
        WidgetsFlutterBinding.ensureInitialized();
        String? token = await TokenPreferenceController.getToken();
        if (token != null) {
          return AppRoutes.atendeeList.path;
        }
        return null;
      },
    );
  }

  static final goRouterProvider = Provider<GoRouter>((ref) {
    return AppRouter(ref).router;
  });
}
