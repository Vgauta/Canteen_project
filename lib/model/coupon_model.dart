class CouponModel {
  String couponId;
  String couponCode;
  String? couponTitle;
  String? couponDescription; //optional
  int couponDiscount;
  String status;
  String appliedToWhichCate;

  CouponModel({
    required this.couponId,
    required this.couponCode,
    required this.couponTitle,
    this.couponDescription,
    required this.couponDiscount,
    required this.status,
    required this.appliedToWhichCate,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      couponId: json['CouponId'],
      couponCode: json['CouponCode'],
      couponTitle: json['CouponTitle'],
      couponDescription: json['CouponDesc'],
      couponDiscount: json['DiscountPercentage'],
      status: json['Status'],
      appliedToWhichCate: json['AppliedToWhich'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CouponId'] = couponId;
    data['CouponCode'] = couponCode;
    data['CouponTitle'] = couponTitle;
    data['CouponDesc'] = couponDescription;
    data['DiscountPercentage'] = couponDiscount;
    data['CouponStatus'] = status;
    data['AppliedToCateId'] = appliedToWhichCate;
    return data;
  }
}
