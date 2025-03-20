class AppLink {
  static const String server = "http://10.0.2.2/ecommerce";
  static const String imageCtatic = "http://10.0.2.2/ecommerce/upload";

  //Image
  static const String imageCategories =
      "http://10.0.2.2/ecommerce/upload/categories";
  static const String imageItem = "http://10.0.2.2/ecommerce/upload/items";

  static const String test = "$server/test.php";
  //Auth
  static const String signUp = "$server/auth/signup.php";
  static const String verfiycodeSignUp = "$server/auth/verfiycode.php";
  static const String logIn = "$server/auth/login.php";
  static const String resend = "$server/auth/resend.php";

  //Forgetpassword
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String verfiycodeForgetpassword =
      "$server/forgetpassword/verfiycode.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  //Home
  static const String homePage = "$server/home.php";
  static const String accessToken = "$server/test.php";

  //Items
  static const String items = "$server/items/items.php";
  static const String search = "$server/items/search.php";

  //Favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteDelete = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String favoriteDeleteMyFavorite =
      "$server/favorite/deletefavorite.php";
  //cart
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String getcountitems = "$server/cart/getcountitems.php";
  //Address
  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressView = "$server/address/view.php";
  static const String addressEdite = "$server/address/edite.php";

  //Coupon
  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  //CheckOut
  static const String checkOut = "$server/orders/checkout.php";

  //Orders
  static const String ordersPanding = "$server/orders/panding.php";
  static const String ordersArchive = "$server/orders/archive.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String ordersDelete = "$server/orders/delete.php";

  //Notification
  static const String notification = "$server/notification.php";

  //Notification
  static const String offers = "$server/offers.php";
  static const String rating = "$server/rating.php";
}
