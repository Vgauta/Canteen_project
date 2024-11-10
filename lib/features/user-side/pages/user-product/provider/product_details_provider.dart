import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../model/product_model.dart';
import '../../../data/product_data.dart';

class ProductDetailsProvider extends ChangeNotifier {
  final productData = Get.find<ProductDataUser>();

  List<ProductModel> _productsListCatWise = [];
  List<ProductModel> get productsListCatWise => _productsListCatWise;

  int _quantity = 1;
  double _total = 0;
  int get quantity => _quantity;
  double get total => _total;

  getProductCatWise(String cat) {
    _productsListCatWise = productData.products
        .where((element) => element.productCategory == cat)
        .toList();
  }

  setWhenEnter(double productPrice) {
    _quantity = 1;

    _total = productPrice * quantity;
  }

  add(double productPrice) {
    _quantity++;
    _total = productPrice * quantity;
    notifyListeners();
  }

  minus(double productPrice) {
    if (_quantity > 1) {
      _quantity--;
      _total -= productPrice;
      notifyListeners();
    }
  }
}
