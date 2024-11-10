import 'package:canteen/model/cart_model.dart';
import 'package:canteen/model/category_model.dart';
import 'package:canteen/model/menu_model.dart';
import 'package:canteen/model/order_product_model.dart';
import 'package:get/get.dart';

import '../../../model/priority_model.dart';
import '../../../model/product_model.dart';

class ProductDataUser {
  List<MenuModel> _menus = [];
  List<MenuModel> get menus => _menus;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  List<CategoryModel> _categorys = [];
  List<CategoryModel> get categorys => _categorys;

  List<CategoryModel> _subCategorys = [];
  List<CategoryModel> get subCategorys => _subCategorys;

  List<PriorityModel> _prioritys = [];
  List<PriorityModel> get prioritys => _prioritys;

  List<CartModel> _cart = [];
  List<CartModel> get cart => _cart;

  List<ProductModel> _cartProducts = [];
  List<ProductModel> get cartProducts => _cartProducts;

  List<OrderProductModel> _orders = [];
  List<OrderProductModel> get orders => _orders;

  List<ProductModel> _orderedProducts = [];
  List<ProductModel> get orderedProducts => _orderedProducts;

  setProducts(List<ProductModel> val) {
    _products = val;
  }

  setMenu() {
    var seen = Set<String>();

    List<ProductModel> menuWithProducts =
        _products.where((e) => seen.add(e.productMenu)).toList();
    _menus = menuWithProducts.map((e) {
      return MenuModel(name: e.productMenu);
    }).toList();
  }

  setCart(String func, String productId, List<dynamic> data, int qty) {
    if (func == "addToCart" && data.isEmpty) {
      _cart = products
          .map((e) => CartModel(
              productId: productId,
              cartProductId: "",
              isInCart: true,
              qty: qty))
          .toList();
      _cartProducts
          .addAll(_products.where((element) => element.productId == productId));
      _products
          .where((element) => element.productId == productId)
          .forEach((element) {
        element.isInCart = true;
      });
      print(_products[0].isInCart);
    } else if (func == "removeFromCart" && data.isEmpty) {
      _cart.removeWhere((element) => element.productId == productId);
      _cartProducts.removeWhere((e) => e.productId == productId);

      _products.where((element) => element.productId == productId).forEach((e) {
        e.isInCart = false;
      });
    } else if (func == "addCartFromDb" && data.isNotEmpty) {
      _cart = data.map((e) => CartModel.fromJson(e)).toList();
      _cartProducts = products
          .where((element) =>
              cart.any((elementt) => element.productId == elementt.productId))
          .toList();
      _products
          .where((element) =>
              cart.any((elementt) => element.productId == elementt.productId))
          .forEach((e) {
        e.isInCart = true;
      });

      print(_products[0].isInCart);
      print("len${_cartProducts.length}");
    }
  }

  setCategorys(List<CategoryModel> val) {
    _categorys = val;
  }

  setSubCategorys(List<CategoryModel> val) {
    _subCategorys = val;
  }

  setPrioritys() {
    var seen = Set<String>();
    List<ProductModel> prioritysWithProducts =
        _products.where((e) => seen.add(e.priorityOfFood)).toList();
    _prioritys = prioritysWithProducts.map((e) {
      return PriorityModel(name: e.priorityOfFood);
    }).toList();
  }

  setOrders(List<OrderProductModel> val) {
    _orders = val;
    _orderedProducts = _products
        .where((elementt) =>
            _orders.any((element) => element.productId == elementt.productId))
        .toList();
  }
}
