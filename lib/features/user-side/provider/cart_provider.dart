import 'dart:math';

import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:canteen/features/user-side/controller/cart_controller.dart';
import 'package:canteen/features/user-side/data/product_data.dart';
import 'package:canteen/model/cart_model.dart';
import 'package:canteen/model/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  final cartController = Get.find<CartController>();
  final productData = Get.find<ProductDataUser>();

  double _subTotal = 0;
  double _taxAndFees = 0;
  double _dilivery = 0;
  double _total = 0;
  int _productCountInCart = 0;

  double get subTotal => _subTotal;
  double get taxAndFees => _taxAndFees;
  double get dilivery => _dilivery;
  double get total => _total;
  int get productCountInCart => _productCountInCart;

  setAddAndMinusProductCount(String func) async {
    if (func == "add") {
      _productCountInCart++;
    } else if (func == "minus" && _productCountInCart > 0) {
      _productCountInCart--;
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('productCountInCart', _productCountInCart);
    notifyListeners();
  }

  getProductCount() async {
    final prefs = await SharedPreferences.getInstance();
    _productCountInCart = prefs.getInt('productCountInCart') ?? 0;
    _productCountInCart > 0 ? notifyListeners() : null;
  }


  bool setCartIcon(String productId) {
    return productData.cart.any((element) => element.productId == productId);
  }

  Future<ResponseModel> addProductToCart(String productId, int qty) async {
    final res = await cartController.addProductToCart(productId, qty);
    setAddAndMinusProductCount("add");
    productData.setCart("addToCart", productId, [], qty);

    notifyListeners();
    return res;
  }

  Future<ResponseModel> removeProductFromCart(String productId) async {
    final res = await cartController.deleteProductFromCart(productId);

    productData.setCart("removeFromCart", productId, [], 0);
    setAddAndMinusProductCount("minus");

    // productData.cartProducts
    //     .removeWhere((element) => element.productId == productId);
    notifyListeners();
    return res;
  }

  addWhenEnter() {
    _subTotal = 0;
    _dilivery = 0;
    _taxAndFees = 0;
    _total = 0;

    if (productData.cartProducts.isNotEmpty) {
      for (var element in productData.cartProducts) {
        _subTotal += element.cartProductPrice!;
        _dilivery += 20;
        _taxAndFees = _subTotal * 0.05;
        _total = _subTotal + _taxAndFees + _dilivery;
      }
    }
  }

  addAndMinusCounter(String func, int index) {
    if (func == "add") {
      productData.cart[index].qty++;
      productData.cartProducts[index].cartProductPrice =
          productData.cart[index].qty *
              productData.cartProducts[index].productPrice;
      _subTotal = 0; // Reset _subTotal to 0
      _dilivery = 0; // Reset _dilivery to 0
      _taxAndFees = 0; // Reset _taxAndFees to 0
      _total = 0; // Reset _total to 0
      for (var element in productData.cartProducts) {
        _subTotal += element.cartProductPrice!;
        _dilivery += 20;
        _taxAndFees = _subTotal * 0.05;
        _total = _subTotal + _taxAndFees + _dilivery;
      }
    } else if (func == "minus" &&
        productData.cart[index].qty > 1 &&
        _subTotal > 0) {
      productData.cart[index].qty--;

      productData.cartProducts[index].cartProductPrice =
          productData.cartProducts[index].cartProductPrice! -
              productData.cartProducts[index].productPrice;

      _subTotal -= productData.cartProducts[index].productPrice;
    }
    notifyListeners();
  }
}
