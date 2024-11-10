import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/util/image_strings.dart';
import '../../controller/splash_screen_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashScreenController = SplashScreenController();
  @override
  void initState() {
    super.initState();
    splashScreenController.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagePath.splashBackImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(child: Image.asset(ImagePath.splashCenterLogo)),
        ),
      ),
    );
  }
}
