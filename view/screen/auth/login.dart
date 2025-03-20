import 'package:app_ecommerce/controller/auth/login_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/function/alertexitapp.dart';
import 'package:app_ecommerce/core/function/validinput.dart';
import 'package:app_ecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:app_ecommerce/view/widget/auth/customcontant_textauth.dart';
import 'package:app_ecommerce/view/widget/auth/customtext_titleauth.dart';
import 'package:app_ecommerce/view/widget/auth/customtextformfeild.dart';
import 'package:app_ecommerce/view/widget/auth/logoauth.dart';
import 'package:app_ecommerce/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "9".tr,
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
        child: GetBuilder<LogInControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      LogoAuth(),
                      CustomTitleTextAuth(
                        text: "10".tr,
                      ),
                      const SizedBox(height: 10),
                      CustomContantTextAuth(text: "11".tr),
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
                      GetBuilder<LogInControllerImp>(
                        builder: (controller) => CustomTextFormFeildAuth(
                          valid: (val) {
                            return validInput(val!, 8, 30, "password");
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
                      ),
                      InkWell(
                          onTap: () {
                            controller.goToforgetPassworde();
                          },
                          child: Text("14".tr, textAlign: TextAlign.end)),
                      CustomButtomAuth(
                          text: "15".tr,
                          onPressed: () {
                            controller.login();
                          }),
                      const SizedBox(height: 20),
                      CustomTextSignUpOrSignIn(
                          textone: "16".tr,
                          texttwo: "17".tr,
                          onTap: () {
                            controller.goToSignUp();
                          })
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
