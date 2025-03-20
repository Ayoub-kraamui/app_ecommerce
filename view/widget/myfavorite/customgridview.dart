import 'package:app_ecommerce/controller/myfavorite_controller.dart';
import 'package:app_ecommerce/core/constant/color.dart';
import 'package:app_ecommerce/core/function/translatedatabase.dart';
import 'package:app_ecommerce/data/model/myfavoritemodle.dart';
import 'package:app_ecommerce/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridMyFavoriteView extends GetView<MyFavoriteControllerImp> {
  final MyfavoriteModle myfavoriteModle;
  const CustomGridMyFavoriteView({super.key, required this.myfavoriteModle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.gotToProductDetails(myfavoriteModle!);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${myfavoriteModle.itemsId}",
                child: CachedNetworkImage(
                    imageUrl:
                        AppLink.imageItem + "/" + myfavoriteModle.itemsImage!,
                    height: 100,
                    fit: BoxFit.fill),
              ),
              const SizedBox(height: 10),
              Text(
                translateDatabase(
                    myfavoriteModle.itemsNameAr, myfavoriteModle.itemsName),
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rating 3.5",
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${myfavoriteModle.itemsPrice!} \$",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans")),
                  IconButton(
                      onPressed: () {
                        controller.deleteMyFavorite(
                            myfavoriteModle.favoriteId!.toString());
                      },
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: AppColor.primaryColor,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
