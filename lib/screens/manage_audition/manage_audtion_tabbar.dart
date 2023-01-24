import 'package:dycca_partner/bloc_controllers/eventtype_details_bloc.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/modal_class/event_type_details_modalclass.dart';
import 'package:dycca_partner/screens/dashboard/events/event_details_screen.dart';
import 'package:dycca_partner/screens/manage_audition/create_and_manageaudition.dart';
import 'package:dycca_partner/screens/manage_audition/customizeAudition.dart';
import 'package:dycca_partner/screens/manage_audition/manage_audition_homepage.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ManageAuditionTabbar extends StatefulWidget {
  const ManageAuditionTabbar({Key? key}) : super(key: key);

  @override
  State<ManageAuditionTabbar> createState() => _ManageAuditionTabbarState();
}

class _ManageAuditionTabbarState extends State<ManageAuditionTabbar> {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            "dance",
            style: appFontStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),

          ),
          bottom: TabBar(
            labelStyle: appFontStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            tabs: [Tab(text: "Event Info"), Tab(text: "Manage Audition",)],
          ),
        ),
        body: TabBarView(
          children: [EventDetailsScreen(), ManageAuditionHomePage()],
        ),
      ),
    );
  }

}
