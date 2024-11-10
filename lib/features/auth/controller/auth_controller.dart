import 'dart:convert';
import 'package:canteen/services/http_auth_services.dart';
import 'package:get/get.dart';

import '../../../core/data/user_data_provider.dart';
import '../../../model/auth_model.dart';
import '../../../model/response_model.dart';

class AuthController {
  final auth = AuthServices();

  Future<ResponseModel> registerController(AuthModel model) async {
    try {
      var response = await auth.registerUser(model);
      var responseBody = jsonDecode(response.body);

      return ResponseModel.fromJson(responseBody);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> loginController(AuthModel model) async {
    try {
      var response = await auth.login(model);
      var responseBody = jsonDecode(response.body);

      var userData = responseBody["data"];

      final userDataProvider = Get.find<UserDataProvider>();
     
      if (response.statusCode == 200) {
        userDataProvider.saveUserData(true, userData);
      }

      return ResponseModel.fromJson(responseBody);
    } catch (e) {
      rethrow;
    }
  }
}
