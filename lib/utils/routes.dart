

import 'package:dycca_partner/screens/auth/login_screen.dart';
import 'package:dycca_partner/screens/auth/login_succesful_screen.dart';
import 'package:dycca_partner/screens/auth/otp_screen.dart';
import 'package:dycca_partner/screens/auth/splash_screen.dart';
import 'package:dycca_partner/screens/auth/verify_mobile_number_screen.dart';


class Routes{
  getRoutes(){
    return {
      '/splashRoute': (context) => const SplashScreen(),
      '/loginRoute': (context) => const LoginScreen(),
      '/verifyMobileNoRoute': (context) => const VerifyMobileNumberScreen(),
      '/otpRoute': (context) => const OtpScreen(),
      '/loginSuccessfulRoute': (context) => const LoginSuccessfulScreen(),
    };
  }
}