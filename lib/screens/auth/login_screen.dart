import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/data/send_reponse/send_reponse.dart';

import 'package:dycca_partner/utils/constants.dart';

import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final sendData = SendData();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                projectName,
                Row(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 40.0, bottom: 30, left: 10),
                      child: Text(
                        "Login",
                        style: appFontStyle(),
                      ),
                    ),
                    Container()
                  ],
                ),
                TextfieldWidget(
                  controller: userName,
                  placeholder: "User Name",
                  fillColor: neutral2Color,
                  prefixSvgImage: Icon(Icons.person),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextfieldWidget(
                    prefixSvgImage: Icon(Icons.lock),
                    isObscure: true,
                    controller: password,
                    placeholder: "Password",
                    fillColor: neutral2Color,
                  ),
                ),
                Row(
                  children: [
                    Container(),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgotPasswordRoute');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Forgot Password ?",
                          style: fontStyle(primaryColor, FontWeight.w400, 16),
                        ),
                      ),
                    ),
                  ],
                ),
                ButtonWidget(
                  placeholder: "LOG IN",
                  disabled: false,
                  buttonClickCallback: () {
                    sendData.userLogin(userName.text, password.text,context);
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Not a member yet?",
                    style: fontStyle(neutral4Color, FontWeight.w400, 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signUpRoute');
                    },
                    child: Text(
                      "Register",
                      style: fontStyle(primaryColor, FontWeight.w400, 19),
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
}
