import 'package:app_ecommerce/core/class/crud.dart';
import 'package:app_ecommerce/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkOut, data);
    return response.fold((l) => l, (r) => r);
  }
}
