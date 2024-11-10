import 'dart:convert';

import 'package:canteen/features/user-side/controller/cart_controller.dart';
import 'package:canteen/features/user-side/data/product_data.dart';
import 'package:canteen/model/category_model.dart';
import 'package:canteen/model/order_product_model.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/product_model.dart';
import '../../../model/response_model.dart';
import '../../../services/http_product_services.dart';

class ProductControllerUser {
  final service = Get.find<HttpProductsServices>();
  final productData = Get.find<ProductDataUser>();
  getProducts() async {
    try {
      final cartController = Get.find<CartController>();
      final dataCart = await cartController.getProductFromCart();

      Response response = await service.getProducts();

      if (response.statusCode == 200) {
        getOrderedProduct();
        var data = jsonDecode(response.body);
        final jsonData = data['data'];
        final List<dynamic> productDataJson = jsonData['products'];
        final List<dynamic> categoryDataJson = jsonData['category'];
        final List<dynamic> subCategoryDataJson = jsonData['subCategory'];

        List<ProductModel> products = productDataJson.map((e) {
          return ProductModel.fromJson(e);
        }).toList();
        print(products);
        List<CategoryModel> subCategorys = subCategoryDataJson.map((e) {
          return CategoryModel.fromJson(e);
        }).toList();
        List<CategoryModel> categorys = categoryDataJson.map((e) {
          return CategoryModel.fromJson(e);
        }).toList();

        productData.setProducts(products);
        productData.setCategorys(categorys);
        productData.setPrioritys();
        productData.setSubCategorys(subCategorys);
        productData.setMenu();
        await productData.setCart("addCartFromDb", "", dataCart, 0);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> orderProduct(
      String productId, OrderProductModel model) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response = await service.orderProduct(
          productId, model, prefs.getString('token') ?? "");
      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse);
      return ResponseModel.fromJson(jsonResponse);
    } catch (e) {
      rethrow;
    }
  }

  getOrderedProduct() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response =
          await service.getOrderedProduct(prefs.getString('token') ?? "");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<dynamic> jsonData = data['data'];

        print(jsonData);

        List<OrderProductModel> orders = jsonData.map((e) {
          return OrderProductModel.fromJson(e);
        }).toList();

        productData.setOrders(orders);
        print(productData.orders.length);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> deleteProductFromOrders(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response = await service.deleteProductFromOrders(id, prefs.getString('token') ?? "");
      return ResponseModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
