import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/data/datasource/remote/forgetpassword/verfiycode.dart';
import 'package:get/get.dart';

abstract class VerfiyCodeController extends GetxController {
  checkcode();
  goToResarepassword(String verificationCode);
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  String? email;
  VerfiyCodeForgetpasswordData checkEmailData =
      VerfiyCodeForgetpasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkcode() {}
  @override
  goToResarepassword(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkEmailData.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resatepassworde, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Worning", middleText: "Verfiy Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}
