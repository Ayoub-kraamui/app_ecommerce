import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LogInController extends GetxController {
  login();
  goToSignUp();
  goToforgetPassworde();
}

class LogInControllerImp extends LogInController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isshowpassword = true;

  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  String? token;
  StatusRequest statusRequest = StatusRequest.none;
  showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences
                .setInt("id", response['data']['users_id']);
            String userid =
                myServices.sharedPreferences.getInt("id")!.toString();
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);

            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");

            Get.offNamed(AppRoute.homepage);
          } else {
            Get.toNamed(AppRoute.verfiycodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Worning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  goToforgetPassworde() {
    Get.offNamed(AppRoute.forgetepassworde);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
