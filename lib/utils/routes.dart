

import 'package:dycca_partner/custom_widget/bottom_navigation_widget.dart';
import 'package:dycca_partner/main.dart';
import 'package:dycca_partner/screens/auth/forgot_password_screen.dart';
import 'package:dycca_partner/screens/auth/login_screen.dart';
import 'package:dycca_partner/screens/auth/login_succesful_screen.dart';
import 'package:dycca_partner/screens/auth/otp_screen.dart';
import 'package:dycca_partner/screens/auth/sign_up_screen.dart';
import 'package:dycca_partner/screens/auth/splash_screen.dart';
import 'package:dycca_partner/screens/auth/verify_mobile_number_screen.dart';

import 'package:dycca_partner/screens/dashboard/complete_profile/verify_documents/pay_out_policy_screen.dart';
import 'package:dycca_partner/screens/dashboard/complete_profile/verify_documents/refund_policy_screen.dart';
import 'package:dycca_partner/screens/dashboard/complete_profile/verify_documents/submit_documents_screen.dart';
import 'package:dycca_partner/screens/dashboard/complete_profile/verify_documents/view_documents_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_select/about_us_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_select/add_amenities_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_select/add_equipments_screen.dart';

import 'package:dycca_partner/screens/dashboard/events/add_details_of_competition_screen.dart';
import 'package:dycca_partner/screens/dashboard/events/add_judges_screen.dart';
import 'package:dycca_partner/screens/dashboard/events/create_event_save_continue_screen.dart';
import 'package:dycca_partner/screens/dashboard/events/event_details_screen.dart';
import 'package:dycca_partner/screens/dashboard/events/host_event_screen.dart';
import 'package:dycca_partner/screens/dashboard/events/select_competition_screen.dart';
import 'package:dycca_partner/screens/dashboard/events/view_products_screen.dart';
import 'package:dycca_partner/screens/dashboard/feed/feed_detail_accept_entries_screen.dart';
import 'package:dycca_partner/screens/dashboard/feed/feed_detail_profile_screen.dart';
import 'package:dycca_partner/screens/dashboard/feed/list_of_participants_screen.dart';
import 'package:dycca_partner/screens/dashboard/feed/performence_rating_screen.dart';
import 'package:dycca_partner/screens/dashboard/feed/select_send_screen.dart';
import 'package:dycca_partner/screens/dashboard/feed/selection_screen.dart';

import 'package:dycca_partner/screens/dashboard/select_service_screen/dashboard_select_screen.dart';
import 'package:dycca_partner/screens/go_premium/go_premium_booking.dart';
import 'package:dycca_partner/screens/go_premium/select_plan_screen.dart';
import 'package:dycca_partner/screens/notification/notification_screen.dart';
import 'package:dycca_partner/screens/profile/complete_profile_screen.dart';
import 'package:dycca_partner/screens/profile/profile_details_screen.dart';
import 'package:dycca_partner/screens/profile/profile_process.dart';


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
      '/submitDocumentsRoutes': (context) => const SubmitDocumentsScreen(),
      '/viewDocumentsRoutes': (context) => const ViewDocumentsScreen(),
      '/refundPolicyRoutes': (context) => const RefundPolicyScreen(),
      '/payOutPolicyRoutes': (context) => const PayOutPolicyScreen(),
      '/selectCompetitionRoutes': (context) => const SelectCompetitionScreen(),
      '/addDetailsOfCompetitionRoutes': (context) => const AddDetailsOfCompetitionScreen(),
      '/addJudgesRoutes': (context) => const AddJudgesScreen(),
      '/hostEventRoutes': (context) => const HostEventScreen(),
      '/createEventSaveContinueRoutes': (context) => const CreateEventSaveContinueScreen(),
      '/viewProductsRoutes': (context) => const ViewProductsScreen(),
      '/eventDetailsRoutes': (context) => const EventDetailsScreen(),
      '/feedBookingDetailRoutes': (context) => const FeedDetailProfileScreen(),
      '/feedDetailAcceptEntriesRoutes': (context) => const FeedDetailAcceptEntriesScreen(),
      '/listOfParticipantsRoutes': (context) => const ListOfParticipantsScreen(),
      '/performanceRatingRoutes': (context) =>  PerformanceRatingScreen(),
      '/selectionScreenRoutes': (context) => const SelectionScreen(),
      '/selectSendRoutes': (context) => const SelectSendScreen(),
      '/eventDetailsRoutes': (context) => const EventDetailsScreen(),
      '/mainScreen': (context) => const MainScreen(),
    };
  }
}