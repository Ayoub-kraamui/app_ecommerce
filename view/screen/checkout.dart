import 'package:app_ecommerce/controller/checkout_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/constant/imageassets.dart';
import 'package:app_ecommerce/view/widget/checkout/cardashippingaddress.dart';
import 'package:app_ecommerce/view/widget/checkout/carddelivery.dart';
import 'package:app_ecommerce/view/widget/checkout/cardpaymentmethod.dart';
import 'package:app_ecommerce/view/widget/checkout/custombottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController());
    return Scaffold(
        appBar: AppBar(title: const Text("Check Out")),
        bottomNavigationBar: CustomBottomNavigationBar(
          title: "Checkout",
          onPressed: () {
            controller.checkout();
          },
        ),
        body: GetBuilder<CheckOutController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      const Text("Choose Payment Method",
                          style: TextStyle(
                              color: AppColor.secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0"); // 0 => Cach
                        },
                        child: CardPaymentMethodeCheckOut(
                          title: "Cach On Delivery",
                          isActive:
                              controller.paymentMethode == "0" ? true : false,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("1"); // 1 => Cards
                        },
                        child: CardPaymentMethodeCheckOut(
                          title: "Payment Cards",
                          isActive:
                              controller.paymentMethode == "1" ? true : false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Choose Delivery Type",
                          style: TextStyle(
                              color: AppColor.secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller
                                  .chooseDeliveryType("0"); // 0 => Delivery
                            },
                            child: CardDeliveryTypeCheckOut(
                                imageName: AppImageAssets.deliveryImage,
                                title: "Delivery",
                                active: controller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1"); // 1 => Recive
                            },
                            child: CardDeliveryTypeCheckOut(
                                imageName: AppImageAssets.driveThruImage,
                                title: "Recive",
                                active: controller.deliveryType == "1"
                                    ? true
                                    : false),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (controller.deliveryType == "0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.dataaddress.isNotEmpty)
                              const Text("Shipping Address",
                                  style: TextStyle(
                                      color: AppColor.secondColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            if (controller.dataaddress.isEmpty)
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoute.addressadd);
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Please Add Shoping Address \n Clic Here",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(height: 10),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAddress(controller
                                      .dataaddress[index].addressId!
                                      .toString());
                                },
                                child: CardShippingAddressCheckOut(
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    subTitle:
                                        "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                    isactive: controller.addressId ==
                                            "${controller.dataaddress[index].addressId}"
                                        ? true
                                        : false),
                              ),
                            )
                          ],
                        )
                    ],
                  ),
                ));
          },
        ));
  }
}
