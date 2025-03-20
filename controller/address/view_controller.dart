import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/address_data.dart';
import 'package:app_ecommerce/data/model/addressmodle.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addData = AddressData(Get.find());
  List<AddressModle> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addData.getData(
      myServices.sharedPreferences.getInt("id")!.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModle.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(int addressid) async {
    addData.deleteAddress(
      addressid.toString(),
    );
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
