import 'package:dycca_partner/custom_widget/appbar_widget.dart';
import 'package:dycca_partner/custom_widget/drawer_widget.dart';
import 'package:dycca_partner/screens/dashboard/tabs/upper_tabs.dart';

import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController search = TextEditingController();

  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
         drawer: const DrawerWidget(),
      backgroundColor: whiteColour,
       
        appBar: DashboardAppbarWidget.getAppBar(context),
         bottomNavigationBar: BottomNavigationBar(selectedLabelStyle: fontStyle(neutral6Color, FontWeight.w400, 14),
             unselectedLabelStyle: fontStyle(neutral6Color, FontWeight.w400, 12),
             items: const <BottomNavigationBarItem>[
               BottomNavigationBarItem(
                   icon: Icon(Icons.home),
                   label: 'Home',
                   backgroundColor: Colors.white,
               ),
               BottomNavigationBarItem(
                   icon: Icon(Icons.add_circle_outlined),
                   label: 'Create',
                   backgroundColor: Colors.white
               ),
               BottomNavigationBarItem(
                 icon: Icon(Icons.key),
                 label: 'Solutions',
                 backgroundColor: Colors.white,
               ),
             ],
             type: BottomNavigationBarType.shifting,
             currentIndex: _selectedIndex,
             selectedItemColor: primaryColor,
             showUnselectedLabels: true,
             unselectedItemColor: Colors.black45,
             iconSize: 40,
             onTap: _onItemTapped,
             elevation: 5
         ),

    body:const UpperTabsScreen()
    );
  }
}
