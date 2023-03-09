import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/screens/dashboard/events/live_event.dart';
import 'package:dycca_partner/screens/dashboard/feed/event_history_screen.dart';
import 'package:dycca_partner/screens/dashboard/feed/event_request_screen.dart';
import 'package:dycca_partner/screens/dashboard/feed/feed_events_tab_screen.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class FeedOptionsScreen extends StatefulWidget {
  const FeedOptionsScreen({Key? key}) : super(key: key);

  @override
  State<FeedOptionsScreen> createState() => _FeedOptionsScreenState();
}

class _FeedOptionsScreenState extends State<FeedOptionsScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
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
                  children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: primaryColor,
                        unselectedLabelColor: Colors.black,
                        labelStyle: appFontStyle(fontSize: 15),
                        tabs: const [
                          // Tab(text: "All",),
                          Tab(text: "My Events",),
                          Tab(text: "Event Requested",),
                          Tab(text: "History",),
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height, //height of TabBarView
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey, width: 0.5))),
                        child:   TabBarView(
                          children: <Widget> [
                         //   FeedEventsTabScreen(),
                            LiveEventTabScreen(),
                            EventRequestScreen(),
                            EventHistoryScreen(),

                          ],
                        ))
                  ]),
            )

          ],
        ),
      ),
    );
  }
}
