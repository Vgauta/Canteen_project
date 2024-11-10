import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/model/poster_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../../../../../../model/category_model.dart';
import '../../../../../../model/coupon_model.dart';
import '../../../../../../model/response_model.dart';
import '../../../../controller/product_controller.dart';

class AddAndEditComponentProvider extends ChangeNotifier {
  final productController = Get.find<ProductControllerAdmin>();
  final productData = Get.find<ProductDataAdmin>();

  Uint8List? _image;
  String _base64Image = '';
  String _mimeType = '';
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  //poster and coupon
  final _titleController = TextEditingController();
  final _couponCode = TextEditingController();
  final _discountPercentage = TextEditingController();
  final _descriptionController = TextEditingController();
  String _appliedToCateId = "";
  bool _status = true;

  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get couponCodeController => _couponCode;
  TextEditingController get discountPercentageController => _discountPercentage;
  String get appliedToCateId => _appliedToCateId;
  bool get status => _status;

  //categorys
  final _categoryName = TextEditingController();
  final _subCategoryName = TextEditingController();

  TextEditingController get categoryName => _categoryName;
  TextEditingController get subCategoryName => _subCategoryName;

  Uint8List? get image => _image;
  String get base64Image => _base64Image;
  String get mimeType => _mimeType;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void setStatus(String statusName, String func, String val) {
    if (statusName == 'poster') {
      _status = !_status;
      notifyListeners();
    } else if (statusName == 'coupon') {
      _status = !_status;
      notifyListeners();
    } else if (func == "setappliedToCateId") {
      _appliedToCateId = val;
      print(_appliedToCateId);
    }
  }

  void setFields(String id, String name) {
    if (name == "poster" && id.isNotEmpty) {
      PosterModel poster =
          productData.poster.firstWhere((element) => element.posterId == id);
      _titleController.text = poster.title;
      _descriptionController.text = poster.desc;
      _status = poster.posterStatus;
    } else if (name == "coupon" && id.isNotEmpty) {
      CouponModel coupon =
          productData.coupon.firstWhere((element) => element.couponId == id);
      _titleController.text = coupon.couponTitle!;
      _descriptionController.text = coupon.couponDescription!;
      _couponCode.text = coupon.couponCode;
      _appliedToCateId = productData.categorys
          .firstWhere((element) => element.id == coupon.appliedToWhichCate)
          .categoryNameMain;
      _status = coupon.status.toBoolean();
      _discountPercentage.text = coupon.couponDiscount.toString();
    }
  }

  Future refresh() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      await productController.getAll();
    });
    notifyListeners();
  }

  void pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _mimeType = lookupMimeType(pickedImage.path) ?? '';
      final imageBytes = await pickedImage.readAsBytes();
      _image = await pickedImage.readAsBytes();
      _base64Image = base64Encode(imageBytes);
      notifyListeners();
    }
  }

  Future<ResponseModel> addCate() async {
    setLoading();
    CategoryModel model = CategoryModel(
      id: "",
      subCategory: subCategoryName.text.trim(),
      categoryNameMain: categoryName.text.trim(),
      image: "",
      imageUnit: image,
      mimeType: mimeType,
    );
    ResponseModel res = await productController.addCategoryController(model);
    setLoading();
    return res;
  }

  Future<ResponseModel> addSubCate() async {
    setLoading();
    CategoryModel model = CategoryModel(
      id: "",
      subCategory: subCategoryName.text.trim(),
      categoryNameMain: categoryName.text.trim(),
      image: "",
      imageUnit: image,
      mimeType: mimeType,
    );
    ResponseModel res = await productController.addSubCategoryController(model);
    setLoading();
    return res;
  }

  Future<ResponseModel> addPoster() async {
    setLoading();

    PosterModel model = PosterModel(
      posterId: "",
      title: _titleController.text.trim().toString(),
      desc: _descriptionController.text.trim().toString(),
      posterStatus: _status,
      posterUrl: "",
      imageBytes: image,
      mimeType: mimeType,
    );
    ResponseModel res = await productController.addPosterController(model);
    setLoading();
    clearFields();
    return res;
  }

  Future<ResponseModel> editPoster(String posterId) async {
    setLoading();
    PosterModel model = PosterModel(
      posterId: "",
      title: _titleController.text.trim().toString(),
      desc: _descriptionController.text.trim().toString(),
      posterStatus: _status,
      posterUrl: "",
      imageBytes: image,
      mimeType: mimeType,
    );
    ResponseModel res =
        await productController.eidtPosterController(model, posterId);
    setLoading();
    clearFields();
    return res;
  }

  Future<ResponseModel> deletePoster(String posterId) async {
    setLoading();
    ResponseModel res =
        await productController.deletePosterController(posterId);
    if (res.status == true) {
      productData.poster.removeWhere((element) => element.posterId == posterId);
    }
    setLoading();
    notifyListeners();
    return res;
  }

  Future<ResponseModel> addCoupons() async {
    setLoading();
    CouponModel model = CouponModel(
        couponId: "",
        couponTitle: _titleController.text.trim().toString(),
        couponCode: _couponCode.text.trim().toString(),
        couponDescription: _descriptionController.text.trim().toString(),
        couponDiscount: int.parse(_discountPercentage.text.trim()),
        status: _status.toString(),
        appliedToWhichCate: _appliedToCateId.trim());
    ResponseModel res = await productController.addCouponsController(model);
    setLoading();
    clearFields();
    return res;
  }

  Future<ResponseModel> editCoupons(String couponId) async {
    setLoading();

    CouponModel model = CouponModel(
      couponId: couponId,
      couponTitle: _titleController.text.trim().toString(),
      couponCode: _couponCode.text.trim().toString(),
      couponDescription: _descriptionController.text.trim().toString(),
      couponDiscount: int.parse(_discountPercentage.text.trim()),
      status: _status.toString(),
      appliedToWhichCate: _appliedToCateId.trim(),
    );
    ResponseModel res = await productController.editCouponsController(model);
    setLoading();
    // clearFields();
    return res;
  }

  Future<ResponseModel> deleteCoupons(String couponId) async {
    setLoading();
    ResponseModel res =
        await productController.deleteCouponsController(couponId);
    if (res.status == true) {
      productData.coupon.removeWhere((element) => element.couponId == couponId);
    }
    setLoading();
    notifyListeners();
    return res;
  }

  clearFields() {
    _isLoading = false;
    categoryName.clear();
    subCategoryName.clear();
    _titleController.clear();
    _descriptionController.clear();
    _status = true;
    _couponCode.clear();
    _discountPercentage.clear();
    _image = null;
    _base64Image = '';
    _mimeType = '';
    _appliedToCateId = "";
  }
}
