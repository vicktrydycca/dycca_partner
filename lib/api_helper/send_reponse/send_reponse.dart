import 'dart:convert';

import 'package:dycca_partner/api_helper/api.dart';
import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/api_helper/service/app_exceptions.dart';
import 'package:dycca_partner/api_helper/service/base_client.dart';
import 'package:dycca_partner/api_helper/api_widgets/base_controller.dart';
import 'package:dycca_partner/modal_class/login_modalclass.dart';
import 'package:dycca_partner/screens/auth/otp_screen.dart';
import 'package:dycca_partner/screens/auth/sign_up_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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


    final prefs = await SharedPreferences.getInstance();
    print(phoneNumber);
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
      await prefs.setBool('login', true);

      debugPrint(loginData.token.toString());
      hideLoading();
      return Navigator.pushNamed(context, '/dashboardRoute');
    } else {
      prefs.setBool("login", false);

      // If the server did not return a 200 OK response,
      // then throw an exception.
      hideLoading();
      var jsonbody = jsonDecode(response.body);
      var msg = jsonbody["message"]??jsonbody["error"];
      debugPrint(response.body);
      DialogHelper.showErroDialog(description:msg);    }
  }

  getOTP(phoneNumber,context) async {
    showLoading('Please Wait..');

    final response = await http.post(
        Uri.parse(AppApi.getOTPApi),
        body: {
          "phone":phoneNumber,
        });

    if (response.statusCode == 200) {
      hideLoading();

      return  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(userNumber: phoneNumber,)));


    } else {
      hideLoading();

      // If the server did not return a 200 OK response,
      // then throw an exception.
      var jsonbody = jsonDecode(response.body);
      var msg = jsonbody["message"]??jsonbody["error"];
      debugPrint(response.body);
      DialogHelper.showErroDialog(description:msg);    }
  }
  verifyOTP(phoneNumber,otp,context) async {
    showLoading('Please Wait..');

    final response = await http.post(
        Uri.parse(AppApi.verifyOTPApi),
        body: {
          "phone":phoneNumber,
          "otp":otp,
        });

    if (response.statusCode == 200) {
      hideLoading();


 return  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen(mobileNumber: phoneNumber,)));


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      hideLoading();

      var jsonbody = jsonDecode(response.body);
      var msg = jsonbody["message"]??jsonbody["error"];
      debugPrint(response.body);
      DialogHelper.showErroDialog(description:msg);    }
  }
  registerUser(name,userName,email,password,mobileNo,context) async {
    showLoading('Please Wait..');

    final response = await http.post(
        Uri.parse(AppApi.registerUSerApi),
        body: {
          "name":name,
          "username":userName,//todo:remove username
          "email":email,
          "password":password,
          "mobile":mobileNo,
          "usertype":"partner"
        }

        );

    if (response.statusCode == 200) {
      hideLoading();

      


      return Navigator.pushNamed(context, '/dashboardRoute');


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      hideLoading();
      var jsonbody = jsonDecode(response.body);
      var msg = jsonbody["message"]??jsonbody["error"];
debugPrint(response.body);
       DialogHelper.showErroDialog(description:msg);
    }
  }

  getForgetPasswordOTP(phoneNumber) async {
    showLoading('Please Wait..');

    final response = await http.post(
        Uri.parse(AppApi.getForgetPasswordOTPApi),
        body: {
          "mobile":phoneNumber,
        });

    if (response.statusCode == 200) {
      hideLoading();

      // return  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(userNumber: phoneNumber,)));


    } else {
      hideLoading();

      // If the server did not return a 200 OK response,
      // then throw an exception.
      var jsonbody = jsonDecode(response.body);
      var msg = jsonbody["message"]??jsonbody["error"];
      debugPrint(response.body);
      DialogHelper.showErroDialog(description:msg);    }
  }
  changeForgetPasswordOTP(token,password,context) async {
    showLoading('Please Wait..');
    final response = await http.post(
        Uri.parse(AppApi.changeForgetPasswordApi),
        body: {
          "token":token,
          "npass":password,
        });
    if (response.statusCode == 200) {
      hideLoading();
      return  Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      hideLoading();

      var jsonbody = jsonDecode(response.body);
      var msg = jsonbody["message"]??jsonbody["error"];
      debugPrint(response.body);
      DialogHelper.showErroDialog(description:msg);    }
  }


  saveStudioProfile(studioType,studioTypeDescription,actType,context) async {
    showLoading('Please Wait..');
    final response = await http.post(
        Uri.parse(AppApi.getSaveStudioApi),
        headers: {
          'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2MzY1MjMwODIsImV4cCI6MTY2ODA1OTA4MiwibmJmIjoxNjM2NTIzMDgyLCJqdGkiOiJHT0VSTmdQcGxkY1k4MEdtIn0.hiv-3SJteGSXTJ1u3EFm_o1Z7RxB41GpdfCW90n63ko',
        },
        body: {
            "studioId":"16",
            "$studioType":studioTypeDescription.toString(),
            "completionRatio":"12",
            "act":actType
        });
    var jsonbody = jsonDecode(response.body);
    var msg = jsonbody["message"]??jsonbody["error"];
    if (response.statusCode == 200) {
      hideLoading();
      Navigator.pop(context);
      return   DialogHelper.showErroDialog(description:"Your Data is Updated Successfully",title: "Success");

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      hideLoading();
      debugPrint(response.body);
      DialogHelper.showErroDialog(description:msg);    }
  }
  saveStudioAmenties(studioType,studioTypeDescription,actType,context) async {
    showLoading('Please Wait..');
    final response = await http.post(
        Uri.parse(AppApi.saveStudioAmentiesApi),
        headers: {
          'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2MzY1MjMwODIsImV4cCI6MTY2ODA1OTA4MiwibmJmIjoxNjM2NTIzMDgyLCJqdGkiOiJHT0VSTmdQcGxkY1k4MEdtIn0.hiv-3SJteGSXTJ1u3EFm_o1Z7RxB41GpdfCW90n63ko',
        },
        body: {
            "studioId":"16",
            "$studioType":studioTypeDescription.toString(),
            "completionRatio":"12",
            "act":actType
        });
    var jsonbody = jsonDecode(response.body);
    var msg = jsonbody["message"]??jsonbody["error"];
    if (response.statusCode == 200) {
      hideLoading();
      Navigator.pop(context);
      Navigator.pop(context);
      return   DialogHelper.showErroDialog(description:"Your Data is Updated Successfully",title: "Success");

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      hideLoading();
      debugPrint(response.body);
      DialogHelper.showErroDialog(description:msg);    }
  }
  saveStudioEquipement(studioType,studioTypeDescription,actType,context) async {
    showLoading('Please Wait..');
    final response = await http.post(
        Uri.parse(AppApi.saveStudioEquipementApi),
        headers: {
          'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2MzY1MjMwODIsImV4cCI6MTY2ODA1OTA4MiwibmJmIjoxNjM2NTIzMDgyLCJqdGkiOiJHT0VSTmdQcGxkY1k4MEdtIn0.hiv-3SJteGSXTJ1u3EFm_o1Z7RxB41GpdfCW90n63ko',
        },
        body: {
            "studioId":"16",
            "$studioType":studioTypeDescription.toString(),
            "completionRatio":"12",
            "act":actType
        });
    var jsonbody = jsonDecode(response.body);
    var msg = jsonbody["message"]??jsonbody["error"];
    if (response.statusCode == 200) {
      hideLoading();
      Navigator.pop(context);
      Navigator.pop(context);
      return   DialogHelper.showErroDialog(description:"Your Data is Updated Successfully",title: "Success");

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      hideLoading();
      debugPrint(response.body);
      DialogHelper.showErroDialog(description:msg);    }
  }
  uploadStudioImage(studioType,studioTypeDescription,actType,context) async {
    showLoading('Please Wait..');
    final response = await http.post(
        Uri.parse(AppApi.getSaveStudioApi),
        headers: {
          'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2MzY1MjMwODIsImV4cCI6MTY2ODA1OTA4MiwibmJmIjoxNjM2NTIzMDgyLCJqdGkiOiJHT0VSTmdQcGxkY1k4MEdtIn0.hiv-3SJteGSXTJ1u3EFm_o1Z7RxB41GpdfCW90n63ko',
        },
        body: {
            "studioId":"16",
            "profileimg":"image"
        });
    var jsonbody = jsonDecode(response.body);
    var msg = jsonbody["message"]??jsonbody["error"];
    if (response.statusCode == 200) {
      hideLoading();
      Navigator.pop(context);
      return   DialogHelper.showErroDialog(description:"Your Data is Updated Successfully",title: "Success");

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      hideLoading();
      debugPrint(response.body);
      DialogHelper.showErroDialog(description:msg);    }
  }
}
