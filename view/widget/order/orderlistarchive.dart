import 'package:app_ecommerce/controller/orders/archive_controller.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/data/model/ordersmodle.dart';
import 'package:app_ecommerce/view/widget/order/rating_dailog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModle ordersModle;
  const CardOrdersListArchive({super.key, required this.ordersModle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Number : ${ordersModle.ordersId}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Row(
              children: [
                Text(
                    "Order Type : ${controller.printTypeOrder(ordersModle.ordersType.toString())}"),
                const Spacer(),
                Text(
                  Jiffy.parse(ordersModle.ordersDatetime!).fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text("Order price : ${ordersModle.ordersPrice} \$"),
            Text("Delivery : ${ordersModle.ordersPricedelivery} \$"),
            Text(
                "Payment Methed : ${controller.printPaymentMethod(ordersModle.ordersPayment.toString())} "),
            Text(
                "Orders Status : ${controller.printOrdersStatus(ordersModle.ordersStatus.toString())} "),
            Divider(),
            Row(
              children: [
                Text("Total Price : ${ordersModle.ordersTotalprice} \$",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                MaterialButton(
                  color: AppColor.thirColor,
                  textColor: Colors.white,
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails,
                        arguments: {"ordersmodle": ordersModle});
                  },
                  child: const Text("Details"),
                ),
                const SizedBox(width: 10),
                if (ordersModle.ordersRating == 0)
                  MaterialButton(
                    color: AppColor.thirColor,
                    textColor: Colors.white,
                    onPressed: () {
                      showDialogRating(context, ordersModle.ordersId!);
                    },
                    child: const Text("Rating"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
