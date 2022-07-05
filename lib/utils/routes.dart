

import 'package:dycca_partner/custom_widget/bottom_navigation_widget.dart';
import 'package:dycca_partner/screens/auth/login_screen.dart';
import 'package:dycca_partner/screens/auth/login_succesful_screen.dart';
import 'package:dycca_partner/screens/auth/otp_screen.dart';
import 'package:dycca_partner/screens/auth/sign_up_screen.dart';
import 'package:dycca_partner/screens/auth/splash_screen.dart';
import 'package:dycca_partner/screens/auth/verify_mobile_number_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_screen.dart';


class Routes{
  getRoutes(){
    return {
      '/splashRoute': (context) => const SplashScreen(),
      '/loginRoute': (context) =>  LoginScreen(),
      '/verifyMobileNoRoute': (context) => const VerifyMobileNumberScreen(),
      '/otpRoute': (context) => const OtpScreen(),
      '/loginSuccessfulRoute': (context) => const LoginSuccessfulScreen(),
      '/signUpRoute': (context) => const SignUpScreen(),
      '/dashboardRoute': (context) => const DashboardScreen(),
      '/bottomNaviagtionRoute': (context) => const BottomNavigationWidget(),
    };
  }
}