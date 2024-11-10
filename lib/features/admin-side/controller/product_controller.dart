import 'dart:convert';

import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/model/category_model.dart';
import 'package:canteen/model/coupon_model.dart';
import 'package:canteen/model/poster_model.dart';
import 'package:canteen/model/product_model.dart';
import 'package:canteen/services/http_product_services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/order_product_model.dart';
import '../../../model/response_model.dart';

class ProductControllerAdmin {
  final service = Get.find<HttpProductsServices>();
  final productData = Get.find<ProductDataAdmin>();

  Future<ResponseModel> addProductController(ProductModel model) async {
    final prefs = await SharedPreferences.getInstance();
    Response response =
        await service.addPorducts(model, prefs.getString('token') ?? "");

    var responseDecode = jsonDecode(response.body);

    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel.fromJson(responseDecode);
    } else {
      responseModel = ResponseModel.fromJson(responseDecode);
    }

    return responseModel;
  }

  Future<ResponseModel> addCategoryController(CategoryModel model) async {
    final prefs = await SharedPreferences.getInstance();
    Response response =
        await service.addCategory(model, prefs.getString('token') ?? "");

    var responseDecode = jsonDecode(response.body);

    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel.fromJson(responseDecode);
    } else {
      responseModel = ResponseModel.fromJson(responseDecode);
    }

    return responseModel;
  }

  Future<ResponseModel> addSubCategoryController(CategoryModel model) async {
    final prefs = await SharedPreferences.getInstance();
    Response response =
        await service.addSubCategory(model, prefs.getString('token') ?? "");

    var responseDecode = jsonDecode(response.body);

    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel.fromJson(responseDecode);
    } else {
      responseModel = ResponseModel.fromJson(responseDecode);
    }

    return responseModel;
  }

  Future<ResponseModel> getAll() async {
    try {
      // await Future.delayed(const Duration(seconds: 5));
      Response response = await service.getProducts();

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final jsonData = await data['data'];

        final List<dynamic> productDataJson = await jsonData['products'];
        final List<dynamic> categoryDataJson = await jsonData['category'];
        final List<dynamic> subCategoryDataJson = await jsonData['subCategory'];
        final List<dynamic> postersJson = await jsonData['posters'];
        final List<dynamic> couponsJson = await jsonData['coupons'];

        List<ProductModel> products = productDataJson.map((e) {
          return ProductModel.fromJson(e);
        }).toList();

        List<CategoryModel> category = categoryDataJson.map((e) {
          return CategoryModel.fromJson(e);
        }).toList();

        List<CategoryModel> subCategory = subCategoryDataJson.map((e) {
          return CategoryModel.fromJson(e);
        }).toList();

        List<PosterModel> posters = postersJson.map((e) {
          return PosterModel.fromJson(e);
        }).toList();

        List<CouponModel> coupons = couponsJson.map((e) {
          return CouponModel.fromJson(e);
        }).toList();

        productData.setProducts(products);
        getOrderedProduct();
        productData.setCategorys(category);
        productData.setSubCategorys(subCategory);
        productData.setPrioritys();
        productData.setMenu();
        productData.setPosters(posters);
        productData.setCoupons(coupons);
      }
      return ResponseModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> deleteProductController(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response =
          await service.deleteProduct(id, prefs.getString('token') ?? '');

      var responseDecode = jsonDecode(response.body);
      var responseModel = ResponseModel.fromJson(responseDecode);

      if (responseModel.status == true) {
        productData.products.removeWhere((element) => element.productId == id);
      }

      return responseModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> updateProductController(
      String id, ProductModel model) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response = await service.updateProduct(
          id, prefs.getString('token') ?? "", model);

      var responseDecode = jsonDecode(response.body);
      var responseModel = ResponseModel.fromJson(responseDecode);

      return responseModel;
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

        List<OrderProductModel> orders = jsonData.map((e) {
          return OrderProductModel.fromJson(e);
        }).toList();

        productData.setOrders(orders);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> addPosterController(PosterModel model) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response =
          await service.addPoster(prefs.getString('token') ?? "", model);
      var responseDecode = jsonDecode(response.body);
      return ResponseModel.fromJson(responseDecode);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> eidtPosterController(
      PosterModel model, String posterId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response = await service.editPoster(
          prefs.getString('token') ?? "", model, posterId);
      var responseDecode = jsonDecode(response.body);
      return ResponseModel.fromJson(responseDecode);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> deletePosterController(String posterId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response =
          await service.deletePoster(prefs.getString('token') ?? "", posterId);
      var responseDecode = jsonDecode(response.body);
      return ResponseModel.fromJson(responseDecode);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> addCouponsController(CouponModel model) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response =
          await service.addCoupons(prefs.getString('token') ?? "", model);
      var responseDecode = jsonDecode(response.body);
      return ResponseModel.fromJson(responseDecode);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> editCouponsController(CouponModel model) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response =
          await service.editCoupons(prefs.getString('token') ?? "", model);
      var responseDecode = jsonDecode(response.body);
      return ResponseModel.fromJson(responseDecode);
    } catch (e) {
      rethrow;
    }
  }

   Future<ResponseModel> deleteCouponsController(String couponId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Response response =
          await service.deleteCoupons(prefs.getString('token') ?? "", couponId);
      var responseDecode = jsonDecode(response.body);
      return ResponseModel.fromJson(responseDecode);
    } catch (e) {
      rethrow;
    }
  }
}
