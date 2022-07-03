import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: ButtonWidget(placeholder: "VERIFY NOW", disabled: false, buttonClickCallback: (){
          Navigator.pushNamed(context, '/loginSuccessfulRoute');
        }),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           // Text(
              projectName,
          //    style: fontStyle(primaryColor, FontWeight.w600, 33),
         //   ),
            Image.asset(
              'assets/images/verify_mobile.png',
              height: 100,
            ),
            Text(
              "Enter OTP",
              style: fontStyle(neutral6Color, FontWeight.w600, 16),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Please type the OTP sent to +91 8346785774",
                style: fontStyle(neutral5Color, FontWeight.w400, 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width - 40,
                fieldWidth:
                ((MediaQuery.of(context).size.width - 30) / 5) - 20,
                style: const TextStyle(fontSize: 14),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: primaryColor,
                ),
                onChanged: (pin) {},
                onCompleted: (pin) {
                  setState(() {

                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text("00:00",style: fontStyle(neutral4Color, FontWeight.w500, 19),),
                  const Spacer(),
                  Text("Resend OTP",style: fontStyle(primaryColor, FontWeight.w500, 19),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
