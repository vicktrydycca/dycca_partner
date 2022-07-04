import 'package:dycca_partner/custom_widget/appbar_widget.dart';
import 'package:dycca_partner/custom_widget/tabbar_widget.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/screens/dashboard/tabs/professionals_screen.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController search = TextEditingController();
  String activeTab = "SERVICE";
  setActiveTab(value) {
    setState(() {
      activeTab = value;
    });
  }
  Widget getActiveTab() {
    Widget response = const ProfessionalScreen();

    if (activeTab == "SERVICE") {
      response = const ProfessionalScreen();
    } else if (activeTab == "SHOP") {
      response = const ProfessionalScreen();
    } else if (activeTab == "PROFESSIONALS") {
      response = const ProfessionalScreen();
    }

    return response;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      drawer: const Drawer(),
      appBar: DashboardAppbarWidget.getAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20,bottom: 10),
            child: Text(
              "Select Your Service",
              style: fontStyle(neutral6Color, FontWeight.w500, 19),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextSearchWidget(
              controller: search,
              placeholder: "Search",
              prefixSvgImage: const Icon(Icons.search),
              fillColor: whiteColour,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TabbarWidget(
            tabs: const [
              "SERVICE",
              "SHOP",
              "PROFESSIONALS",
            ],
            activeTab: activeTab,
            setActiveTab: setActiveTab,
          ),
          getActiveTab()
        ],
      ),
    );
  }
}
