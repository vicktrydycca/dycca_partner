import 'package:dycca_partner/screens/dashboard/dashboard_screen.dart';
import 'package:dycca_partner/screens/dashboard/events/create_event_screen.dart';
import 'package:dycca_partner/utils/constants.dart';

import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.key),
            label: 'Solution',
          ),

        ],
        currentIndex: _selectedIndex,
        // elevation: 5,
        iconSize: 30,
        backgroundColor: whiteColour,
        selectedItemColor: primaryColor,
        unselectedItemColor: neutral5Color,
        onTap: _onItemTapped,

      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
  static final List<Widget> _widgetOptions = <Widget>[
    const DashboardScreen(),
    const CreateEventScreen(),
    const CreateEventScreen(),
  ];
}
