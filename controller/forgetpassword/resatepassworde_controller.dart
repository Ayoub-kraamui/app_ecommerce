import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResatePasswordeController extends GetxController {
  resatepassworde();
  goToSuccessResatePassworde();
}

class ResatePasswordeControllerImp extends ResatePasswordeController {
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isshowpassword = true;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  resatepassworde() async {}

  @override
  goToSuccessResatePassworde() async {
    if (password.text != repassword.text) {
      Get.defaultDialog(title: "Worning", middleText: "Password Not Match");
    } else if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successresatepassworde);
        } else {
          Get.defaultDialog(title: "Worning", middleText: "Email Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void onClose() {
    password.dispose();
    repassword..dispose();
    super.onClose();
  }
}
