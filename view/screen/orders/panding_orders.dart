import 'package:app_ecommerce/controller/orders/panding_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/view/widget/order/orderlistcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPanding extends StatelessWidget {
  const OrdersPanding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPandingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Panding"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersPandingController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CardOrdersList(ordersModle: controller.data[index]);
                  },
                ));
          },
        ),
      ),
    );
  }
}
