import 'package:flutter/material.dart';
import 'package:login_study_case/controllers/authentication_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends StateMVC<LoginScreenView> {
  late AuthenticationController _authenticationController;

  _LoginScreenViewState() : super(AuthenticationController()) {
    _authenticationController = controller as AuthenticationController;
  }
  @override
  Widget build(BuildContext context) {
    // Get device width and height for responsive design
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _authenticationController.scaffoldKey,
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
                  key: _authenticationController.formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? "username can't be empty" : null,
                          onSaved: (newValue) {
                            _authenticationController.userModel.firstName =
                                newValue;
                          },
                          decoration: const InputDecoration(
                              label: Text("username"),
                              icon: Icon(Icons.people)),
                        ),
                        TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? "password can't be empty" : null,
                          onSaved: (newValue) {
                            _authenticationController.userModel.password =
                                newValue;
                          },
                          decoration: const InputDecoration(
                              label: Text("password"), icon: Icon(Icons.lock)),
                        ),

                        //Sign in button
                        ElevatedButton(
                          onPressed: () {
                            _authenticationController.formValidate();
                          },
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
