import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/color_pallete.dart';
import '../../../../core/widget/big_text.dart';
import '../../../../core/widget/eleve_button.dart';
import '../../../../core/widget/small_text.dart';
import '../../../../core/widget/snack_bar_helper.dart';
import '../../../../core/widget/txt_field.dart';
import '../../provider/auth_provider.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Consumer<AuthProvider>(
            builder: (__, value, _) {
              return Column(
                children: [
                  const SizedBox(height: 80),
                  const BigText(
                    text: "Welcome to Foodie App",
                    fontWeight: FontWeight.bold,
                  ),
                  const SmallText(text: "Register to continue"),
                  const SizedBox(height: 40),
                  Form(
                    key: value.registerFormKey,
                    child: Column(
                      children: [
                        TxtField(
                          controller: value.fullName,
                          bgColor: AppColorPallete.greyColor200,
                          hintText: "Fullname",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your fullname";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          prefixIcon: const Icon(
                            Icons.person,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TxtField(
                          hintText: "Mobile number",
                          controller: value.mobileNumber,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your mobile number";
                            } else if (val.length < 10) {
                              return "Please enter a valid mobile number";
                            }
                            return null;
                          },
                          maxLength: 10,
                          prefixIcon: const Icon(
                            Icons.phone,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TxtField(
                          hintText: "E-mail",
                          controller: value.eMail,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your email";
                            } else if (!val.contains("@")) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                          prefixIcon: const Icon(
                            Icons.email,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TxtField(
                          controller: value.passWord,
                          bgColor: AppColorPallete.greyColor200,
                          hintText: "Password",
                          maxLines: 1,
                          obscureText: value.isPasswordVisible,
                          suffixIconButton: IconButton(
                            onPressed: () {
                              value.togglePasswordVisibility();
                            },
                            icon: Icon(
                              (value.isPasswordVisible == false)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your password";
                            } else if (val.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          prefixIcon: const Icon(
                            Icons.password,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TxtField(
                          controller: value.confirmPassword,
                          bgColor: AppColorPallete.greyColor200,
                          hintText: "Confirm Password",
                          maxLines: 1,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your password";
                            } else if (val != value.passWord.text) {
                              return "Password does not match";
                            }
                            return null;
                          },
                          prefixIcon: const Icon(
                            Icons.password,
                          ),
                          obscureText: value.isPasswordVisible,
                          suffixIconButton: IconButton(
                            onPressed: () {
                              value.togglePasswordVisibility();
                            },
                            icon: Icon(
                              (value.isPasswordVisible == false)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButtonCustom(
                    onPressed: () {
                      if (value.registerFormKey.currentState!.validate()) {
                        value.registerProvider().then(
                          (value) {
                            if (value.status == true) {
                              SnackBarHelper.showSnackBar(
                                  context, value.message, false);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                  (route) => false);
                            } else {
                              SnackBarHelper.showSnackBar(
                                  context, value.message, true);
                            }
                          },
                        );
                      }
                    },
                    color: AppColorPallete.primaryColor,
                    child: !value.isLoading
                        ? const BigText(
                            text: "Create Account",
                            color: Colors.white,
                            size: 15,
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SmallText(text: "Already have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const SmallText(
                          text: "Login",
                          color: AppColorPallete.primaryColor,
                          textDecoration: TextDecoration.underline,
                          decorationColor: AppColorPallete.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
