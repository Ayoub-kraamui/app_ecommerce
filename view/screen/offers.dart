import 'package:app_ecommerce/controller/favorite_controller.dart';
import 'package:app_ecommerce/controller/offers_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/view/screen/home.dart';
import 'package:app_ecommerce/view/widget/customappbar.dart';
import 'package:app_ecommerce/view/widget/offers/customgridviewoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteControllerImp());
    return GetBuilder<OffersController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            CustomAppBar(
              mycontroller: controller.search!,
              title: "Find Product",
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myfavorite);
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
            ),
            const SizedBox(height: 20),
            !controller.isSearch
                ? HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) => CustomGridViewOffers(
                            itemsModle: controller.data[index])))
                : ListItemsSearch(listDataModle: controller.listData),
          ],
        ),
      ),
    );
  }
}
