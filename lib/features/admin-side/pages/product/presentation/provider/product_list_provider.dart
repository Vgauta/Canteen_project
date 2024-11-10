import 'package:canteen/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../../model/category_model.dart';
import '../../../../../../model/menu_model.dart';
import '../../../../../../model/priority_model.dart';
import '../../../../data/product_data.dart';

class ProductListProvider extends ChangeNotifier {
  final _productData = Get.find<ProductDataAdmin>();
  List<CategoryModel> _cate = [];
  List<CategoryModel> _subCate = [];
  List<PriorityModel> _prio = [];
  List<MenuModel> _menu = [];
  List<ProductModel> _products = [];
  bool _isLoading = false;
  int _indexPage = 0;

  bool get isLoading => _isLoading;
  ProductDataAdmin get productData => _productData;
  List<CategoryModel> get cate => _cate;
  List<CategoryModel> get subCate => _subCate;
  List<PriorityModel> get prio => _prio;
  List<MenuModel> get menu => _menu;
  int get indexPage => _indexPage;
  List<ProductModel> get products => _products;

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

  setDataZerothIndex(String pageId, String id) {
    if (pageId == "categorys") {
      _products = _productData.products
          .where((element) => element.productCategory == id)
          .toList();
    } else if (pageId == "prioritys") {
      _products = _productData.products
          .where((element) => element.priorityOfFood == id)
          .toList();
    } else if (pageId == "subCategorys") {
      _products = _productData.products
          .where((element) => element.subCategory == id)
          .toList();
    } else if (pageId == "menu") {
      _products = _productData.products
          .where((element) => element.productMenu == id)
          .toList();
    }
  }

  setData(int index, String pageId, String id) {
    _indexPage = index;

    if (pageId == "categorys") {
      _products = _productData.products
          .where((element) => element.productCategory == id)
          .toList();
    } else if (pageId == "prioritys") {
      _products = _productData.products
          .where((element) => element.priorityOfFood == id)
          .toList();
    } else if (pageId == "subCategorys") {
      _products = _productData.products
          .where((element) => element.subCategory == id)
          .toList();
    } else if (pageId == "menu") {
      _products = _productData.products
          .where((element) => element.productMenu == id)
          .toList();
    }
    notifyListeners();
  }

  setState() {
    notifyListeners();
  }

  clearAll() {
    _indexPage = 0;
    _products.clear();
  }
}
