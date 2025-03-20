import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckOut extends StatelessWidget {
  final String imageName;
  final String title;
  final bool active;

  const CardDeliveryTypeCheckOut(
      {super.key,
      required this.imageName,
      required this.title,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: active ? AppColor.secondColor : null,
          border: Border.all(color: AppColor.secondColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageName,
            width: 60,
            color: active ? Colors.white : null,
          ),
          Text(
            title,
            style: TextStyle(
                color: active ? Colors.white : AppColor.secondColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
