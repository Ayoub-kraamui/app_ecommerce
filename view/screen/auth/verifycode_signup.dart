import 'package:app_ecommerce/controller/auth/verfiycodeSignup_controllerI.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/view/widget/auth/customcontant_textauth.dart';
import 'package:app_ecommerce/view/widget/auth/customtext_titleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUpAuth extends StatelessWidget {
  const VerfiyCodeSignUpAuth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeSignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "43".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<VerfiyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(
              children: [
                CustomTitleTextAuth(
                  text: "44".tr,
                ),
                const SizedBox(height: 10),
                CustomContantTextAuth(text: "${"42".tr} ${controller.email}"),
                const SizedBox(height: 15),
                OtpTextField(
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(15),
                  numberOfFields: 5,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.goToCheckEmail(verificationCode);
                  }, // end onSubmit
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.resendVerfiyCode();
                  },
                  child: const Center(
                      child: Text(
                    "Resend verfiy code",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 20,
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
