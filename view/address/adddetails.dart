import 'package:app_ecommerce/controller/address/adddetails_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/function/validinput.dart';
import 'package:app_ecommerce/core/shared/custombuttom.dart';
import 'package:app_ecommerce/view/widget/auth/customtextformfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdressAddDetails extends StatelessWidget {
  const AdressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Details Adress"),
      ),
      body: Container(child: GetBuilder<AddAddressDetailsController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                CustomTextFormFeildAuth(
                    hintText: "Enter You'r name",
                    lable: "Name",
                    iconData: Icons.person_add_alt_rounded,
                    mycontroller: controller.name,
                    valid: (val) {
                      return validInput(val!, 3, 50, "name");
                    },
                    isNumber: false),
                CustomTextFormFeildAuth(
                    hintText: "Enter You'r city",
                    lable: "City",
                    iconData: Icons.location_city,
                    mycontroller: controller.city,
                    valid: (val) {
                      return validInput(val!, 2, 50, "city");
                    },
                    isNumber: false),
                CustomTextFormFeildAuth(
                    hintText: "Enter You'r street",
                    lable: "Name",
                    iconData: Icons.streetview,
                    mycontroller: controller.street,
                    valid: (val) {
                      return validInput(val!, 2, 50, "street");
                    },
                    isNumber: false),
                CustomButtom(
                  text: "Add",
                  onPressed: () {
                    controller.addAddress();
                  },
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
