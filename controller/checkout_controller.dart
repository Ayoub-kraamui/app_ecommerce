import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/address_data.dart';
import 'package:app_ecommerce/data/datasource/remote/checkout_data.dart';
import 'package:app_ecommerce/data/model/addressmodle.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();

  String? paymentMethode;
  String? deliveryType;
  String addressId = "0";
  late int couponId;
  late String discountCoupon;

  late int priceorders;
  List<AddressModle> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethode = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(
      myServices.sharedPreferences.getInt("id")!.toString(),
    );

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        dataaddress.addAll(listData.map((e) => AddressModle.fromJson(e)));
        addressId = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethode == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar("Error", "Please select Shipping Adress");
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getInt("id").toString(),
      "addressid": addressId.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders.toString(),
      "couponid": couponId.toString(),
      "coupondiscount": discountCoupon.toString(),
      "paymentmethod": paymentMethode!.toString()
    };

    var response = await checkoutData.checkout(data);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments["couponid"];
    priceorders = Get.arguments["priceorder"];
    discountCoupon = Get.arguments["coupondiscount"].toString();

    getShippingAddress();
    super.onInit();
  }
}
