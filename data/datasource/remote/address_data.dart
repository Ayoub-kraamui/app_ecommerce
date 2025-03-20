import 'package:app_ecommerce/core/class/crud.dart';
import 'package:app_ecommerce/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.addressView, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addAddress(String usersid, String name, String city, String street,
      String lat, String long) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String addressid) async {
    var response =
        await crud.postData(AppLink.addressDelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
