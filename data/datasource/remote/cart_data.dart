import 'package:app_ecommerce/core/class/crud.dart';
import 'package:app_ecommerce/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartAdd, {"usersid": usersid.toString(), "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartDelete, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getcountitems(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.getcountitems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  cartView(String usersid) async {
    var response = await crud.postData(AppLink.cartView, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"couponname": couponName});
    return response.fold((l) => l, (r) => r);
  }
}
