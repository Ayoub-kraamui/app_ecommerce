import 'dart:async';

import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/orders/details.dart';
import 'package:app_ecommerce/data/model/cartmodle.dart';
import 'package:app_ecommerce/data/model/ordersmodle.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModle ordersModle;
  late Completer<GoogleMapController> completercontroller;
  List<Marker> markers = [];
  double? lat;
  double? long;
  CameraPosition? cameraPosition;
  List<CartModle> data = [];
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  intialData() async {
    completercontroller = Completer<GoogleMapController>();
    if (ordersModle.ordersType == 0) {
      cameraPosition = CameraPosition(
        target: LatLng(ordersModle.addressLat!, ordersModle.addressLong!),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(ordersModle.addressLat!, ordersModle.addressLong!)));
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await ordersDetailsData.getData(ordersModle.ordersId!.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModle.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModle = Get.arguments['ordersmodle'];
    intialData();
    getData();
    super.onInit();
  }
}
