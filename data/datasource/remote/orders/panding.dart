import 'package:app_ecommerce/core/class/crud.dart';
import 'package:app_ecommerce/linkapi.dart';

class OrdersPandingData {
  Crud crud;
  OrdersPandingData(this.crud);
  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.ordersPanding, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersDelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
