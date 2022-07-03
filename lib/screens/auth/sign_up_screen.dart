

import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          projectName,
          Text(
            "Sign Up",
            style: fontStyle(neutral6Color, FontWeight.w500, 19),
          ),
        ],
      ),
    );
  }
}
