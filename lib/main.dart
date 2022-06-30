import 'package:dycca_partner/utils/constants.dart';
import 'package:dycca_partner/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes().getRoutes(),
      initialRoute: splashRoute,
    );
  }
}
