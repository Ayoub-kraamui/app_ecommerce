import 'package:app_ecommerce/controller/address/view_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/data/model/addressmodle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdressView extends StatelessWidget {
  const AdressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Address"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addressadd);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<AddressViewController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return CardAddress(
                    addressModle: controller.data[index],
                    onDelete: () {
                      controller
                          .deleteAddress(controller.data[index].addressId!);
                    },
                  );
                },
              )),
            );
          },
        ));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModle addressModle;
  final void Function()? onDelete;
  const CardAddress(
      {super.key, required this.addressModle, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(addressModle.addressName!),
          subtitle: Text(
              "${addressModle.addressCity!} ${addressModle.addressStreet}"),
          trailing:
              IconButton(onPressed: onDelete, icon: Icon(Icons.delete_outline)),
        ),
      ),
    );
  }
}
