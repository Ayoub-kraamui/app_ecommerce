import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShippingAddressCheckOut extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isactive;
  const CardShippingAddressCheckOut(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isactive ? AppColor.secondColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isactive ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subTitle,
            style: TextStyle(
                color: isactive ? Colors.white : null,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
