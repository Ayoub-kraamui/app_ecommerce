import 'package:app_ecommerce/controller/favorite_controller.dart';
import 'package:app_ecommerce/controller/offers_controller.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/constant/imageassets.dart';
import 'package:app_ecommerce/core/function/translatedatabase.dart';
import 'package:app_ecommerce/data/model/ItemsModle.dart';
import 'package:app_ecommerce/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridViewOffers extends GetView<OffersController> {
  final ItemsModle itemsModle;
  const CustomGridViewOffers({super.key, required this.itemsModle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.gotToProductDetails(itemsModle);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModle.itemsId}",
                    child: CachedNetworkImage(
                        imageUrl:
                            AppLink.imageItem + "/" + itemsModle.itemsImage!,
                        height: 100,
                        fit: BoxFit.fill),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translateDatabase(
                        itemsModle.itemsNameAr, itemsModle.itemsName),
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${itemsModle.itemsPriceDiscount!} \$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      GetBuilder<FavoriteControllerImp>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModle.itemsId] ==
                                  1) {
                                controller.setFavorite(itemsModle.itemsId, 0);
                                controller.removeFavorite(itemsModle.itemsId!);
                              } else {
                                controller.setFavorite(itemsModle.itemsId, 1);
                                controller.addFavorite(itemsModle.itemsId!);
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModle.itemsId] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: AppColor.primaryColor,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
            if (itemsModle.itemsDiscount != 0)
              Positioned(
                  top: 40,
                  left: 4,
                  child: Image.asset(
                    AppImageAssets.saleOne,
                    width: 40,
                  ))
          ],
        ),
      ),
    );
  }
}
