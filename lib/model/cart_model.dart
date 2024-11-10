class CartModel {
  final String productId;
  final String cartProductId;
  final bool isInCart;
   int qty;

  CartModel({
    required this.productId,
    required this.cartProductId,
    required this.isInCart,
    required this.qty,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['ProductId'],
      cartProductId: json['CartProductId'],
      isInCart: json.isEmpty
          ? false
          : true, // if json is empty, then it's not in cart
      qty: json['qty'],
    );
  }
}
