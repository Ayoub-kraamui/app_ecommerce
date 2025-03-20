import 'package:app_ecommerce/core/class/crud.dart';
import 'package:app_ecommerce/linkapi.dart';

class VerfiyCodeForgetpasswordData {
  Crud crud;
  VerfiyCodeForgetpasswordData(this.crud);
  postData(String email, String verfiycode) async {
    var response = await crud.postData(AppLink.verfiycodeForgetpassword, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
