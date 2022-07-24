import 'package:dycca_partner/screens/auth/login_screen.dart';
import 'package:dycca_partner/screens/dashboard/dashboard_screen.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:dycca_partner/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(
      //     GetMaterialApp(
      // home:login?DashboardScreen():LoginScreen()
      // )
      // );
      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home:login?LoginScreen():DashboardScreen()
      debugShowCheckedModeBanner: false,
      routes: Routes().getRoutes(),
      initialRoute: mainScreenRoute,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool? login;
  loginState() async {
    final prefs = await SharedPreferences.getInstance();
    login = prefs.getBool("login") ?? false;

    if (login == true) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/dashboardRoute',
            (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/loginRoute',
            (route) => false,
      );
    }
  }

  @override
  void initState() {
    loginState();
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
