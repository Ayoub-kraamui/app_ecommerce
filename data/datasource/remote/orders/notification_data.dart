import 'package:app_ecommerce/core/class/crud.dart';
import 'package:app_ecommerce/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.notification, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
