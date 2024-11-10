import 'dart:async';
import 'package:canteen/features/admin-side/controller/product_controller.dart';
import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/model/category_model.dart';
import 'package:canteen/model/priority_model.dart';
import 'package:canteen/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../model/menu_model.dart';

class DashboardProductProvider extends ChangeNotifier {
  final productController = Get.find<ProductControllerAdmin>();
  final _productData = Get.find<ProductDataAdmin>();
  List<CategoryModel> _cate = [];
  List<CategoryModel> _subCate = [];
  List<PriorityModel> _prio = [];
  List<MenuModel> _menu = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  ProductDataAdmin get productData => _productData;
  List<CategoryModel> get cate => _cate;
  List<CategoryModel> get subCate => _subCate;
  List<PriorityModel> get prio => _prio;
  List<MenuModel> get menu => _menu;

  setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  getAll() async {
    await productController.getAll();
    print("object");
  }

  getHeader(String pageId) {
    if (pageId == "categorys") {
      _cate = _productData.categorys;
    } else if (pageId == "prioritys") {
      _prio = _productData.prioritys;
    } else if (pageId == "subCategorys") {
      _subCate = _productData.subCategorys;
    } else if (pageId == "menu") {
      _menu = _productData.menus;
    }
  }

  setState() {
    notifyListeners();
  }

  Future refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    await productController.getAll();
  }
}
