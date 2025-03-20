import 'package:app_ecommerce/controller/home_controller.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/function/translatedatabase.dart';
import 'package:app_ecommerce/data/model/ItemsModle.dart';
import 'package:app_ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ItemsHome(
                itemsModle: ItemsModle.fromJson(controller.items[index]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModle itemsModle;
  const ItemsHome({super.key, required this.itemsModle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotToProductDetails(itemsModle);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Image.network(
              "${AppLink.imageItem}/${itemsModle.itemsImage}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 120,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.black.withOpacity(0.3),
            ),
          ),
          Positioned(
              left: controller.lang == "en" ? 10 : 40,
              child: Text(
                "${translateDatabase(itemsModle.itemsNameAr, itemsModle.itemsName)}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ))
        ],
      ),
    );
  }
}
