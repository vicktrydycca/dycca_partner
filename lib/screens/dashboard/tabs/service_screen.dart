import 'package:dycca_partner/custom_widget/textfield_widget.dart';

import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColour,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
            length: 3, // length of tabs
            initialIndex: 0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: const TabBar(
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.black,
                      tabs:  [
                        Tab(text: 'Service'),
                        Tab(text: 'Shop'),
                        Tab(text: 'Professional'),
                      ],
                    ),
                  ),
                  Container(
                      height: 400, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: TabBarView(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Text('Display Tab 1',
                                  style: appFontStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text('Display Tab 2',
                                  style: appFontStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text('Display Tab 3',
                                  style: appFontStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ))
                ]),
          )
        ]));
  }
}
