import 'dart:async';

import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  Position? postion;
  Completer<GoogleMapController>? completercontroller;
  List<Marker> markers = [];

  CameraPosition? kGooglePlex;
  StatusRequest statusRequest = StatusRequest.loading;
  double? lat;
  double? long;
  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.latitude;
    update();
  }

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(postion!.latitude, postion!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  goToPageAddDetailAddress() {
    Get.toNamed(AppRoute.addressaddDetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
