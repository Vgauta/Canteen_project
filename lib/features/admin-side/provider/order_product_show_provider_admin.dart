import 'package:canteen/features/admin-side/controller/product_controller.dart';
import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class OrderProductShowProviderAdmin with ChangeNotifier {
  final productData = Get.find<ProductDataAdmin>();
  final productController = Get.find<ProductControllerAdmin>();

  double _totalIncome = 0;
  double get totalIncome => _totalIncome;

  setTotalIncome() {
    _totalIncome = 0;
    for (var i = 0; i < productData.orders.length; i++) {
      _totalIncome += productData.orders[i].orderTotal;
    }
    return totalIncome;
  }
}
