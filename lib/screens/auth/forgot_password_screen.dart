import 'dart:convert';

import 'package:dycca_partner/api_helper/api.dart';
import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmnNewPassword = TextEditingController();
  String userToken = "";
  bool visibleEnterOTP = false;
  bool visibleEnterPassword = false;
  var sendData = SendData();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Forgot Password ?",
                    style: fontStyle(neutral6Color, FontWeight.w500, 19),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(
                          // controller: mobileNumber,
                          decoration: InputDecoration(
                              hintText: '(+91)',
                              hintStyle:
                                  fontStyle(neutral6Color, FontWeight.w400, 14)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: mobileNumber,
                          decoration: InputDecoration(
                              hintText: 'enter your registered mobile number',
                              hintStyle:
                                  fontStyle(neutral4Color, FontWeight.w400, 13)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: (){
                            if(mobileNumber.text.length != 10){
                              DialogHelper.showErroDialog(description:"Invalid Number");

                            }
                            else{
                              print('aaa');
                              setState(() {
                                visibleEnterOTP = true;
                              });
                              sendData.getForgetPasswordOTP(mobileNumber.text);
                              

                            }
                          },
                          child: Text(
                            "Send OTP",
                            style: fontStyle(primaryColor, FontWeight.w400, 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: visibleEnterOTP,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Enter OTP",
                          style: fontStyle(neutral6Color, FontWeight.w400, 15),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 40, bottom: 30),
                          child: OTPTextField(
                            onCompleted: (val){
                              verifyForgetPasswordOTP(mobileNumber.text,val,newPassword.text);
                            },
                            length: 4,
                            width: MediaQuery.of(context).size.width - 40,
                            fieldWidth:
                                ((MediaQuery.of(context).size.width - 60) / 5) - 20,
                            style:  appFontStyle(fontSize: 14),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            otpFieldStyle: OtpFieldStyle(
                                focusBorderColor: primaryColor,
                                enabledBorderColor: primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: visibleEnterOTP,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Row(
                      children: [
                        Text(
                          "00:00",
                          style: fontStyle(neutral4Color, FontWeight.w400, 15),
                        ),
                        const Spacer(),
                        Text(
                          "Resend OTP",
                          style: fontStyle(primaryColor, FontWeight.w400, 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Visibility(
                  visible: visibleEnterPassword,
                  child: TextfieldWidget(
                    controller: newPassword,
                    placeholder: "New Password",
                    fillColor: neutral2Color,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: visibleEnterPassword,
                  child: TextfieldWidget(
                    controller: confirmnNewPassword,
                    placeholder: "Confirm New Password",
                    fillColor: neutral2Color,
                  ),
                ),

                Visibility(
                  visible: visibleEnterPassword,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 50),
                    child: ButtonWidget(
                      placeholder: "Save",
                      disabled: false,
                      buttonClickCallback: () {
                        sendData.changeForgetPasswordOTP(userToken, newPassword.text, context);

                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  verifyForgetPasswordOTP(phoneNumber,otp,newpassword) async {

    final response = await http.post(
        Uri.parse(AppApi.verifyForgetPasswordOTPApi),
        body: {
          "mobile":phoneNumber,
          "otp":otp,
        });

    if (response.statusCode == 200) {
        var jsonbody = jsonDecode(response.body);
          print("verfied $jsonbody");
          setState(() {
            visibleEnterPassword = true;
            userToken = jsonbody["token"];
          });
    } else {

      var jsonbody = jsonDecode(response.body);
      var msg = jsonbody["message"]??jsonbody["error"];
      debugPrint(response.body);
      DialogHelper.showErroDialog(description:msg);
    }
  }
}
