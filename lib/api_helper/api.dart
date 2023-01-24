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
  static const String get_eventTypeListApi = baseUrl+"event/type";
  static const String getWorkFlow = baseUrl+"event/audition/workflow";
  static const String get_eventSubTypeListApi = baseUrl+"event/subtype";
  static const String getSaveStudioApi = baseUrl+"studio/save";
  static const String manageAuditionRoundDetails = baseUrl+"event/round/audition";

  static const String manageAuditionRoundSave = baseUrl+"event/audition/workflow/assign";
  static const String manageAuditionRoundAddJudgesApi = baseUrl+"round/assign/judge";
  static const String manageAuditionRoundAddVenusApi = baseUrl+"round/assign/venue";
  static const String manageAuditionRoundGet = baseUrl+"event/audition/workflow/assignlist";
  static const String saveStudioAmentiesApi = baseUrl+"studio/amenty/add";
  static const String saveStudioEquipementApi = baseUrl+"studio/equipment/add";
  static const String studioImageUploadApi = baseUrl+"studio/profile/documents/upload";
  static const String createEventApi = baseUrl+"partner/event/create";
  static const String eventDetails = baseUrl+"eventdetails";
  static const String eventListRoundWise = baseUrl+"event/round/audition";
   static const String auditionRating = baseUrl+'round/audition/rating';
   static const String sendToNextRound = baseUrl+'round/audition/next';

}