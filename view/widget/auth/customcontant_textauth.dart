import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomContantTextAuth extends StatelessWidget {
  final String text;
  const CustomContantTextAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: AppColor.grey),
      ),
    );
  }
}
