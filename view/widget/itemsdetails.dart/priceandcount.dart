import 'package:app_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onPressedAdd;
  final String count;
  final void Function()? onPressedRemove;
  final String price;
  const PriceAndCountItems(
      {super.key,
      required this.onPressedAdd,
      required this.count,
      required this.onPressedRemove,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(
        children: [
          IconButton(onPressed: onPressedAdd, icon: const Icon(Icons.add)),
          Container(
              alignment: Alignment.topCenter,
              width: 50,
              padding: const EdgeInsets.only(bottom: 2),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(count,
                  style: const TextStyle(fontSize: 20, height: 1.1))),
          IconButton(
              onPressed: onPressedRemove, icon: const Icon(Icons.remove)),
        ],
      ),
      const Spacer(),
      Text(
        "$price \$",
        style: const TextStyle(
            color: AppColor.primaryColor, fontSize: 30, height: 1.1),
      )
    ]);
  }
}
