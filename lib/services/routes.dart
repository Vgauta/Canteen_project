class Routes {
  static const url = 'http://192.168.153.238:3000/';
  //auth
  static const createUser = "${url}registerUser";
  static const loginUser = "${url}loginUser";

  //product
  static const addProductRoute = "${url}product/addproduct";
  static const addCategoryRoute = "${url}product/addCategory";
  static const addSubCategoryRoute = "${url}product/addSubCategory";
  static const getProductRoute = "${url}product/getproducts";
  static const updateProductRoute = "${url}product/updateProducts/";
  static const deleteProductRoute = "${url}product/deleteProducts/";
  static const orderProductRoute = "${url}product/orderProduct/";
  static const getOrdersRoute = "${url}product/getOrderdProducts/";
  static const deleteFromOrdersRoute = "${url}product/deleteProductFromOrders/";

  // cart Product
  static const addProductToCart = "${url}cart/addProduct/";
  static const deleteProductToCart = "${url}cart/deleteProduct/";
  static const getProductToCart = "${url}cart/getAllCartProduct";

  // posters and coupons
  static const addPosterRoute = "${url}product/addPoster";
  static const updatePosterRoute = "${url}product/updatePoster/";
  static const deletePosterRoute = "${url}product/deletePosters/";

  static const addCouponsRoute = "${url}product/addCoupon";
  static const updateCouponsRoute = "${url}product/updateCoupon/";
  static const deleteCouponsRoute = "${url}product/deleteCoupon/";
}
