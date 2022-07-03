import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
class LoginSuccessfulScreen extends StatefulWidget {
  const LoginSuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<LoginSuccessfulScreen> createState() => _LoginSuccessfulScreenState();
}

class _LoginSuccessfulScreenState extends State<LoginSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: ButtonWidget(placeholder: "CONTINUE", disabled: false, buttonClickCallback: (){
          Navigator.pushNamed(context, '/loginSuccessfulRoute');
        }),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            projectName,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/login_successful.png',
                height: 150,
              ),
            ),
            Text(
              "Your account has been verified successfully !",
              style: fontStyle(neutral6Color, FontWeight.w500, 19),
            ),
          ],
        ),
      ),
    );
  }
}
