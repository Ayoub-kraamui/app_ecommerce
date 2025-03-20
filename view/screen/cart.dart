// ignore_for_file: prefer_const_constructors

import 'package:app_ecommerce/controller/cart_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/view/widget/card/custombottom_navigationbar.dart';
import 'package:app_ecommerce/view/widget/card/customcardlist.dart';
import 'package:app_ecommerce/view/widget/card/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        bottomNavigationBar: GetBuilder<CartControllerImp>(
          builder: (controller) => CustomBottomNavaigacionBarCart(
              controllerCoupon: controller.coupon,
              onApllyCoupon: () {
                controller.checkCoupon();
              },
              price: "${controller.totalpriceOrder} \$",
              disCount: "${controller.discountCoupon} %",
              shipping: "10 \$",
              totalPrice: "${controller.getTotalPrice()} \$"),
        ),
        body: GetBuilder<CartControllerImp>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  TopCardCart(
                      message:
                          "You Have ${controller.totalCountItems} Items In Your List"),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(
                            controller.data.length,
                            (index) => CustomItemsCardList(
                                  name: "${controller.data[index].itemsName}",
                                  price: "${controller.data[index].itemsprice}",
                                  image: "${controller.data[index].itemsImage}",
                                  count: "${controller.data[index].countitems}",
                                  onAdd: () async {
                                    await controller
                                        .add(controller.data[index].itemsId!);
                                    controller.refreshPage();
                                  },
                                  onRemove: () async {
                                    await controller.delete(
                                        controller.data[index].itemsId!);
                                    controller.refreshPage();
                                  },
                                ))
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
