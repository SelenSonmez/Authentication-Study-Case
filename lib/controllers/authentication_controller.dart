import 'package:flutter/material.dart';
import 'package:login_study_case/models/user_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AuthenticationController extends ControllerMVC {
  var scaffoldKey = GlobalKey<ScaffoldState>(); //screen
  var formKey = GlobalKey<FormState>(); //forms

  late UserModel userModel;
  AuthenticationController() {
    userModel = UserModel();
  }

  void formValidate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }
}
