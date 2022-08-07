

import 'package:dycca_partner/custom_widget/bottom_navigation_widget.dart';
import 'package:dycca_partner/main.dart';
import 'package:dycca_partner/screens/auth/forgot_password_screen.dart';
import 'package:dycca_partner/screens/auth/login_screen.dart';
import 'package:dycca_partner/screens/auth/login_succesful_screen.dart';
import 'package:dycca_partner/screens/auth/otp_screen.dart';
import 'package:dycca_partner/screens/auth/sign_up_screen.dart';
import 'package:dycca_partner/screens/auth/splash_screen.dart';
import 'package:dycca_partner/screens/auth/verify_mobile_number_screen.dart';
import 'package:dycca_partner/screens/profile/profile_process.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_select/about_us_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_select/add_amenities_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_select/add_equipments_screen.dart';
import 'package:dycca_partner/screens/profile/complete_profile_screen.dart';
import 'package:dycca_partner/screens/profile/profile_details_screen.dart';
import 'package:dycca_partner/screens/dashboard/select_service_screen/dashboard_select_screen.dart';
import 'package:dycca_partner/screens/go_premium/go_premium_booking.dart';
import 'package:dycca_partner/screens/go_premium/select_plan_screen.dart';
import 'package:dycca_partner/screens/notification/notification_screen.dart';


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
      '/forgotPasswordRoute': (context) => const ForgotPasswordScreen(),
      '/dashboardSelectRoute': (context) => const SelectSerivceScreen(),
      '/completeProfileRoute': (context) => const CompleteProfileScreen(),
      '/addAmenitiesRoute': (context) => const AddAmenitiesScreen(),
      '/addEquipmentsRoute': (context) => const AddEquipmentsScreen(),
      '/aboutUsRoute': (context) => const AboutUsScreen(),
      '/notificationRoute': (context) => const NotificationScreen(),
      '/premiumBookingRoute': (context) => const GoPremiumBookingScreen(),
      '/selectPlanRoute': (context) => const SelectPlanScreen(),
      '/completeProfileProgress': (context) => const CompleteProfileProgress(),
      '/profileDetailsRoutes': (context) => const ProfileDetailsScreen(),
      '/mainScreen': (context) => const MainScreen(),
    };
  }
}