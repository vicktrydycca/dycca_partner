class AppApi{

   static const String  baseUrl = "https://dyccapartner.com/v1/";

  static const String loginApi = baseUrl+"user/login";
  static const String getOTPApi = baseUrl+"user/otpsend";
  static const String verifyOTPApi = baseUrl+"user/otp/verify";
  static const String registerUSerApi = baseUrl+"user/register";
  static const String getForgetPasswordOTPApi = baseUrl+"user/forgotpassword";
  static const String verifyForgetPasswordOTPApi = baseUrl+"user/forgot/verify";
  static const String changeForgetPasswordApi = baseUrl+"user/changepassword";
  static const String getServiceListApi = baseUrl+"service/list";
  static const String getNotificationListApi = baseUrl+"user/notification";
  static const String getAmenityListApi = baseUrl+"amenity";
  static const String getEquipmentListApi = baseUrl+"equipment";
  static const String get_Jugeds_Partners_SponsersListApi = baseUrl+"partner/sponser";
  static const String get_eventCategoryListApi = baseUrl+"eventcategory";
  static const String getSaveStudioApi = baseUrl+"studio/save";
  static const String saveStudioAmentiesApi = baseUrl+"studio/amenty/add";
  static const String saveStudioEquipementApi = baseUrl+"studio/equipment/add";
}