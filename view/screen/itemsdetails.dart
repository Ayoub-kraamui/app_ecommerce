import 'package:app_ecommerce/controller/itemsdetails_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/function/translatedatabase.dart';
import 'package:app_ecommerce/view/widget/itemsdetails.dart/coloritems.dart';
import 'package:app_ecommerce/view/widget/itemsdetails.dart/priceandcount.dart';
import 'package:app_ecommerce/view/widget/itemsdetails.dart/toppageitemdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImp controller = Get.put(ItemsDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: MaterialButton(
            color: AppColor.secondColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              controller.goToCart();
            },
            child: const Text(
              "Go to Card",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<ItemsDetailsControllerImp>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const TopPageItemDetails(),
                  const SizedBox(height: 100),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${translateDatabase(controller.itemsModle.itemsNameAr, controller.itemsModle.itemsName)}",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: AppColor.fourthColor),
                        ),
                        const SizedBox(height: 10),
                        PriceAndCountItems(
                            onPressedAdd: () {
                              controller.add();
                            },
                            count: "${controller.countItems}",
                            onPressedRemove: () {
                              controller.remove();
                            },
                            price:
                                "${controller.itemsModle.itemsPriceDiscount}"),
                        const SizedBox(height: 10),
                        Text(
                            "${translateDatabase(controller.itemsModle.itemsDescAr, controller.itemsModle.itemsDesc)}${translateDatabase(controller.itemsModle.itemsDescAr, controller.itemsModle.itemsDesc)}${translateDatabase(controller.itemsModle.itemsDescAr, controller.itemsModle.itemsDesc)}${translateDatabase(
                              controller.itemsModle.itemsDescAr,
                              controller.itemsModle.itemsDesc,
                            )}",
                            style: Theme.of(context).textTheme.bodyText1),
                        const SizedBox(height: 10),
                        Text("Color",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: AppColor.fourthColor)),
                        const SizedBox(height: 10),
                        const ColorItems(),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
