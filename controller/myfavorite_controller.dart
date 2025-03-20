import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/myfavorite.dart';
import 'package:app_ecommerce/data/model/myfavoritemodle.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends GetxController {
  getData();
  deleteMyFavorite(String favoriteid);
}

class MyFavoriteControllerImp extends MyFavoriteController {
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  List<MyfavoriteModle> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  late var response;
  @override
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData
        .getData(myServices.sharedPreferences.getInt("id")!.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyfavoriteModle.fromJson(e)));
        print(".................................data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteMyFavorite(favoriteid) {
    //statusRequest = StatusRequest.loading;
    response = myFavoriteData.deleteMyFavorite(favoriteid);
    data.removeWhere((element) => element.favoriteId == int.parse(favoriteid));

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
