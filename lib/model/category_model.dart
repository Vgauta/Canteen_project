import 'dart:typed_data';

class CategoryModel {
  String id;
  String subCategory;
  String categoryNameMain;
  String image;
  Uint8List? imageUnit;
  final String? mimeType;

  CategoryModel({
    required this.id,
    required this.subCategory,
    required this.categoryNameMain,
    required this.image,
    this.imageUnit,
    this.mimeType,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    
    return CategoryModel(
      id: json['Id'],
      subCategory: json['SubCategoryName'] ?? "",
      categoryNameMain: json['CategoryName'],
      image:
          "https://pub-c2ce9a1d454a457ba9303eb6f3de07a2.r2.dev/${json['Id']}",
  
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_category_name'] = subCategory;
    data['category_name'] = categoryNameMain;
    data['category_image'] = imageUnit;
    data['mimeType'] = mimeType;
    return data;
  }
}
