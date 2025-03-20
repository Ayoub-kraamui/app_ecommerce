import 'package:app_ecommerce/controller/setting_controller.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settins extends StatelessWidget {
  const Settins({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller = Get.put(SettingControllerImp());
    return Container(
      alignment: Alignment.center,
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 3, color: AppColor.primaryColor),
              Positioned(
                  top: Get.width / 3.8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: AssetImage(AppImageAssets.avatar),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children: [
                  // ListTile(
                  //     onTap: () {},
                  //     title: Text("Disable Notification"),
                  //     trailing: Switch(
                  //       value: true,
                  //       onChanged: (value) {},
                  //     )),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersPanding);
                    },
                    title: Text("Orders Panding"),
                    trailing: Icon(Icons.card_travel),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersArchive);
                    },
                    title: Text("Orders Archive"),
                    trailing: Icon(Icons.archive_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressview);
                    },
                    title: Text("Address"),
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("About us"),
                    trailing: Icon(Icons.help_outline_rounded),
                  ),
                  ListTile(
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+967775453026"));
                    },
                    title: Text("Contact us"),
                    trailing: Icon(Icons.phone_callback_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logOut();
                    },
                    title: Text("Logout"),
                    trailing: Icon(Icons.exit_to_app),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
