import 'package:app_ecommerce/controller/home_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/data/model/ItemsModle.dart';
import 'package:app_ecommerce/linkapi.dart';
import 'package:app_ecommerce/view/widget/customappbar.dart';
import 'package:app_ecommerce/view/widget/home/Listcategories.dart';
import 'package:app_ecommerce/view/widget/home/customcardhome.dart';
import 'package:app_ecommerce/view/widget/home/customtitlehome.dart';
import 'package:app_ecommerce/view/widget/home/listitemshome.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCardHome(
                              title: "${controller.titleHomeCard}",
                              subTitle: "${controller.bodyHomeCard}"),
                          const CustomTitleHome(title: "Categories"),
                          const ListCategoriesHome(),
                          const CustomTitleHome(title: "Top Selling"),
                          const ListItemsHome(),
                        ],
                      )
                    : ListItemsSearch(listDataModle: controller.listData)),
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModle> listDataModle;
  const ListItemsSearch({super.key, required this.listDataModle});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listDataModle.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.gotToProductDetails(listDataModle[index]);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItem}/${listDataModle[index].itemsImage}",
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text("${listDataModle[index].categoriesName}"),
                          subtitle: Text("${listDataModle[index].itemsPrice}"),
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
