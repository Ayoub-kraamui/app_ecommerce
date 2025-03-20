import 'dart:async';
import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/getdecodepolyline.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/model/ordersmodle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
  GoogleMapController? gmc;
  List<Marker> markers = [];
  CameraPosition? cameraPosition;
  late OrdersModle ordersModle;
  StatusRequest statusRequest = StatusRequest.success;
  double? destlat;
  double? destlong;
  double? currentlat;
  double? currentlong;
  Set<Polyline> polylintSet = {};
  MyServices myServices = Get.find();

  intialData() {
    cameraPosition = CameraPosition(
      target: LatLng(ordersModle.addressLat!, ordersModle.addressLong!),
      zoom: 12.4746,
    );

    markers.add(Marker(
        markerId: MarkerId("current"),
        position: LatLng(ordersModle.addressLat!, ordersModle.addressLong!)));
  }

  initPolyline() async {
    destlat = ordersModle.addressLat!;
    destlong = ordersModle.addressLong!;
    await Future.delayed(Duration(seconds: 1));
    polylintSet = await getPolyLine(currentlat, currentlong, destlat, destlong);
    update();
  }

  getLocationDelivery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModle.ordersId!.toString())
        .snapshots()
        .listen((event) {
      if (event.exists) {
        destlat = event.get('lat');
        destlong = event.get('long');
        updataMarkerDelivery(destlat!, destlong!);
      }
    });
  }

  updataMarkerDelivery(double newlat, double newlong) {
    markers.removeWhere((element) => element.markerId.value == "dest");
    markers.add(
        Marker(markerId: MarkerId("dest"), position: LatLng(newlat, newlong)));
  }

  @override
  void onInit() {
    ordersModle = Get.arguments['ordersmodle'];
    intialData();
    //initPolyline();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
