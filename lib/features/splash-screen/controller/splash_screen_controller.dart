import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../admin-side/pages/dashboard/presentation/dashboard_page.dart';
import '../../auth/presentation/pages/welcome_page.dart';
import '../../user-side/pages/user-home/user_home_page.dart';

class SplashScreenController {
  Future<void> init(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    bool isLogedIn = prefs.getBool("isLoggedIn") ?? false;
    String role = prefs.getString("role") ?? "";

    print(isLogedIn);
    print(role);

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isLogedIn == true && role == "isUser") {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePageUser()),
              (route) => false);
        } else if (isLogedIn == true && role == "isVendor") {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const AdminDashboardPage()),
              (route) => false);
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WelcomePage()));
        }
      },
    );
  }
}
