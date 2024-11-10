import 'dart:ffi';

import 'package:canteen/features/user-side/controller/product_controller.dart';
import 'package:canteen/model/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/order_product_model.dart';

class OrderProductProvider with ChangeNotifier {
  final productController = Get.find<ProductControllerUser>();
  int _quantity = 1;
  double _orderTotal = 0;
  double _deliveryCharge = 0;
  double _taxAndFees = 0;
  double _total = 0;
  int get quantity => _quantity;
  double get orderTotal => _orderTotal;
  double get deliveryCharge => _deliveryCharge;
  double get taxAndFees => _taxAndFees;
  double get total => _total;

  setWhenEnter(int qty, double productPrice) {
    _quantity = 0;
    _orderTotal = 0;
    _deliveryCharge = 0;
    _taxAndFees = 0;
    _total = 0;
    _quantity = qty;
    _orderTotal = productPrice * _quantity;
    _deliveryCharge = productPrice * 0.5;
    _taxAndFees = productPrice * 0.1;
    _total = _orderTotal + _deliveryCharge + _taxAndFees;
  }

  void increment(double productPrice) {
    _quantity++;
    _orderTotal = 0;
    _deliveryCharge = 0;
    _taxAndFees = 0;
    _total = 0;
    _orderTotal = productPrice * _quantity;
    _deliveryCharge = productPrice * 0.5;
    _taxAndFees = productPrice * 0.1;

    _total = _orderTotal + _deliveryCharge + _taxAndFees;

    notifyListeners();
  }

  void decrement(double productPrice) {
    if (_quantity > 1) {
      _quantity--;

      _total -= productPrice;

      notifyListeners();
    }
  }

  Future<ResponseModel> orderProduct(String productId) async {
    try {
      OrderProductModel model = OrderProductModel(
        orderId: "",
        productId: productId,
        orderQuantity: _quantity,
        deliveryCharge: _deliveryCharge,
        taxAndFees: _taxAndFees,
        discount: 0,
        orderStatus: "Pending",
        orderPaymentStatus: "Cash On Dilivery",
        orderTotal: _total,
        orderDate: "",
        orderTime: "",
        userId: "",
        
      );
      final response = await productController.orderProduct(productId, model);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
