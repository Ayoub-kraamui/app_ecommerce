import 'package:app_ecommerce/binding/binding.dart';
import 'package:app_ecommerce/core/localization/changelocal.dart';
import 'package:app_ecommerce/core/localization/translation.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//تم التطوير بواسطة المهندس أيوب كرامي

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      initialBinding: MyBinding(),
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      //routes: routes,
      title: 'Flutter Demo',
      locale: controller.Language,
      theme: controller.appTheme,
      getPages: routes,
    );
  }
}
