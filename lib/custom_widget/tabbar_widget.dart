// ignore_for_file: must_be_immutable


import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';


class TabbarWidget extends StatelessWidget {
  List<String> tabs;
  String activeTab;
  Function setActiveTab;
  TabbarWidget({Key? key,required this.activeTab,required this.setActiveTab,required this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getTabs() {
      List<Widget> response = [];

      for (var i = 0; i < tabs.length; i++) {
        response.add(GestureDetector(
          onTap: () {
            setActiveTab(tabs[i]);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color:
                    activeTab == tabs[i] ? primaryColor : Colors.white),
              ),
            ),
            width: tabs.length == 2
                ? MediaQuery.of(context).size.width / 2
                : MediaQuery.of(context).size.width / 3,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8.0),
                child: Text(
                  tabs[i],
                  style: fontStyle(
                    activeTab == tabs[i] ? primaryColor : neutral4Color,
                    FontWeight.w700,
                    14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ));
      }

      return response;
    }
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: getTabs(),
      ),
    );
  }
}
