import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/cart_data.dart';
import 'package:app_ecommerce/data/model/ItemsModle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  intialData();
  goToCart();
  addItems(int itemsid);
  deleteItems(int itemsid);
  add();
  remove();
  getcountitems(int itemsid);
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late ItemsModle itemsModle;
  //CartControllerImp cartController = Get.put(CartControllerImp());
  late StatusRequest statusRequest;
  int countItems = 0;
  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();

  @override
  goToCart() {
    Get.toNamed(AppRoute.cart);
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  List subItems = [
    {"name": "red", "id": 1, "active": "0"},
    {"name": "balck", "id": 2, "active": "0"},
    {"name": "red", "id": 3, "active": "1"},
  ];

  @override
  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModle = Get.arguments["itemsModle"];
    countItems = await getcountitems(itemsModle.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  getcountitems(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getcountitems(
        myServices.sharedPreferences.getInt("id")!.toString(),
        itemsid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countItems = 0;
        countItems = response['data'];
        return countItems;
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  addItems(itemsid) async {
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
  deleteItems(itemsid) async {
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

  add() {
    countItems++;
    addItems(itemsModle.itemsId!);
    update();
  }

  remove() {
    if (countItems > 0) {
      countItems--;
      deleteItems(itemsModle.itemsId!);
      update();
    }
  }
}
