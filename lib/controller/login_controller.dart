import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = true.obs;

  String? validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a email address';
    }
    if (value.contains('@')) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]');
      if (!emailRegex.hasMatch(value)) {
        return 'Enter a valid email';
      }
    } else {
      final phoneRegex = RegExp(r'^\d{10,15}$');
      if (!phoneRegex.hasMatch(value)) {
        return "Enter a valid phone number";
      }
    }
    return null;
  }

  final upperCaseRegex = RegExp(r'[A-Z]');
  final numberRegex = RegExp(r'\d');
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter you\'r password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (!upperCaseRegex.hasMatch(value) &&
        !numberRegex.hasMatch(value)) {
      return 'Password must be 1 number & 1 uppercase letter';
    }
    return null;
  }

  void onTapLoginButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Successful')));
    }
  }

  @override
  void dispose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.dispose();
  }
}
