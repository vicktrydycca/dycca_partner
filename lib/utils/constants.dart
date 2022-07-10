import 'package:dycca_partner/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//routes
const splashRoute = '/splashRoute';
const loginRoute = '/loginRoute';
const verifyMobileNoRoute = '/verifyMobileNoRoute';
const otpRoute = '/otpRoute';
const loginSuccessfulRoute = '/loginSuccessfulRoute';
const signUpRoute = '/signUpRoute';
const dashboardRoute = '/dashboardRoute';
const bottomNaviagtionRoute = '/bottomNaviagtionRoute';
const forgotPasswordRoute = '/forgotPasswordRoute';
const dashboardSelectRoute = '/dashboardSelectRoute';

// styles
fontStyle(Color color, FontWeight fontWeight, double fontSize,
    {double height = 1.2}) {
  return TextStyle(
      fontSize: fontSize, fontWeight: fontWeight, color: color, height: height);
}

const inputHintStyle = TextStyle(
    fontSize: 16.0, fontWeight: FontWeight.w400, color: neutral4Color);

//Text
const projectName = Text(
  "Dycca Partner",
  style:
      TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: primaryColor),
);
var headline = Text("DYCCA",
    style: GoogleFonts.acme(
        fontSize: 25, fontWeight: FontWeight.w600, color: primaryColor));

const verifyCheck = CircleAvatar(
  radius: 10,
  backgroundColor: primaryColor,
  child: Icon(Icons.check),
);
