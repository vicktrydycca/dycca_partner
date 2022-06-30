import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class VerifyMobileNumberScreen extends StatefulWidget {
  const VerifyMobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<VerifyMobileNumberScreen> createState() =>
      _VerifyMobileNumberScreenState();
}

class _VerifyMobileNumberScreenState extends State<VerifyMobileNumberScreen> {
  TextEditingController mobileNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: ButtonWidget(placeholder: "SEND", disabled: false, buttonClickCallback: (){
            Navigator.pushNamed(context, '/otpRoute');
          }),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                projectName,
                style: fontStyle(primaryColor, FontWeight.w600, 33),
              ),
              Image.asset(
                'assets/images/verify_mobile.png',
                height: 100,
              ),
              Text(
                "Enter your phone number",
                style: fontStyle(neutral6Color, FontWeight.w600, 16),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: mobileNumber,
                  decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(top: 13.0),
                        child: Text("India (+91)"),
                      ),
                      hintText: '  Your phone number',
                      hintStyle: fontStyle(neutral4Color, FontWeight.w400, 14)),
                ),
              ),
              Text(
                "We will send you one time password (OTP) to verify",
                style: fontStyle(neutral5Color, FontWeight.w400, 16),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
