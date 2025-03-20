import 'package:app_ecommerce/controller/forgetpassword/resatepassworde_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/function/validinput.dart';
import 'package:app_ecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:app_ecommerce/view/widget/auth/customcontant_textauth.dart';
import 'package:app_ecommerce/view/widget/auth/customtext_titleauth.dart';
import 'package:app_ecommerce/view/widget/auth/customtextformfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResatePassworde extends StatelessWidget {
  const ResatePassworde({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResatePasswordeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "41".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<ResatePasswordeControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  CustomTitleTextAuth(
                    text: "35".tr,
                  ),
                  const SizedBox(height: 10),
                  CustomContantTextAuth(text: "34".tr),
                  const SizedBox(height: 15),
                  CustomTextFormFeildAuth(
                      valid: (val) {
                        return validInput(val!, 8, 30, "password");
                      },
                      mycontroller: controller.password,
                      hintText: "34".tr,
                      lable: "35".tr,
                      iconData: Icons.lock_outline,
                      isNumber: false),
                  CustomTextFormFeildAuth(
                      valid: (val) {
                        return validInput(val!, 8, 30, "password");
                      },
                      mycontroller: controller.repassword,
                      hintText: "36".tr,
                      lable: "37".tr,
                      iconData: Icons.lock_outline,
                      isNumber: false),
                  CustomButtomAuth(
                      text: "33".tr,
                      onPressed: () {
                        controller.goToSuccessResatePassworde();
                      }),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
