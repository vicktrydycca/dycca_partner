import 'package:dycca_partner/custom_widget/textfield_widget.dart';
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
                          Tab(text: "All",),
                          Tab(text: "Events",),
                          Tab(text: "Store",),
                          Tab(text: "Studio",),
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height, //height of TabBarView
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey, width: 0.5))),
                        child:  const TabBarView(
                          children: <Widget>[
                            FeedEventsTabScreen(),
                            FeedEventsTabScreen(),
                            FeedEventsTabScreen(),
                            FeedEventsTabScreen(),
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
