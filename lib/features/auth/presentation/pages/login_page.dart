import 'package:canteen/features/admin-side/pages/dashboard/presentation/dashboard_page.dart';
import 'package:canteen/features/user-side/pages/user-home/user_home_page.dart';
import 'package:canteen/model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/color_pallete.dart';
import '../../../../core/widget/big_text.dart';
import '../../../../core/widget/eleve_button.dart';
import '../../../../core/widget/small_text.dart';
import '../../../../core/widget/snack_bar_helper.dart';
import '../../../../core/widget/txt_field.dart';
import '../../provider/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Consumer<AuthProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  const SizedBox(height: 110),
                  const BigText(
                    text: "Welcome back",
                    fontWeight: FontWeight.bold,
                  ),
                  const SmallText(text: "Let’s eat something amazing 😋"),
                  const SizedBox(height: 80),
                  Form(
                    key: value.loginFormKey,
                    child: Column(
                      children: [
                        TxtField(
                          controller: value.eMail,
                          bgColor: AppColorPallete.greyColor200,
                          hintText: "E-mail",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your email";
                            }
                            if (!val.contains("@")) {
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
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your password";
                            }
                            if (val.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          maxLines: 1,
                          prefixIcon: const Icon(
                            Icons.lock,
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
                  const SizedBox(height: 10),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: GestureButton(
                  //     onPressed: () {},
                  //     child: SmallText(
                  //       text: "Forgot Password?",
                  //       color: AppColors.mainColor,
                  //       textDecoration: TextDecoration.underline,
                  //       decorationColor: AppColors.mainColor,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 40),
                  ElevatedButtonCustom(
                    onPressed: () {
                      if (value.loginFormKey.currentState!.validate()) {
                        value.loginProvider().then((val) {
                          if (val.status == true) {
                            SnackBarHelper.showSnackBar(
                                context, val.message, false);
                            final userDataModel = Get.find<UserDataModel>();
                            if (userDataModel.role == "isUser") {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePageUser()),
                                (route) => false,
                              );
                            }else if(userDataModel.role == "isVendor"){
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AdminDashboardPage()),
                                (route) => false,
                              );
                            }
                            value.clearTextFields();
                          } else {
                            SnackBarHelper.showSnackBar(
                                context, val.message, true);
                          }
                        });
                      }
                    },
                    color: AppColorPallete.primaryColor,
                    child: value.isLoading == false
                        ? const BigText(
                            text: "Login",
                            color: Colors.white,
                            size: 15,
                          )
                        : const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey),
                      ),
                      SizedBox(width: 10),
                      SmallText(
                        text: "Or",
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Divider(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // ElevetedButtonWidget(
                  //   onPressed: () {},
                  //   buttonHeight: Dimensions.height60 + 4,
                  //   buttonWidth: Dimensions.screenWidth,
                  //   bgColor: Colors.white,
                  //   elevation: 2,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       SvgPicture.asset(
                  //         ImagePath.googleIconSvg,
                  //         height: 30,
                  //       ),
                  //       const SizedBox(width: 10),
                  //       SmallText(
                  //         text: "Continue with Google",
                  //         color: Colors.black,
                  //         size: 15,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SmallText(text: "Don’t have an account?"),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const RegisterPage()));
                        },
                        child: const SmallText(
                          text: "Sign Up",
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
