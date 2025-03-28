import 'package:app_ecommerce/controller/notificationcontroller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Container(child: GetBuilder<NotificationController>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const Center(
                  child: Text(
                    "Notification",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                ...List.generate(
                    controller.data.length,
                    (index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Stack(
                            children: [
                              ListTile(
                                title: Text(controller.data[index]
                                    ['notification_title']),
                                subtitle: Text(controller.data[index]
                                    ['notification_body']),
                              ),
                              Positioned(
                                right: 5,
                                child: Text(
                                  Jiffy.parse(controller.data[index]
                                          ['notification_datetime'])
                                      .fromNow(),
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ))
              ],
            ),
          ),
        );
      },
    ));
  }
}
