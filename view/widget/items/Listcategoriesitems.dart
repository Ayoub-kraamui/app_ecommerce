import 'package:app_ecommerce/controller/home_controller.dart';
import 'package:app_ecommerce/controller/items_controller.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/function/translatedatabase.dart';
import 'package:app_ecommerce/data/model/categoriesmodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<HomeControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.gotToItems(controller.categories, i!);
        controller.chingeCat(i!, categoriesModel.categoriesId!.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) {
              return Container(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                decoration: controller.selectedCat! == i
                    ? const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: AppColor.primaryColor)))
                    : null,
                child: Text(
                  "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                  style: const TextStyle(fontSize: 20, color: AppColor.grey2),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
