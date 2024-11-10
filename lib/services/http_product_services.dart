import 'dart:convert';
import 'package:canteen/model/category_model.dart';
import 'package:canteen/model/order_product_model.dart';
import 'package:canteen/model/poster_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../model/coupon_model.dart';
import '../model/product_model.dart';
import 'routes.dart';

class HttpProductsServices {
  Future<Response> addPorducts(ProductModel model, String token) async {
    try {
      var response = await http.post(
        Uri.parse(Routes.addProductRoute),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(model),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> addCategory(CategoryModel model, String token) async {
    try {
      var response = await http.post(
        Uri.parse(Routes.addCategoryRoute),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(model),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> addSubCategory(CategoryModel model, String token) async {
    try {
      var response = await http.post(
        Uri.parse(Routes.addSubCategoryRoute),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(model),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getProducts() async {
    try {
      var response = await http.get(
        Uri.parse(Routes.getProductRoute),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateProduct(
      String id, String token, ProductModel model) async {
    try {
      var response = await http.post(
        Uri.parse(Routes.updateProductRoute + id),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
        body: jsonEncode(model),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteProduct(String id, String token) async {
    try {
      var response = await http.get(
        Uri.parse(Routes.deleteProductRoute + id),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> orderProduct(
      String productId, OrderProductModel model, String token) async {
    try {
      Response response = await http.post(
        Uri.parse(Routes.orderProductRoute + productId),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
        body: jsonEncode(model),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getOrderedProduct(String token) async {
    try {
      Response response = await http.get(
        Uri.parse(Routes.getOrdersRoute),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteProductFromOrders(String id, String token) async {
    try {
      Response response = await http.delete(
        Uri.parse(Routes.deleteFromOrdersRoute + id),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> addPoster(String token, PosterModel model) async {
    try {
      Response response = await http.post(
        Uri.parse(Routes.addPosterRoute),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
        body: jsonEncode(model),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> editPoster(
      String token, PosterModel model, String posterId) async {
    try {
      Response response = await http.post(
        Uri.parse(Routes.updatePosterRoute + posterId),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
        body: jsonEncode(model),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deletePoster(String token, String posterId) async {
    try {
      Response response = await http.delete(
        Uri.parse(Routes.deletePosterRoute + posterId),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> addCoupons(String token, CouponModel model) async {
    try {
      Response response = await http.post(
        Uri.parse(Routes.addCouponsRoute),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
        body: jsonEncode(model),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> editCoupons(String token, CouponModel model) async {
    try {
      Response response = await http.post(
        Uri.parse(Routes.updateCouponsRoute + model.couponId),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
        body: jsonEncode(model),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteCoupons(String token, String couponId) async {
    try {
      Response response = await http.delete(
        Uri.parse(Routes.deleteCouponsRoute + couponId),
        headers: {
          "Content-Type": "application/json",
          'Authorization': token,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
