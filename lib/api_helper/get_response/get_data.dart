import 'dart:convert';

import 'package:dycca_partner/api_helper/api.dart';
import 'package:dycca_partner/api_helper/api_widgets/api_loader.dart';
import 'package:dycca_partner/modal_class/amenity_,modalclass.dart';
import 'package:dycca_partner/modal_class/equipment_modalclass.dart';
import 'package:dycca_partner/modal_class/event_category_modalclass.dart';
import 'package:dycca_partner/modal_class/event_subcategory_type_modalclass.dart';
import 'package:dycca_partner/modal_class/event_subtype_modalclass.dart';
import 'package:dycca_partner/modal_class/notification_modalclass.dart';
import 'package:dycca_partner/modal_class/partner_sponser_judges.dart';
import 'package:dycca_partner/modal_class/services_list_modalclass.dart';
import 'package:dycca_partner/modal_class/workflow_modelclass.dart';
import 'package:flutter/cupertino.dart';
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
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2NjQyNTcxNTAsImV4cCI6MTY5NTc5MzE1MCwibmJmIjoxNjY0MjU3MTUwLCJqdGkiOiJBWUJZc0VGSnB6ejY2MzB0In0.VsnkPqSFDjtfYjhiUPbrPZmdVsS-IrDNSAYbmf0TxnQ',
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
    var response = await http.get(
      Uri.parse(AppApi.getAmenityListApi),
    );

    var jsonbody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      final AmenityListModalClass = amenityModalClassFromJson(response.body);
      return onSuccess(AmenityListModalClass.amenity);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }

  getEquipmentApi({required onSuccess, required onError}) async {
    var response = await http.get(
      Uri.parse(AppApi.getEquipmentListApi),
    );

    var jsonbody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      final EquipmentModalClass = equipmentsModalClassFromJson(response.body);
      return onSuccess(EquipmentModalClass.equipments);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }

  get_Judges_Api({required onSuccess, required onError}) async {
    var response = await http
        .post(Uri.parse(AppApi.get_Jugeds_Partners_SponsersListApi), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2NjQyNTcxNTAsImV4cCI6MTY5NTc5MzE1MCwibmJmIjoxNjY0MjU3MTUwLCJqdGkiOiJBWUJZc0VGSnB6ejY2MzB0In0.VsnkPqSFDjtfYjhiUPbrPZmdVsS-IrDNSAYbmf0TxnQ',
    });
    var jsonbody = jsonDecode(response.body);
    debugPrint("this is it" + response.body.toString());
    if (response.statusCode == 200) {
      print(response.body);
      final JudgesModalClass = partnerSponserJudgesFromJson(response.body);
      return onSuccess(JudgesModalClass.judges);
    } else {
      debugPrint(response.body.toString());
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }

  get_VenusPartner_Api({required onSuccess, required onError}) async {
    var response = await http
        .post(Uri.parse(AppApi.get_Jugeds_Partners_SponsersListApi), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2MzY1MjMwODIsImV4cCI6MTY2ODA1OTA4MiwibmJmIjoxNjM2NTIzMDgyLCJqdGkiOiJHT0VSTmdQcGxkY1k4MEdtIn0.hiv-3SJteGSXTJ1u3EFm_o1Z7RxB41GpdfCW90n63ko',
    });
    var jsonbody = jsonDecode(response.body);
    debugPrint("this is it" + response.body.toString());
    if (response.statusCode == 200) {
      print(response.body);
      final VenusModalClass = partnerSponserJudgesFromJson(response.body);
      return onSuccess(VenusModalClass.partners);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }

  get_Sponsers_Api({required onSuccess, required onError}) async {
    var response = await http
        .post(Uri.parse(AppApi.get_Jugeds_Partners_SponsersListApi), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2NjQyNTcxNTAsImV4cCI6MTY5NTc5MzE1MCwibmJmIjoxNjY0MjU3MTUwLCJqdGkiOiJBWUJZc0VGSnB6ejY2MzB0In0.VsnkPqSFDjtfYjhiUPbrPZmdVsS-IrDNSAYbmf0TxnQ',
    });
    var jsonbody = jsonDecode(response.body);
    debugPrint("this is it" + response.body.toString());
    if (response.statusCode == 200) {
      print(response.body);
      final SponsorsClass = partnerSponserJudgesFromJson(response.body);
      return onSuccess(SponsorsClass.sponsers);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }

  get_event_homepage_Api({required onSuccess, required onError}) async {
    var response = await http.get(Uri.parse(AppApi.get_eventCategoryListApi));
    var jsonbody = jsonDecode(response.body);
    debugPrint("this is it" + response.body.toString());
    if (response.statusCode == 200) {
      print(response.body);
      final eventCategory = eventCategoryFromJson(response.body);
      return onSuccess(eventCategory.category);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }

  get_event_type_Api({required onSuccess, required onError}) async {
    var response = await http.get(Uri.parse(AppApi.get_eventTypeListApi));
    var jsonbody = jsonDecode(response.body);
    debugPrint("this is it" + response.body.toString());
    if (response.statusCode == 200) {
      print(response.body);
      final eventCategory = eventSubCategoryFromJson(response.body);
      return onSuccess(eventCategory.category);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }

  getManageAuditionHomepage({required onSuccess, required onError}) async {
    var response = await http.get(
        Uri.parse(
          AppApi.getWorkFlow,
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjExMCwiaXNzIjoiaHR0cHM6Ly9keWNjYXBhcnRuZXIuY29tL3YxL3VzZXIvbG9naW4iLCJpYXQiOjE2NjQyNTcxNTAsImV4cCI6MTY5NTc5MzE1MCwibmJmIjoxNjY0MjU3MTUwLCJqdGkiOiJBWUJZc0VGSnB6ejY2MzB0In0.VsnkPqSFDjtfYjhiUPbrPZmdVsS-IrDNSAYbmf0TxnQ',
        });
    var jsonbody = jsonDecode(response.body);
    debugPrint("this is it" + response.body.toString());
    if (response.statusCode == 200) {
      print(response.body);
      final eventCategory = workflowModalClassFromJson(response.body);
      return onSuccess(eventCategory.workflow);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }

  get_event_Subtype_Api({required onSuccess, required onError}) async {
    var response = await http.post(
        Uri.parse(
          AppApi.get_eventSubTypeListApi,
        ),
        body: {"typeId": "1"});
    var jsonbody = jsonDecode(response.body);
    debugPrint("this is it" + response.body.toString());
    if (response.statusCode == 200) {
      print(response.body);
      final eventCategory = eventTypeModalClassFromJson(response.body);
      return onSuccess(eventCategory.category);
    } else {
      var msg = jsonbody["message"] ?? jsonbody["error"];

      // DialogHelper.showErroDialog(description:msg);
      return onError(msg);
    }
  }
}
