import 'package:app_ecommerce/controller/favorite_controller.dart';
import 'package:app_ecommerce/controller/items_controller.dart';
import 'package:app_ecommerce/core/class/handlingdata_view.dart';
import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/data/model/ItemsModle.dart';
import 'package:app_ecommerce/linkapi.dart';
import 'package:app_ecommerce/view/widget/customappbar.dart';
import 'package:app_ecommerce/view/widget/items/Listcategoriesitems.dart';
import 'package:app_ecommerce/view/widget/items/customgridview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controllerIte = Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              mycontroller: controllerIte.search!,
              title: "Find Product",
              onPressedSearch: () {
                controllerIte.onSearchItems();
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myfavorite);
              },
              onChanged: (val) {
                controllerIte.checkSearch(val);
              },
            ),
            const SizedBox(height: 20),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(builder: (controller) {
              return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          itemCount: controller.data.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            controllerFav.isFavorite[controller.data[index]
                                    ["items_id"]] =
                                controller.data[index]['favorite'];
                            return CustomGridView(
                              itemsModle:
                                  ItemsModle.fromJson(controller.data[index]),
                            );
                          })
                      : ListItemsSearch(listDataModle: controller.listData));
            }),
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<ItemsControllerImp> {
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
