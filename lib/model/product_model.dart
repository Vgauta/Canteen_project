import 'dart:typed_data';

class ProductModel {
  final String productId;
  final String productName;
  double productPrice;
  double? cartProductPrice;
  final String productQuantity;
  final String productCategory;
  final String subCategory;
  final String priorityOfFood;
  final String productDescription;
  final Uint8List? productImage;
  final String? mimeType;
  final String productStock;
  final String productMenu;
  final String statusAvailable;
  final String discountActive;
  final String discountPercentage;
  final String productImageString;
  bool isInCart;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.productCategory,
    required this.subCategory,
    this.cartProductPrice,
    required this.priorityOfFood,
    required this.productDescription,
    this.productImage,
    this.mimeType,
    required this.productStock,
    required this.productMenu,
    required this.statusAvailable,
    required this.discountActive,
    required this.discountPercentage,
    required this.productImageString,
    required this.isInCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['ProductId'],
      productName: json['ProductName'],
      productPrice: json['ProductPrice'],
      cartProductPrice: json['ProductPrice'],
      productQuantity: json['ProductQuantity'],
      productCategory: json['ProductCategory'],
      subCategory: json['ProductSubCategory'],
      priorityOfFood: json['PriorityOfFood'],
      productDescription: json['ProductDescription'],
      productImageString:
          "https://pub-c2ce9a1d454a457ba9303eb6f3de07a2.r2.dev/${json['ProductId']}",
      productStock: json['ProductStock'],
      productMenu: json['ProductMenu'],
      statusAvailable: json['StatusAvailable'],
      discountActive: json['DiscountActive'],
      discountPercentage: json['DiscountPercentage'],
      isInCart: false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    print(productPrice);
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_quantity'] = productQuantity;
    data['product_category'] = productCategory;
    data['sub_category'] = subCategory;
    data['priority_of_food'] = priorityOfFood;
    data['product_description'] = productDescription;
    data['product_image'] = productImage;
    data['mimeType'] = mimeType;
    data['product_stock'] = productStock;
    data['product_menu'] = productMenu;
    data['status_available'] = statusAvailable;
    data['discount_active'] = discountActive;
    data['discount_percentage'] = discountPercentage;
    return data;
  }
}
