import 'package:app_ecommerce/core/class/status_request.dart';
import 'package:app_ecommerce/core/function/handlingdata_controller.dart';
import 'package:app_ecommerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

// class GetSrevesKey {
//   static Future<String> getServesToken() async {
//     final scopes = [
//       'https://www.googleapis.com/auth/userinfo.email',
//       'https://www.googleapis.com/auth/firebase.database',
//       'https://www.googleapis.com/auth/firebase.messaging',
//     ];

//     final client = await clientViaServiceAccount(
//       ServiceAccountCredentials.fromJson({
//   "type": "service_account",
//   "project_id": "e-commerce-1eecb",
//   "private_key_id": "a89c7fdb085e1c03b69ce4c816f725d33c2ca863",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDScREAvmRlTOmS\ngz0mZF8rNbwfGd3KLwYyb6LyeoN2xhDQXikv7MGp8nc+VRUa+CBMvQkQUr7VEpD6\n03Gri8cPC6p475RBQzF/5LmGXFrgnEDDQTtyGANJQQXjf0ULQr99yCR/2rzIJELu\nkylA54bWQ9vl8NzgzUdO2+8k4u57e9+Z9RSKRTRloraQUsN49P3PJoqg0DCHjBUE\nfpwJjaZXvm47yn9ccUCD9+PP6W9o7YG8ox5ThVC1LNo6mMh+Tjxm4WubvV2JYheM\nhNRV8hC8XL1/kcw8XTSw+5LiI1ycV7k8bYK6hzWo+/ZhqO2JYCj42+aCvtr8Irfg\nW/9/kUtnAgMBAAECggEADaP2ji3JJCfQHAcVt59Z69sXzoxGrAxQQoSp8z2tt80u\n2dLAqLKX+wQUZp3tOEpNDaxTIhO6+uSxMRDzlUMCLB99dUlSOsi4NKoGvIbP/S8j\no4Re7g5QaDcmwpBFUW2KLAUFGKR9CBwRmpU/X02il9DeOBFcv9WOgbYP0jxDaQ2I\nT/4OAyn6gBp2j8clRfUJ8pjsh3ikyYLQTW5dzXCNK6viC/1/b/ITmhTFow+gX8th\nuUugCpVFC5GCty4ibpfA2ZV5NaUTCNjj01gwSDEKuVjtQ305Mi/3fcgRdq75bJmz\nr0b+dxvEVX7yqM1YRfYZlcF07dT0e+g4VXosBg8MwQKBgQD4dHXGcKXTwfzpbzw8\ngbSTe/ItUUc91+CHB6WZaKpOuLj3LiNhv5qDa2/cyFqCPUd5K/U1nFqBV2RGGcQh\nZ/eFySukoSgu8407xxOMr2XFOauWoRWnbDSRM+L+6DZWeBdB3MpT9PM7+/lvCwIQ\n6fURZ5m+QSo3GVCdw6MG3nX4awKBgQDY1RVcfWtzUOhprgCHI/LNLei52hIXrcQI\nbb3ROVVx4fiV6nx7xyxXHsa3+UKL0b/50eyAsBj+kAKI/4OPqUAWeaclSMmw4Uk/\nUAxM7k1x7229gM5NWIaMe60c+HQCEb5HlfRQJtRe17hGRNBCJgZby2kL2scfQQfX\nuEr1uQbn9QKBgBsFz6l9pwuZFcDt8EdEdDd2S6jSJkV7rVgCZOiCkcNuI+/+fKqt\nBEk27ju9Ltrrf1KWjVz/XHik4KsfMk3P2QQcFTsarBwvMTVHOcEbcp4434jKjGhh\nRHZmhlHjP8W32g+3y+nFwo7LoR2KvPbJ+3WhJv+iZs0HW9VM6fZdS8dxAoGAV5to\nYREvi80BykkKX4+vtyS4Zfbs3nJPxRQJ4HHoyvWBCZlPKHelu6FsqsJkF7fsd9RQ\nWQJNZvTqgU2zayT4BtyqIs9Q5k1v2cvO3HpgAgu57BoRwIBnBHWn0Q+1V2yx05yL\ntKKrpZJFGucMud1BLm92BtsjHsaYk5kbeEKEvs0CgYBl8O54Mj7S3MqLUI48Utqn\nkdKcfaVrl+AQHUHcaRRJntMnfobN0gf8DbhJEfvgqnkxY/AK89zc2Hrca+fzHYcy\nvzyl2spFbFHjfQNgIagZiuXBVAIeUo9h7y7uTMJ56GQbq57I0QlVWLpIyMFHeUF2\nfMEj/mUfJXWTE/Nb6gtsoA==\n-----END PRIVATE KEY-----\n",
//   "client_email": "firebase-adminsdk-lui3q@e-commerce-1eecb.iam.gserviceaccount.com",
//   "client_id": "115040819962771348564",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-lui3q%40e-commerce-1eecb.iam.gserviceaccount.com",
//   "universe_domain": "googleapis.com"
// }
// ),
//       scopes,
//     );
//     final accessServerKey = client.credentials.accessToken.data;
//     return accessServerKey;
//   }
//}
