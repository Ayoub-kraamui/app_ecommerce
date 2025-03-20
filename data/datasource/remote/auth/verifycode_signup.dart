import 'package:app_ecommerce/core/class/crud.dart';
import 'package:app_ecommerce/linkapi.dart';

class VerfiyCodeSignupData {
  Crud crud;
  VerfiyCodeSignupData(this.crud);
  postData(String email, String verfiycode) async {
    var response = await crud.postData(AppLink.verfiycodeSignUp, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
