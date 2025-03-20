import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(id, val);
  addFavorite(int itemsid);
  removeFavorite(int itemsid);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};

  FavoriteData favoriteData = FavoriteData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  @override
  addFavorite(itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getInt("id")!.toString(),
        itemsid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم !ضافة المنتج الى المفضلة"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  removeFavorite(itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getInt("id")!.toString(),
        itemsid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من المفضلة"));
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
