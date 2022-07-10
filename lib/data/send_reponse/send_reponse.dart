import 'dart:convert';

import 'package:dycca_partner/data/api.dart';
import 'package:dycca_partner/modal_class/login_modalclass.dart';
import 'package:dycca_partner/screens/auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendData {
  userLogin(phoneNumber,password,context) async {
    final response = await http.post(
        Uri.parse(AppApi.loginApi),
        body: {
          "phone":phoneNumber,
          "password":password
        });

    if (response.statusCode == 200) {
      final loginData = LoginModalClass.fromJson(jsonDecode(response.body));


      debugPrint(loginData.token.toString());
      return Navigator.pushNamed(context, '/verifyMobileNoRoute');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  getOTP(phoneNumber,context) async {
    final response = await http.post(
        Uri.parse(AppApi.getOTPApi),
        body: {
          "phone":"+91"+phoneNumber,
        });

    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(userNumber: phoneNumber,)));
      return null;

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  verifyOTP(phoneNumber,otp,context) async {
    final response = await http.post(
        Uri.parse(AppApi.verifyOTPApi),
        body: {
          "phone":"+91"+phoneNumber,
          "otp":otp,
        });

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/loginSuccessfulRoute');

      return null;

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
