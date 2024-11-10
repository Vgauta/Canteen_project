import 'dart:convert';
import 'dart:io';

import 'package:canteen/model/response_model.dart';
import 'package:canteen/services/http_cart_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/product_data.dart';

class CartController {
  final service = Get.find<CartServices>();
  final productData = Get.find<ProductDataUser>();

  Future<ResponseModel> addProductToCart(String productId, int qty) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? "";
      http.Response response =
          await service.addProductToCart(productId, token, qty);

      var responseDecode = jsonDecode(response.body);

      return ResponseModel.fromJson(responseDecode);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> deleteProductFromCart(String productId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? "";
      http.Response response =
          await service.deleteProductFromCart(productId, token);

      var responseDecode = jsonDecode(response.body);

      return ResponseModel.fromJson(responseDecode);
    } catch (e) {
      rethrow;
    }
  }

  Future<List> getProductFromCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? "";
      http.Response response = await service.getProductFromCart(token);

      var responseDecode = jsonDecode(response.body);
      List<dynamic> data = responseDecode['data'];


      return data;
    } catch (e) {
      rethrow;
    }
  }
}
