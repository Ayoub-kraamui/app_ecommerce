import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  String? lat;
  String? long;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  AddressData addData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addData.addAddress(
      myServices.sharedPreferences.getInt("id")!.toString(),
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Error", "Now , You Can Order to this address");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    initialData();
    super.onInit();
  }
}
