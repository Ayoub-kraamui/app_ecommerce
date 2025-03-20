import 'package:app_ecommerce/controller/onboarding_controller.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPageViewOnboarding extends GetView<OnBoardeingControllerImp> {
  const CustomPageViewOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) => controller.onPageChange(value),
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(
              onBoardingList[index].image!,
              //width: 200,
              height: Get.width / 1.3,
              //fit: BoxFit.fill,
            ),
            SizedBox(height: 40),
            Text(
              onBoardingList[index].title!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColor.black),
            ),
            const SizedBox(height: 20),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[index].body!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      height: 2,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ))
          ],
        );
      },
    );
  }
}
