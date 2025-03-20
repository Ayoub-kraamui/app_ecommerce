// ignore_for_file: prefer_const_constructors

import 'package:app_ecommerce/controller/cart_controller.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/view/widget/card/custombuttomcoupon.dart';
import 'package:app_ecommerce/view/widget/card/custombuttoncart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavaigacionBarCart extends GetView<CartControllerImp> {
  final String price;
  final String disCount;
  final String shipping;
  final String totalPrice;
  final TextEditingController? controllerCoupon;
  final void Function()? onApllyCoupon;
  const CustomBottomNavaigacionBarCart(
      {super.key,
      required this.price,
      required this.disCount,
      required this.shipping,
      required this.totalPrice,
      required this.controllerCoupon,
      required this.onApllyCoupon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartControllerImp>(
            builder: (controller) {
              return controller.couponName == null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: controllerCoupon,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10),
                                    border: OutlineInputBorder(),
                                    hintText: "Coupon Code"),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              flex: 1,
                              child: CustomButtonCoupon(
                                title: "apply",
                                onPerssed: onApllyCoupon,
                              ))
                        ],
                      ),
                    )
                  : Container(
                      child: Text(
                        "Coupon Code ${controller.couponName}",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    );
            },
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Price", style: TextStyle(fontSize: 16))),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(price, style: TextStyle(fontSize: 16)))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:
                            Text("disCount", style: TextStyle(fontSize: 16))),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(disCount, style: TextStyle(fontSize: 16)))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:
                            Text("shipping", style: TextStyle(fontSize: 16))),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(shipping, style: TextStyle(fontSize: 16)))
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Total Price",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor))),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(totalPrice,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor)))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          CustomButtonCart(
              title: "Order",
              onPerssed: () {
                controller.goToPageCheckOut();
              }),
        ],
      ),
    );
  }
}
