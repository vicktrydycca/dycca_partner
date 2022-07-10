import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';

import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final mobileNumber;
  const SignUpScreen({Key? key,this.mobileNumber}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullname = TextEditingController();
  TextEditingController UserName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();


  var sendData = SendData();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                projectName,
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 30),
                  child: Text(
                    "Sign Up",
                    style: fontStyle(neutral6Color, FontWeight.w500, 19),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextfieldWidget(
                    controller: fullname,
                    placeholder: "Full Name",
                    fillColor: neutral2Color,
                  ),
                ),
                TextfieldWidget(
                  controller: UserName,
                  placeholder: "UserName",
                  fillColor: neutral2Color,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextfieldWidget(
                    controller: email,
                    placeholder: "Email address",
                    fillColor: neutral2Color,
                  ),
                ),
                TextfieldWidget(
                  controller: password,
                  placeholder: "Password",
                  fillColor: neutral2Color,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextfieldWidget(
                    controller: confirmPassword,
                    placeholder: "Confirm Password",
                    fillColor: neutral2Color,
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                ButtonWidget(
                    placeholder: "COMPLETE REGISTRATION",
                    disabled: false,
                    buttonClickCallback: () {
                       sendData.registerUser(fullname.text, UserName.text, email.text, password.text, widget.mobileNumber, context);
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already has account? ",
                        style: fontStyle(neutral6Color, FontWeight.w400, 16),
                      ),
                      Text(
                        "Login",
                        style: fontStyle(primaryColor, FontWeight.w400, 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
