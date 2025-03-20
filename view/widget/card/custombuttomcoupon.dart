import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  final void Function()? onPerssed;
  final String title;

  const CustomButtonCoupon({super.key, this.onPerssed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
          color: AppColor.primaryColor,
          onPressed: onPerssed,
          textColor: Colors.white,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}
