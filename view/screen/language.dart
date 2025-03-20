import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/localization/changelocal.dart';
import 'package:app_ecommerce/view/widget/lanuage/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lanuage extends GetView<LocaleController> {
  const Lanuage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 20),
            CustomButtonLang(
                onPerssed: () {
                  controller.changeLang("ar");
                  Get.toNamed(AppRoute.onboarding);
                },
                title: "Ar"),
            CustomButtonLang(
                onPerssed: () {
                  controller.changeLang("en");
                  Get.toNamed(AppRoute.onboarding);
                },
                title: "En"),
          ],
        ),
      ),
    );
  }
}
