import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/screens/dashboard/tabs/professionals_screen.dart';

import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class UpperTabsScreen extends StatefulWidget {
  const UpperTabsScreen({Key? key}) : super(key: key);

  @override
  State<UpperTabsScreen> createState() => _UpperTabsScreenState();
}

class _UpperTabsScreenState extends State<UpperTabsScreen> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColour,

        body: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, right: 20, left: 20, bottom: 10),
                child: Text(
                  "Select Your Service",
                  style: fontStyle(neutral6Color, FontWeight.bold, 22),
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
              DefaultTabController(
                length: 4, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          labelColor: primaryColor,
                          unselectedLabelColor: Colors.black,
                          labelStyle: appFontStyle(fontSize: 17),
                          tabs: const [
                             Tab(text: 'All'),
                             Tab(text: 'Service'),
                             Tab(text: 'Shop'),
                             Tab(text: 'Professional'),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height, //height of TabBarView
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: Colors.grey, width: 0.5))),
                          child: const TabBarView(
                            children: <Widget>[
                             ProfessionalScreen(),
                             ProfessionalScreen(),
                             ProfessionalScreen(),
                             ProfessionalScreen(),
                            ],
                          ))
                    ]),
              )
            ]));
  }
}
