import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/home_data.dart';
import 'package:app_ecommerce/data/model/ItemsModle.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeControllerImp extends SearchMixController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List settingsdata = [];

  int? id;
  String? username;
  String? lang;

  String titleHomeCard = "";
  String bodyHomeCard = "";
  int deliveryTime = 0;
  intiialData() {
    lang = myServices.sharedPreferences.getString("lang");
    id = myServices.sharedPreferences.getInt("id");
    username = myServices.sharedPreferences.getString("username");
  }

  void onInit() {
    getData();
    intiialData();
    search = TextEditingController();

    // sendaccessToken();
    print("............................................");
    FirebaseMessaging.instance.subscribeToTopic("users");
    super.onInit();
  }

  // sendaccessToken() async {
  //   statusRequest = StatusRequest.loading;
  //   String accessToken = await GetSrevesKey.getServesToken();
  //   var response = await homeData.sendserverKey(accessToken.toString());
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       categories.addAll(response['categories']['data']);
  //       items.addAll(response['items']['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        //String token = await GetSrevesKey.getServesToken();
        //print(token);
        settingsdata.addAll(response['settings']['data']);
        titleHomeCard = settingsdata[0]['settings_title'];
        bodyHomeCard = settingsdata[0]['settings_body'];
        deliveryTime = settingsdata[0]['settings_deliverytime'];
        myServices.sharedPreferences.setInt("deliverytime", deliveryTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotToItems(List categoies, int slectedCat, String categorId) {
    Get.toNamed(AppRoute.items, arguments: {
      "categoies": categories,
      "slectedCat": slectedCat,
      "categorId": categorId,
    });
  }

  gotToProductDetails(ItemsModle itemsModle) {
    Get.toNamed(AppRoute.itemsdetails, arguments: {
      "itemsModle": itemsModle,
    });
  }
}

class SearchMixController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  List<ItemsModle> listData = [];

  TextEditingController? search;
  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModle.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
