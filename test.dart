import 'package:app_ecommerce/core/function/check_enternet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;
  intialdata() async {
    res = await checkInternet();
  }

  @override
  void initState() async {
    checkInternet();
    print(res);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            OtpTextField(
              fieldWidth: 50,
              borderRadius: BorderRadius.circular(15),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {}, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
