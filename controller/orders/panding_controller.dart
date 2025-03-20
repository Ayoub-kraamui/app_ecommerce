import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/orders/panding.dart';
import 'package:app_ecommerce/data/model/ordersmodle.dart';
import 'package:get/get.dart';

class OrdersPandingController extends GetxController {
  OrdersPandingData ordersArchiveData = OrdersPandingData(Get.find());
  List<OrdersModle> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  String printTypeOrder(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrdersStatus(String val) {
    if (val == "0") {
      return "Pandin Approval";
    } else if (val == "1") {
      return "The Order is being Prepared";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    statusRequest = StatusRequest.loading;
    data.clear();
    update();
    var response = await ordersArchiveData
        .getData(myServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModle.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteOrders(String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.deleteData(orderid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrders();
  }

  goToPageTracking(OrdersModle ordersModle) {
    Get.toNamed(AppRoute.ordersTracking,
        arguments: {"ordersmodle": ordersModle});
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
