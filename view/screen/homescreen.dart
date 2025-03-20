import 'dart:io';

import 'package:app_ecommerce/controller/homescreen_controller.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/view/widget/home/custombottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        body: WillPopScope(
          child: controller.listPage.elementAt(controller.currentPage),
          onWillPop: () {
            Get.defaultDialog(
                title: "warning",
                middleText: "Do you want To Exit The app",
                confirmTextColor: AppColor.secondColor,
                buttonColor: AppColor.thirColor,
                titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.primaryColor),
                onConfirm: () {
                  exit(0);
                },
                onCancel: () {},
                cancelTextColor: AppColor.secondColor);
            return Future.value(false);
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationBarHome(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          backgroundColor: AppColor.primaryColor,
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
