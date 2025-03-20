import 'package:app_ecommerce/controller/myfavorite_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/view/widget/myfavorite/customgridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteControllerImp>(
            builder: (controller) => ListView(
              children: [
                // CustomAppBar(
                //   title: "Find Product",
                //   onPressedSearch: () {},
                //   onPressedIconFavorite: () {},
                // ),
                const SizedBox(height: 20),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        return CustomGridMyFavoriteView(
                            myfavoriteModle: controller.data[index]);
                      },
                    )),
              ],
            ),
          )),
    );
  }
}
