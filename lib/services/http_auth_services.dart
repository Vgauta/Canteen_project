import 'dart:convert';
import 'package:canteen/model/user_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth_model.dart';
import 'routes.dart';

class AuthServices {
  Future<http.Response> registerUser(AuthModel model) async {
    try {
      var response = await http.post(
        Uri.parse(Routes.createUser),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(model),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> login(AuthModel model) async {
    try {
      var response = await http.post(
        Uri.parse(Routes.loginUser),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(model),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    final userModel = Get.find<UserDataModel>();
    await prefs.clear();
    print(prefs.getString('token'));
    print(prefs.getString('Fullname'));

    userModel.eMail = "";
    userModel.fullName = "";
    userModel.isLoggedIn = false;
    userModel.mobileNo = "";
    userModel.role = "";
    userModel.token = "";
    userModel.userId = "";
    return true;
  }
}
