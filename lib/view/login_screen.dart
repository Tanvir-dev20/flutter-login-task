import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:login_app/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background_image2.jpg',
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Form(
                  key: loginController.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        'Get Started With',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: loginController.emailTEController,
                        decoration: InputDecoration(hintText: 'Email'),
                        validator:
                            (value) =>
                                loginController.validateEmailOrPhone(value),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: loginController.passwordTEController,
                          obscureText: loginController.isPasswordVisible.value,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                loginController.isPasswordVisible.toggle();
                              },
                              icon: Icon(
                                loginController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          validator:
                              (value) =>
                                  loginController.validatePassword(value),
                        ),
                      ),
                      const SizedBox(height: 12),
                      FilledButton(
                        onPressed: () {
                          loginController.onTapLoginButton(context);
                        },
                        child: Text('Log In'),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(height: 16),
                            RichText(
                              text: TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
