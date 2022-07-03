import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              projectName,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: Text(
                      "Login",
                      style: fontStyle(neutral6Color, FontWeight.w500, 19),
                    ),
                  ),
                  Container()
                ],
              ),
              TextfieldWidget(
                controller: userName,
                placeholder: "User Name",
                fillColor: neutral2Color,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextfieldWidget(
                  controller: userName,
                  placeholder: "Password",
                  fillColor: neutral2Color,
                ),
              ),
              Row(
                children: [
                  Container(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Forgot Password ?",
                      style: fontStyle(primaryColor, FontWeight.w400, 16),
                    ),
                  ),
                ],
              ),
              ButtonWidget(
                placeholder: "LOG IN",
                disabled: false,
                buttonClickCallback: () {
                  Navigator.pushNamed(context, '/verifyMobileNoRoute');
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
                child: Text(
                  "Register",
                  style: fontStyle(primaryColor, FontWeight.w400, 19),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
