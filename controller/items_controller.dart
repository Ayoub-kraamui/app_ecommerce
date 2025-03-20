import 'package:app_ecommerce/controller/home_controller.dart';
import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/items_data.dart';
import 'package:app_ecommerce/data/model/ItemsModle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  chingeCat(int val, String catVal);
  getItems(String categorId);
  gotToProductDetails(ItemsModle itemsModle);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;
  String? categorId;
  MyServices myServices = Get.find();

  ItemsData itemsData = ItemsData(Get.find());
  int deliverytime = 0;
  List data = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    search = TextEditingController();

    intialData();
    super.onInit();
  }

  intialData() {
    categories = Get.arguments['categoies'];
    selectedCat = Get.arguments['slectedCat'];
    categorId = Get.arguments['categorId'];
    deliverytime = myServices.sharedPreferences.getInt("deliverytime")!;
    List data = [];
    getItems(categorId!);
  }

  chingeCat(val, catVal) {
    selectedCat = val;
    categorId = catVal;
    getItems(categorId!);

    update();
  }

  getItems(categorId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categorId, myServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotToProductDetails(itemsModle) {
    Get.toNamed(AppRoute.itemsdetails, arguments: {
      "itemsModle": itemsModle,
    });
  }
}
