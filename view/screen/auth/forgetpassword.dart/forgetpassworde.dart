import 'package:app_ecommerce/controller/forgetpassword/forgetpassworde_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/function/validinput.dart';
import 'package:app_ecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:app_ecommerce/view/widget/auth/customcontant_textauth.dart';
import 'package:app_ecommerce/view/widget/auth/customtext_titleauth.dart';
import 'package:app_ecommerce/view/widget/auth/customtextformfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordeAuth extends StatelessWidget {
  const ForgetPasswordeAuth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordeControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          title: Text(
            "14".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: GetBuilder<ForgetPasswordeControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      CustomTitleTextAuth(
                        text: "27".tr,
                      ),
                      const SizedBox(height: 10),
                      CustomContantTextAuth(text: "29".tr),
                      const SizedBox(height: 15),
                      CustomTextFormFeildAuth(
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          mycontroller: controller.email,
                          hintText: "12".tr,
                          lable: "18".tr,
                          iconData: Icons.email_outlined,
                          isNumber: false),
                      CustomButtomAuth(
                          text: "30".tr,
                          onPressed: () {
                            controller.checkemail();
                          }),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              )),
        ));
  }
}
