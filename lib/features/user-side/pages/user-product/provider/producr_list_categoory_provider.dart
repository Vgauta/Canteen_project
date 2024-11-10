import 'package:canteen/model/category_model.dart';
import 'package:canteen/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/product_data.dart';

class ProductListCategoryProvider extends ChangeNotifier {
  final productData = Get.find<ProductDataUser>();
  List<ProductModel> _productList = [];
  List<CategoryModel> _subCategoryList = [];

  int _index = 0;
  List<ProductModel> get productList => _productList;
  List<CategoryModel> get subCategoryList => _subCategoryList;
  int get index => _index;

  setDataZerothIndex(String subCate) {
    _index = 0;
    _productList = productData.products
        .where((element) => element.subCategory == subCate)
        .toList();
  }

  setData(String subCate, int index) {
    _index = index;
    _productList.clear();
    _productList.addAll(productData.products
        .where((element) => element.subCategory == subCate));

    notifyListeners();
  }

  setSubCategory(String cate) {
    _subCategoryList.clear();
    _subCategoryList.addAll(productData.subCategorys
        .where((element) => element.categoryNameMain == cate));
    print(_subCategoryList);
  }
}
