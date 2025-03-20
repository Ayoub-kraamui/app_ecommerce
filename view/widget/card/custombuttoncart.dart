import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  final void Function()? onPerssed;
  final String title;

  const CustomButtonCart({super.key, this.onPerssed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
