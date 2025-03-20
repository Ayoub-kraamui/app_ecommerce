import 'package:app_ecommerce/view/screen/home.dart';
import 'package:app_ecommerce/view/screen/notification.dart';
import 'package:app_ecommerce/view/screen/offers.dart';
import 'package:app_ecommerce/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  chingePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPage = const [
    Home(),
    NotificationView(),
    OffersView(),
    Settins(),
  ];
  List buttonAppBar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Notification", "icon": Icons.notifications_active_outlined},
    {"title": "Offers", "icon": Icons.offline_bolt_outlined},
    {"title": "Setting", "icon": Icons.settings},
  ];
  List<IconData> iconButtonAppBar = [
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.favorite,
  ];
  @override
  chingePage(int index) {
    currentPage = index;
    update();
  }
}
