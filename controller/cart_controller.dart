import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/cart_data.dart';
import 'package:app_ecommerce/data/model/cartmodle.dart';
import 'package:app_ecommerce/data/model/couponmodle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  add(int itemsid);
  delete(int itemsid);
  cartView();
  resetVarCart();
  refreshPage();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  List<CartModle> data = [];
  int totalpriceOrder = 0;
  int totalCountItems = 0;
  TextEditingController? coupon;
  int? discountCoupon = 0;
  String? couponName;
  int? couponId;

  late StatusRequest statusRequest;
  CouponModle? couponModle;
  MyServices myServices = Get.find();

  @override
  add(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getInt("id")!.toString(),
        itemsid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم !ضافة المنتج الى السلة"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  delete(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getInt("id")!.toString(),
        itemsid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم حذف المنتج من السلة"));
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  resetVarCart() {
    totalCountItems = 0;
    totalpriceOrder = 0;
    data.clear();
  }

  @override
  refreshPage() {
    resetVarCart();
    cartView();
  }

  @override
  cartView() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .cartView(myServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataResponse = response['datacart']['data'];
          Map dataResponseCountPrice = response['countprice'];
          data.clear();
          data.addAll(dataResponse.map((e) => CartModle.fromJson(e)));
          totalCountItems = dataResponseCountPrice['totalcount'];
          totalpriceOrder = dataResponseCountPrice['totalprice'];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(coupon!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> dataCoupon = response['data'];
        couponModle = CouponModle.fromJson(dataCoupon);
        discountCoupon = couponModle!.couponDiscount!;
        couponName = couponModle!.couponName;
        couponId = couponModle!.couponId;
      } else {
        //statusRequest = StatusRequest.failure;
        couponId = null;
        discountCoupon = 0;
        couponName = null;
        Get.snackbar("Warning", "Coupon Not Vaild");
      }
    }
    update();
  }

  getTotalPrice() {
    return (totalpriceOrder - totalpriceOrder * discountCoupon! / 100);
  }

  goToPageCheckOut() {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغة");
    Get.toNamed(AppRoute.checkOut, arguments: {
      "couponid": couponId ?? 0,
      "priceorder": totalpriceOrder,
      "coupondiscount": discountCoupon
    });
  }

  @override
  void onInit() {
    coupon = TextEditingController();
    cartView();
    super.onInit();
  }
}
