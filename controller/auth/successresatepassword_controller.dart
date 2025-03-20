import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:get/get.dart';

abstract class SuccessResatePasswordController extends GetxController {
  goToPageLogin();
}

class SuccessResatePasswordControllerImp
    extends SuccessResatePasswordController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
