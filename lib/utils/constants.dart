import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// styles
fontStyle(Color color, FontWeight fontWeight, double fontSize,
    {double height = 1.2}) {
  return appFontStyle(
      fontSize: fontSize, fontWeight: fontWeight, color: color, height: height);
}

var inputHintStyle = appFontStyle(
    fontSize: 16.0, fontWeight: FontWeight.w400, color: neutral4Color);

//colour
const primaryColor = Color(0XFF0195AF);
const whiteColour = Color(0XFFFFFFFF);
const greyColour = Color(0XFFb1b1b1);
const neutralColor = Color(0XFFAFAFAF);
const neutral1Color = Color(0XFF1C1C1C);
const neutral2Color = Color(0XFFF7F7F7);
const neutral3Color = Color(0XFFEBEBEB);
const neutral4Color = Color(0XFFAFAFAF);
const neutral5Color = Color(0XFF5A5A5A);
const neutral7Color = Color(0XFFE5E5E5);
const neutral6Color = Color(0XFF0E0E0E);
var neutral8Color = const Color(0XFF5A5A5A).withOpacity(0.7);
const semantic1Color = Color(0XFFEB5757);
const textfieldColour = Color(0XFFFBFAFF);

//routes
const splashRoute = '/splashRoute';
const loginRoute = '/loginRoute';
const mainScreenRoute = '/mainScreen';
const verifyMobileNoRoute = '/verifyMobileNoRoute';
const otpRoute = '/otpRoute';
const loginSuccessfulRoute = '/loginSuccessfulRoute';
const signUpRoute = '/signUpRoute';
const dashboardRoute = '/dashboardRoute';
const bottomNaviagtionRoute = '/bottomNaviagtionRoute';
const forgotPasswordRoute = '/forgotPasswordRoute';
const dashboardSelectRoute = '/dashboardSelectRoute';
const completeProfileRoute = '/completeProfileRoute';
const addAmenitiesRoute = '/addAmenitiesRoute';
const addEquipmentsRoute = '/addEquipmentsRoute';
const aboutUsRoute = '/aboutUsRoute';
const notificationRoute = '/notificationRoute';
const premiumBookingRoute = '/premiumBookingRoute';
const selectPlanRoute = '/selectPlanRoute';
const profileProgressRoutes = '/completeProfileProgress';
const profileDetailsRoutes = '/profileDetailsRoutes';
const submitDocumentsRoutes = '/submitDocumentsRoutes';
const viewDocumentsRoutes = '/viewDocumentsRoutes';
const refundPolicyRoutes = '/refundPolicyRoutes';
const payOutPolicyRoutes = '/payOutPolicyRoutes';
const selectCompetitionRoutes = '/selectCompetitionRoutes';
const addDetailsOfCompetitionRoutes = '/addDetailsOfCompetitionRoutes';
const addJudgesRoutes = '/addJudgesRoutes';
const hostEventRoutes = '/hostEventRoutes';
const createEventSaveContinueRoutes = '/createEventSaveContinueRoutes';
const viewProductsRoutes = '/viewProductsRoutes';
const eventDetailsRoutes = '/eventDetailsRoutes';
const feedBookingDetailRoutes = '/feedBookingDetailRoutes';
const feedDetailAcceptEntriesRoutes = '/feedDetailAcceptEntriesRoutes';
const listOfParticipantsRoutes = '/listOfParticipantsRoutes';
const performanceRatingRoutes = '/performanceRatingRoutes';
const selectionScreenRoutes = '/selectionScreenRoutes';
const selectSendRoutes = '/selectSendRoutes';
const litOfParticipantsRoutes = '/listOfParticipantsRoutes';


var appFontStyle = GoogleFonts.roboto;

//Text
var projectName = Text(
  "Dycca Partner",
  style:
      appFontStyle(fontSize: 40, fontWeight: FontWeight.w800, color: primaryColor),
);
var  headline = Text(
  "DYCCA",
  style:GoogleFonts.acme(fontSize: 25, fontWeight: FontWeight.w600, color: primaryColor)

);
const appbarConstFont = TextStyle(color: neutral6Color,fontSize: 16,fontWeight: FontWeight.w500);

const verifyCheck = CircleAvatar(
  radius: 10,
  backgroundColor: primaryColor,
  child: Icon(Icons.check),
);
