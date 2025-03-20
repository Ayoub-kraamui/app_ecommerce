import 'package:app_ecommerce/controller/orders/panding_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true);
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("==============Notification==============");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotfiction(message.data);
  });
}

refreshPageNotfiction(data) {
  print("======================================");
  print(data['pageid']);
  print('==========================');
  print(data['pagename']);
  print('==========================');

  print(Get.currentRoute);
  if (Get.currentRoute == "/orderpanding" &&
      data['pagename'] == 'refrshorderpanding') {
    OrdersPandingController controller = Get.find();
    controller.refreshOrder();
  }
}
