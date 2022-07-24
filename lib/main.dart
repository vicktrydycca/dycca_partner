import 'package:dycca_partner/screens/auth/login_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_screen.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:dycca_partner/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
   final login =  prefs.getBool("login")??false;
  runApp(
  //     GetMaterialApp(
  // home:login?DashboardScreen():LoginScreen()
  // )
  // );
  MyApp(login));
}

class MyApp extends StatelessWidget {
  bool login;
  MyApp(this.login);
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      home:login?LoginScreen():DashboardScreen()
      // debugShowCheckedModeBanner: false,
      // routes: Routes().getRoutes(),
      // initialRoute:mainScreenRoute,
    );
  }
}


