import 'package:app_ecommerce/controller/auth/signup_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/function/alertexitapp.dart';
import 'package:app_ecommerce/core/function/validinput.dart';
import 'package:app_ecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:app_ecommerce/view/widget/auth/customcontant_textauth.dart';
import 'package:app_ecommerce/view/widget/auth/customtext_titleauth.dart';
import 'package:app_ecommerce/view/widget/auth/customtextformfeild.dart';
import 'package:app_ecommerce/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          title: Text(
            "17".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
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
                        text: "10".tr,
                      ),
                      const SizedBox(height: 10),
                      CustomContantTextAuth(text: "24".tr),
                      const SizedBox(height: 15),
                      CustomTextFormFeildAuth(
                          valid: (val) {
                            return validInput(val!, 5, 100, "username");
                          },
                          mycontroller: controller.username,
                          hintText: "23".tr,
                          lable: "20".tr,
                          iconData: Icons.person_outline,
                          isNumber: false),
                      CustomTextFormFeildAuth(
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          mycontroller: controller.email,
                          hintText: "12".tr,
                          lable: "18".tr,
                          iconData: Icons.email_outlined,
                          isNumber: false),
                      CustomTextFormFeildAuth(
                          valid: (val) {
                            return validInput(val!, 9, 100, "phone");
                          },
                          mycontroller: controller.phone,
                          hintText: "22".tr,
                          lable: "21".tr,
                          iconData: Icons.phone,
                          isNumber: true),
                      CustomTextFormFeildAuth(
                        valid: (val) {
                          return validInput(val!, 8, 100, "password");
                        },
                        mycontroller: controller.password,
                        hintText: "13".tr,
                        lable: "19".tr,
                        iconData: controller.isshowpassword
                            ? Icons.no_encryption_outlined
                            : Icons.lock_outline,
                        isNumber: false,
                        obscureText: controller.isshowpassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                      ),
                      CustomButtomAuth(
                          text: "17".tr,
                          onPressed: () {
                            controller.signUp();
                          }),
                      SizedBox(height: 20),
                      CustomTextSignUpOrSignIn(
                          textone: "25".tr,
                          texttwo: "26".tr,
                          onTap: () {
                            controller.goToSignIn();
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
