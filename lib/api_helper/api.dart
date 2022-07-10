class AppApi{

   static const String  baseUrl = "https://dyccapartner.com/v1/";

  static const String loginApi = baseUrl+"user/login";
  static const String getOTPApi = baseUrl+"user/otpsend";
  static const String verifyOTPApi = baseUrl+"user/otp/verify";
  static const String registerUSerApi = baseUrl+"user/register";
  static const String getForgetPasswordOTPApi = baseUrl+"user/forgotpassword";
  static const String verifyForgetPasswordOTPApi = baseUrl+"user/forgot/verify";
  static const String changeForgetPasswordApi = baseUrl+"user/changepassword";
}