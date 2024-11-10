import 'package:canteen/core/data/user_data_provider.dart';
import 'package:canteen/features/admin-side/controller/product_controller.dart';
import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/features/auth/controller/auth_controller.dart';
import 'package:canteen/features/user-side/controller/cart_controller.dart';
import 'package:canteen/features/user-side/controller/product_controller.dart';
import 'package:canteen/features/user-side/data/product_data.dart';
import 'package:canteen/services/http_auth_services.dart';
import 'package:canteen/services/http_cart_services.dart';
import 'package:canteen/services/http_product_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_data_model.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => UserDataProvider());
  Get.lazyPut(() => ProductDataAdmin());
  Get.lazyPut(() => ProductDataUser());

  // model
  Get.lazyPut(
    () => UserDataModel(
      token: sharedPreferences.getString("token") ?? '',
      fullName: sharedPreferences.getString("fullName") ?? '',
      eMail: sharedPreferences.getString("eMail") ?? '',
      mobileNo: sharedPreferences.getString("mobileNo") ?? '',
      role: sharedPreferences.getString("role") ?? '',
      userId: sharedPreferences.getString("userId") ?? '',
      isLoggedIn: sharedPreferences.getBool("isLoggedIn") ?? false,
      address: sharedPreferences.getString("address") ?? '',
    ),
  );

  //controller

  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => ProductControllerAdmin());
  Get.lazyPut(() => ProductControllerUser());
  Get.lazyPut(() => CartController());
  

  //Services
  Get.lazyPut(() => HttpProductsServices());
  Get.lazyPut(() => AuthServices());
  Get.lazyPut(() => CartServices());
}
