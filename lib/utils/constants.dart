import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// styles
fontStyle(Color color, FontWeight fontWeight, double fontSize,
    {double height = 1.2}) {
  return TextStyle(
      fontSize: fontSize, fontWeight: fontWeight, color: color, height: height);
}

const inputHintStyle = TextStyle(
    fontSize: 16.0, fontWeight: FontWeight.w400, color: neutral4Color);

//colour
const primaryColor = Color(0XFF0195AF);
const whiteColour = Color(0XFFFFFFFF);
const neutralColor = Color(0XFFAFAFAF);
const neutral1Color = Color(0XFF1C1C1C);
const neutral2Color = Color(0XFFF7F7F7);
const neutral3Color = Color(0XFFEBEBEB);
const neutral4Color = Color(0XFFAFAFAF);
const neutral5Color = Color(0XFF5A5A5A);
const neutral7Color = Color(0XFFE5E5E5);
const neutral6Color = Color(0XFF0E0E0E);
const semantic1Color = Color(0XFFEB5757);
const textfieldColour = Color(0XFFFBFAFF);

//routes
const splashRoute = '/splashRoute';
const loginRoute = '/loginRoute';
const verifyMobileNoRoute = '/verifyMobileNoRoute';
const otpRoute = '/otpRoute';
const loginSuccessfulRoute = '/loginSuccessfulRoute';
const signUpRoute = '/signUpRoute';
const dashboardRoute = '/dashboardRoute';
const bottomNaviagtionRoute = '/bottomNaviagtionRoute';

//Text
const projectName = Text(
  "Dycca Partner",
  style:
      TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: primaryColor),
);
var  headline = Text(
  "DYCCA",
  style:GoogleFonts.acme(fontSize: 25, fontWeight: FontWeight.w600, color: primaryColor)

);
const verifyCheck = CircleAvatar(
  radius: 10,
  backgroundColor: primaryColor,
  child: Icon(Icons.check),
);
