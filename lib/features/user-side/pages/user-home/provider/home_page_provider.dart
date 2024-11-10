import 'package:canteen/features/user-side/controller/product_controller.dart';
import 'package:canteen/features/user-side/data/product_data.dart';
import 'package:canteen/features/user-side/pages/user-product/provider/producr_list_categoory_provider.dart';
import 'package:canteen/model/category_model.dart';
import 'package:canteen/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageProvider extends ChangeNotifier {
  final productController = Get.find<ProductControllerUser>();
  final productData = Get.find<ProductDataUser>();
  final productListCategoryProvider = ProductListCategoryProvider();

  List<ProductModel> _productsListPriorityWise = [];
  List<CategoryModel> _categroysList = [];
  List<ProductModel> get productsListPriorityWise => _productsListPriorityWise;
  List<CategoryModel> get categroysList => _categroysList;

  getAll() async {
    await productController.getProducts();
  }

  getProductPriorityWise(String prio) {
    _productsListPriorityWise = productData.products
        .where((element) => element.priorityOfFood == prio)
        .toList();
  }

  refresh() {
    notifyListeners();
  }
}
