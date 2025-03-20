import 'package:flutter/material.dart';

class CustomTitleTextAuth extends StatelessWidget {
  final String text;
  const CustomTitleTextAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2);
  }
}
