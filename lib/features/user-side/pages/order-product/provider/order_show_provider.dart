import 'package:canteen/features/user-side/controller/product_controller.dart';
import 'package:canteen/features/user-side/data/product_data.dart';
import 'package:canteen/model/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderShowProvider with ChangeNotifier {
  final productData = Get.find<ProductDataUser>();
  final productController = Get.find<ProductControllerUser>();

 Future<ResponseModel> deleteFromOreders(String orderId, String productId) async {
    ResponseModel delete = await productController.deleteProductFromOrders(orderId);
    if (delete.status == true) {
      productData.orders.removeWhere((element) => element.orderId == orderId);
      productData.orderedProducts
          .removeWhere((element) => element.productId == productId);
    }
    notifyListeners();
    return delete;
  }
}
