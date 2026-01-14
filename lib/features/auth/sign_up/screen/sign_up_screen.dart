import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalmanprojects/core/common/constants/app_colors.dart';
import 'package:kalmanprojects/core/common/constants/iconpath.dart';
import 'package:kalmanprojects/core/common/widgets/custom_auth_appbar.dart';
import 'package:kalmanprojects/core/common/widgets/custom_button.dart';
import 'package:kalmanprojects/core/common/widgets/custom_password_field.dart';
import 'package:kalmanprojects/core/common/widgets/custom_text_field.dart';
import 'package:kalmanprojects/core/common/widgets/social_button.dart';
import 'package:kalmanprojects/features/auth/sign_up/controller/sign_up_controller.dart';
import 'package:kalmanprojects/features/auth/sign_up/widget/drop_down_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAuthAppbar(title: 'Create Your Account'),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.only(
                top: 14,
                left: 20,
                right: 20,
                bottom: 25,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    fieldName: 'Name *',
                    hintText: 'Enter your name',
                  ),
                  CustomTextField(
                    fieldName: 'Email *',
                    hintText: 'Enter your email',
                  ),
                  Obx(
                    () => CustomPasswordField(
                      fieldName: 'Password *',
                      hintText: '********',
                      controller: signUpController.passwordController,
                      obscure: signUpController.obscurePassword.value,
                      toggleObscure: signUpController.toggleObscure,
                    ),
                  ),
                  Obx(
                    () => CustomPasswordField(
                      fieldName: 'Confirm Password *',
                      hintText: '********',
                      controller: signUpController.confirmPasswordController,
                      obscure: signUpController.obscureConfirmPassword.value,
                      toggleObscure: signUpController.toggleConfirmObscure,
                    ),
                  ),
                  Obx(() {
                    return DropDownWidget(
                      fieldColor: AppColors.textFieldColor,
                      label: 'Account Type *',
                      value: signUpController.selectedAccountType.value,
                      items: signUpController.accountTypes,

                      onChangedCondition: (val) {
                        if (val != null) {
                          signUpController.selectedAccountType.value = val;
                        }
                      },
                    );
                  }),
                  SizedBox(height: 20),
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'I agree to Theta Analyzer Licence Agreement and Privacy policy',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: signUpController.agreeToTerms.value,
                            onChanged: (bool? value) {
                              if (value != null) {
                                signUpController.agreeToTerms.value = value;
                              }
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomButton(title: 'Register Now', onPressed: () {}),
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
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        TextSpan(
                          text: "Sign In",
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
