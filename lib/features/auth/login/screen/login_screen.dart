import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalmanprojects/core/common/constants/app_colors.dart';
import 'package:kalmanprojects/core/common/constants/iconpath.dart';
import 'package:kalmanprojects/core/common/widgets/custom_button.dart';
import 'package:kalmanprojects/core/common/widgets/custom_password_field.dart';
import 'package:kalmanprojects/core/common/widgets/custom_text_field.dart';
import 'package:kalmanprojects/core/common/widgets/social_button.dart';
import 'package:kalmanprojects/features/auth/login/controller/login_controller.dart';
import 'package:kalmanprojects/features/auth/login/widgets/banner_widget.dart';
import 'package:kalmanprojects/routes/app_route.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerWidget(),
            const SizedBox(height: 23),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 23),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const CustomTextField(
                    fieldName: 'Email *',
                    hintText: 'Enter your email',
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => CustomPasswordField(
                      fieldName: 'Password *',
                      hintText: 'Enter your password',
                      controller: loginController.passwordController,
                      obscure: loginController.obscurePassword.value,
                      toggleObscure: loginController.toggleObscure,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Obx(
                        () => Expanded(
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'Remember Me',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: loginController.rememberMe.value,
                            onChanged: (bool? value) {
                              if (value != null) {
                                loginController.rememberMe.value = value;
                              }
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  CustomButton(
                    title: 'Sign In',
                    onPressed: () {
                      Get.toNamed(Approute.getHomeScreen());
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    'or',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  SocialButton(
                    imagePath: Iconpath.google,
                    text: 'Continue with Google',
                    onTap: () {},
                  ),
                  SizedBox(height: 44),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        TextSpan(
                          text: "Sign Up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed('/signUpScreen');
                            },
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
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
    );
  }
}
