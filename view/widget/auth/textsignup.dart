import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;

  const CustomTextSignUpOrSignIn(
      {super.key,
      required this.textone,
      required this.texttwo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
            onTap: onTap,
            child: Text(
              texttwo,
              style: TextStyle(
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
