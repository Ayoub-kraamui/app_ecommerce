import 'package:app_ecommerce/core/class/crud.dart';
import 'package:app_ecommerce/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(
    String usersid,
  ) async {
    var response =
        await crud.postData(AppLink.ordersArchive, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  ratingData(String orderid, String rating, String noterating) async {
    var response = await crud.postData(AppLink.rating,
        {"id": orderid, "rating": rating, "noterating": noterating});
    return response.fold((l) => l, (r) => r);
  }
}
