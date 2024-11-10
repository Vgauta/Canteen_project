class OrderProductModel {
  final String orderId;
  final String productId;
  final String userId;
  final int orderQuantity;
  final double deliveryCharge;
  final double taxAndFees;
  final int discount;
  final String orderStatus;
  final String orderPaymentStatus;
  final double orderTotal;
  final String? orderTimeRequired;
  final String orderDate;
  final String orderTime;
  final String? productName;
  final double? productPrice;
  final String? userFullName;
  final String? userAddress;
  final String? userEmail;
  final String? userPhone;
  final double? orderDiliveryCharge;
  final double? orderTax;
  final int? orderDiscount;
  final String? orderPayment;

  OrderProductModel({
    required this.orderId,
    required this.productId,
    required this.orderQuantity,
    required this.deliveryCharge,
    required this.taxAndFees,
    required this.discount,
    required this.orderStatus,
    required this.orderPaymentStatus,
    required this.orderTotal,
    this.orderTimeRequired,
    required this.orderDate,
    required this.orderTime,
    this.productName,
    this.productPrice,
    required this.userId,
    this.userFullName,
    this.userAddress,
    this.userEmail,
    this.userPhone,
    this.orderDiliveryCharge,
    this.orderTax,
    this.orderDiscount,
    this.orderPayment,
    
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      orderId: json['OrderId'],
      productId: json['ProductId'],
      orderQuantity: json['OrderQuantity'],
      deliveryCharge: json['OrderDiliveryCharge'],
      taxAndFees: json['OrderTax'],
      discount: json['OrderDiscount'],
      orderStatus: json['OrderStatus'],
      orderPaymentStatus: json['OrderPayment'],
      orderTotal: json['OrderTotal'],
      orderTimeRequired: json['OrderTimeRequired'],
      orderDate: json['createdAt'].toString(),
      orderTime: json['createdAt'].toString(),
      productName: json['ProductName'],
      productPrice: json['ProductPrice'],
      userId: json['UserId'],
      userFullName: json['UserFullName'],
      userAddress: json['UserAddress'],
      userEmail: json['UserEmail'],
      userPhone: json['UserPhone'],
      orderDiliveryCharge: json['OrderDiliveryCharge'],
      orderTax: json['OrderTax'],
      orderDiscount: json['OrderDiscount'],
      orderPayment: json['OrderPayment'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_quantity': orderQuantity,
      'order_dilivery_charge': deliveryCharge,
      'order_tax': taxAndFees,
      'order_discount': discount,
      'order_status': orderStatus,
      'order_payment': orderPaymentStatus,
      'order_total': orderTotal,
      // 'OrderTimeRequired': orderTimeRequired,
    };
  }
}
