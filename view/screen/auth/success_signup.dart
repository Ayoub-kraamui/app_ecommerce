import 'package:app_ecommerce/controller/auth/successsginup_controller.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessGoToSignUp extends StatelessWidget {
  const SuccessGoToSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "32".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.check_circle_outline,
                  size: 200,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "39".tr,
                  style: Theme.of(context).textTheme.headline2!,
                ),
              ),
              Center(child: Text("40".tr)),
              Spacer(),
              Container(
                  width: double.infinity,
                  child: CustomButtomAuth(
                    text: "31".tr,
                    onPressed: () {
                      controller.goToPageLogin();
                    },
                  )),
              SizedBox(height: 30),
            ],
          )),
    );
  }
}
