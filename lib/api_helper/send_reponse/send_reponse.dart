import 'dart:convert';

import 'package:dycca_partner/api_helper/api.dart';
import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/service/app_exceptions.dart';
import 'package:dycca_partner/api_helper/service/base_client.dart';
import 'package:dycca_partner/api_helper/api_widgets/base_controller.dart';
import 'package:dycca_partner/modal_class/login_modalclass.dart';
import 'package:dycca_partner/screens/auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SendData extends GetxController with BaseController{



  // void postData(phoneNumber,password) async {
  //   var request = { "phone":phoneNumber,
  //     "password":password};
  //   showLoading('Posting data...');
  //   var response = await BaseClient().post('https://dyccapartner.com/v1/', 'user/login', request).catchError((error) {
  //
  //     if (error is BadRequestException) {
  //       var apiError = json.decode(error.message!);
  //       DialogHelper.showErroDialog(description: apiError["reason"]);
  //
  //     } else {
  //       handleError(error);
  //     }
  //   });
  //   if (response == null) return;
  //   hideLoading();
  //   print(response);
  // }
  userLogin(phoneNumber,password,context) async {
    showLoading('Please Wait..');

    var    body = {
    "phone":phoneNumber,
    "password":password
    };
    final response = await http.post(
        Uri.parse(AppApi.loginApi),
      body: body
     );

    if (response.statusCode == 200) {
      final loginData = LoginModalClass.fromJson(jsonDecode(response.body));


      debugPrint(loginData.token.toString());
      hideLoading();
      return Navigator.pushNamed(context, '/verifyMobileNoRoute');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      hideLoading();
      DialogHelper.showErroDialog(description:'Invalid USERNAME Or PASSWORD');
    }
  }

  getOTP(phoneNumber,context) async {
    showLoading('Please Wait..');

    final response = await http.post(
        Uri.parse(AppApi.getOTPApi),
        body: {
          "phone":"+91"+phoneNumber,
        });

    if (response.statusCode == 200) {
      hideLoading();

      Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(userNumber: phoneNumber,)));
      return null;

    } else {
      hideLoading();

      // If the server did not return a 200 OK response,
      // then throw an exception.
      DialogHelper.showErroDialog(description:'Invalid USERNAME Or PASSWORD');
    }
  }
  verifyOTP(phoneNumber,otp,context) async {
    showLoading('Please Wait..');

    final response = await http.post(
        Uri.parse(AppApi.verifyOTPApi),
        body: {
          "phone":"+91"+phoneNumber,
          "otp":otp,
        });

    if (response.statusCode == 200) {
      hideLoading();

      Navigator.pushNamed(context, '/loginSuccessfulRoute');

      return null;

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      hideLoading();

      DialogHelper.showErroDialog(description:'Invalid USERNAME Or PASSWORD');
    }
  }
}
