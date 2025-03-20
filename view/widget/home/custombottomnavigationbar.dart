import 'package:app_ecommerce/controller/homescreen_controller.dart';
import 'package:app_ecommerce/view/widget/home/custombuttonapptbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBarHome extends StatelessWidget {
  const CustomBottomNavigationBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomButtonAppBar(
                      title: controller.buttonAppBar[i]["title"],
                      icon: controller.buttonAppBar[i]["icon"],
                      active: controller.currentPage == i ? true : false,
                      onPressed: () => controller.chingePage(i),
                    );
            })
          ],
        ),
      ),
    );
  }
}
