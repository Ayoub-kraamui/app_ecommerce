//import 'package:app_ecommerce/controller/auth/signup_controller.dart';
import 'package:app_ecommerce/core/class/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    //Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}
