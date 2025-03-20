import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/data/datasource/remote/auth/verifycode_signup.dart';
import 'package:get/get.dart';

abstract class VerfiyCodeSignUpController extends GetxController {
  checkcode();
  goToCheckEmail(String verificationCode);
  resendVerfiyCode();
}

class VerfiyCodeSignUpControllerImp extends VerfiyCodeSignUpController {
  String? email;
  VerfiyCodeSignupData verfiyCodeSignupData = VerfiyCodeSignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkcode() {}

  @override
  goToCheckEmail(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verfiyCodeSignupData.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.sucesssignup);
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

  @override
  resendVerfiyCode() {
    verfiyCodeSignupData.resendData(email!);
  }
}
