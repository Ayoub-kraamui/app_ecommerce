import 'package:app_ecommerce/controller/onboarding_controller.dart';
import 'package:app_ecommerce/view/widget/onboarding/custombuttom.dart';
import 'package:app_ecommerce/view/widget/onboarding/custompageview.dart';
import 'package:app_ecommerce/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardeingControllerImp());
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: CustomPageViewOnboarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    DotControllerOnboarding(),
                    Spacer(flex: 2),
                    CustomButtomOnboarding(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
