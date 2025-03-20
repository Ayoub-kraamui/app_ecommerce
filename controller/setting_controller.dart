import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {
  logOut();
}

class SettingControllerImp extends SettingController {
  MyServices myServices = Get.find();
  @override
  logOut() {
    String userid = myServices.sharedPreferences.getInt("id")!.toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
