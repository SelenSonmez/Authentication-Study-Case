import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_study_case/controllers/auth_controller.dart';
import 'package:login_study_case/controllers/authentication_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenView extends ConsumerStatefulWidget {
  const LoginScreenView({super.key});

  @override
  LoginScreenViewState createState() => LoginScreenViewState();
}

class LoginScreenViewState extends ConsumerState<LoginScreenView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    // Get device width and height for responsive design
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    void handleLogin() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        Map<String, dynamic> credentials = {
          'email': _emailController.text,
          'password': _passwordController.text,
        };
        final userModel =
            await ref.watch(userModelProvider(credentials).future);
      }
    }

    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Container(color: Colors.grey.shade300),

          //Purple header with rounded corners
          Container(
            height: MediaQuery.of(context).size.height / 2.75,
            decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),

          //Sign in text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 130),
            child: Text(
              "Sign In",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),

          //Form container at the center
          Align(
            alignment: Alignment.center,
            child: Container(
              width: deviceWidth / 1.1,
              height: deviceHeight / 2.5,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator: (value) =>
                              value!.isEmpty ? "username can't be empty" : null,
                          decoration: const InputDecoration(
                              label: Text("username"),
                              icon: Icon(Icons.people)),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) =>
                              value!.isEmpty ? "password can't be empty" : null,
                          decoration: const InputDecoration(
                              label: Text("password"), icon: Icon(Icons.lock)),
                        ),

                        //Sign in button
                        ElevatedButton(
                          onPressed: () async => handleLogin(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade100,
                              minimumSize:
                                  Size(deviceWidth / 1.1, deviceHeight / 15)),
                          child: const Text("Sign In"),
                        )
                      ]),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
