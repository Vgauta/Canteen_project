import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_data_model.dart';

class UserDataProvider {
  saveUserData(bool isLoggedIn, userData) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString("token", userData['Token']);
    prefs.setString("fullName", userData['Fullname']);
    prefs.setString("eMail", userData['Email']);
    prefs.setString("mobileNo", userData['MobileNo']);
    prefs.setString("role", userData['Role']);
    prefs.setString("userId", userData['UserId']);
    prefs.setString("address", userData["Address"]);
    prefs.setBool("isLoggedIn", isLoggedIn);

    final userModel = Get.find<UserDataModel>();

    userModel.token = userData['Token'];
    userModel.fullName = userData['Fullname'];
    userModel.eMail = userData['Email'];
    userModel.mobileNo = userData['MobileNo'];
    userModel.role = userData['Role'];
    userModel.userId = userData['UserId'];
    userModel.isLoggedIn = isLoggedIn;
    userModel.address = userData["Address"];
  }
}
