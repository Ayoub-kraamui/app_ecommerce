import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBb8lb-X9fiiYGWUSvX-cGd41oU-ZY2RmE",
            appId: "1:691865056579:android:7639cc2b20130666b9ebf6",
            messagingSenderId: "691865056579",
            projectId: "e-commerce-1eecb",
            storageBucket: "e-commerce-1eecb.appspot.com"));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initServices() async {
  await Get.putAsync(() => MyServices().init());
}
