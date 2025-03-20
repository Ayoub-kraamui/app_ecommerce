import 'package:app_ecommerce/controller/itemsdetails_controller.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TopPageItemDetails extends GetView<ItemsDetailsControllerImp> {
  const TopPageItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            color: AppColor.secondColor,
          ),
        ),
        Positioned(
          top: 30.0,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModle.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageItem}/${controller.itemsModle.itemsImage!}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
