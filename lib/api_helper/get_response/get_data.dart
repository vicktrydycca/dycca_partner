import 'dart:convert';

import 'package:dycca_partner/api_helper/api.dart';
import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/modal_class/amenity_bloc.dart';
import 'package:dycca_partner/modal_class/notification_modalclass.dart';
import 'package:dycca_partner/modal_class/services_list_modalclass.dart';
import 'package:http/http.dart' as http;
import '';

class GetData {
  getHomeStudioApi({required onSuccess, required onError}) async {
    var response = await http.get(Uri.parse(AppApi.getServiceListApi));

    var jsonbody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      final serviceListModalClass =
          serviceListModalClassFromJson(response.body);
      return onSuccess(serviceListModalClass.services);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }

  getNotificationApi({required onSuccess, required onError}) async {
    var response =
        await http.get(Uri.parse(AppApi.getNotificationListApi), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2MzY1MjMwODIsImV4cCI6MTY2ODA1OTA4MiwibmJmIjoxNjM2NTIzMDgyLCJqdGkiOiJHT0VSTmdQcGxkY1k4MEdtIn0.hiv-3SJteGSXTJ1u3EFm_o1Z7RxB41GpdfCW90n63ko',
    });

    var jsonbody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      final NotificationListModalClass =
          notificationModalClassFromJson(response.body);
      return onSuccess(NotificationListModalClass.notification);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }
  getAmenityApi({required onSuccess, required onError}) async {
    var response =
        await http.get(Uri.parse(AppApi.getAmenityListApi),
    //         headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization':
    //       'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2MzY1MjMwODIsImV4cCI6MTY2ODA1OTA4MiwibmJmIjoxNjM2NTIzMDgyLCJqdGkiOiJHT0VSTmdQcGxkY1k4MEdtIn0.hiv-3SJteGSXTJ1u3EFm_o1Z7RxB41GpdfCW90n63ko',
    // }
    );

    var jsonbody = jsonDecode(response.body);


    if (response.statusCode == 200) {
      print(response.body);
      final AmenityListModalClass =
          amenityModalClassFromJson(response.body);
      return onSuccess(AmenityListModalClass.amenity);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }
}
