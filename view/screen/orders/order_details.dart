import 'package:app_ecommerce/controller/orders/ordersdetails_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              const TableRow(children: [
                                Text(
                                  "Product",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("QIY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              ...List.generate(
                                controller.data.length,
                                (index) => TableRow(children: [
                                  Text(controller.data[index].itemsName!,
                                      textAlign: TextAlign.center),
                                  Text(
                                      controller.data[index].itemsCount!
                                          .toString(),
                                      textAlign: TextAlign.center),
                                  Text(
                                      controller.data[index].itemsPrice!
                                          .toString(),
                                      textAlign: TextAlign.center),
                                ]),
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "Total Price : ${controller.ordersModle.ordersTotalprice!.toString()}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.ordersModle.ordersType == 0)
                    Card(
                      child: Container(
                        child: ListTile(
                          title: Text("Shopping Address"),
                          subtitle: Text(
                              "${controller.ordersModle.addressCity} ${controller.ordersModle.addressStreet}"),
                        ),
                      ),
                    ),
                  if (controller.ordersModle.ordersType == 0)
                    Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        height: 300,
                        width: double.infinity,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: controller.markers.toSet(),
                          initialCameraPosition: controller.cameraPosition!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controller.completercontroller
                                .complete(controllermap);
                          },
                        ),
                      ),
                    )
                ],
              ),
            ),
          )),
    );
  }
}
