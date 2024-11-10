import 'package:canteen/model/category_model.dart';
import 'package:canteen/model/coupon_model.dart';
import 'package:canteen/model/menu_model.dart';
import 'package:canteen/model/poster_model.dart';

import '../../../model/order_product_model.dart';
import '../../../model/priority_model.dart';
import '../../../model/product_model.dart';

class ProductDataAdmin {
  double _totalIncome = 0;
  double get totalIncome => _totalIncome;

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

  List<OrderProductModel> _orders = [];
  List<OrderProductModel> get orders => _orders;

  List<OrderProductModel> _ordersPending = [];
  List<OrderProductModel> get ordersPending => _ordersPending;

  List<OrderProductModel> _ordersServed = [];
  List<OrderProductModel> get ordersServed => _ordersServed;

  List<ProductModel> _orderedProducts = [];
  List<ProductModel> get orderedProducts => _orderedProducts;

  List<PosterModel> posters = [];
  List<PosterModel> get poster => posters;

  List<CouponModel> coupons = [];
  List<CouponModel> get coupon => coupons;

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

    _ordersPending =
        _orders.where((element) => element.orderStatus == "Pending").toList();
    _ordersServed =
        _orders.where((element) => element.orderStatus == "Served").toList();

    _totalIncome = _orders.fold(
        0, (previousValue, element) => previousValue + element.orderTotal);
  }

  setPosters(List<PosterModel> val) {
    posters = val;
  }

  setCoupons(List<CouponModel> val){
    coupons = val;
  }
}
