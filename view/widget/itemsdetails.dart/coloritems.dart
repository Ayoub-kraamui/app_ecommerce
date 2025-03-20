import 'package:app_ecommerce/controller/itemsdetails_controller.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorItems extends GetView<ItemsDetailsControllerImp> {
  const ColorItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subItems[index]["active"] == "1"
                    ? AppColor.fourthColor
                    : Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${controller.subItems[index]["name"]}",
              style: TextStyle(
                  color: controller.subItems[index]["active"] == "1"
                      ? Colors.white
                      : AppColor.fourthColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
