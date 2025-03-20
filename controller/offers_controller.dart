import 'package:app_ecommerce/controller/home_controller.dart';
import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/data/datasource/remote/offers_data.dart';
import 'package:app_ecommerce/data/model/ItemsModle.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OfferData offerData = OfferData(Get.find());
  List<ItemsModle> data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offerData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata2 = response['data'];
        data.addAll(listdata2.map((e) => ItemsModle.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    search = TextEditingController();
    super.onInit();
  }
}
