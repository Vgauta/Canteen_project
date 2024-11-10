import 'dart:convert';

import 'package:canteen/services/routes.dart';
import 'package:http/http.dart' as http;

class CartServices {
  Future<http.Response> addProductToCart(
      String productId, String token, int qty) async {
    print(productId);
    try {
      http.Response response = await http.post(
        Uri.parse(Routes.addProductToCart + productId),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode({'qty': qty}),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> deleteProductFromCart(
      String productId, String token) async {
    try {
      http.Response response = await http.delete(
        Uri.parse(Routes.deleteProductToCart + productId),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getProductFromCart(String token) async {
    try {
      http.Response response = await http.post(
        Uri.parse(Routes.getProductToCart),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
