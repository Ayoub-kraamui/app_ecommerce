import 'package:app_ecommerce/core/class/crud.dart';
import 'package:app_ecommerce/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(AppLink.logIn, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
