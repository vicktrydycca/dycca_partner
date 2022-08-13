import 'package:dycca_partner/custom_widget/appbar_widget.dart';
import 'package:dycca_partner/custom_widget/drawer_widget.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class SelectCompetitionScreen extends StatefulWidget {
  const SelectCompetitionScreen({Key? key}) : super(key: key);

  @override
  State<SelectCompetitionScreen> createState() =>
      _SelectCompetitionScreenState();
}

class _SelectCompetitionScreenState extends State<SelectCompetitionScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: whiteColour,
      appBar: DashboardAppbarWidget.getAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Select Competition",
                  style: fontStyle(neutral6Color, FontWeight.w500, 19),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: TextSearchWidget(
                  controller: search,
                  placeholder: "Search",
                  prefixSvgImage: const Icon(Icons.search),
                  fillColor: whiteColour,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: const TabBar(
                          labelColor: primaryColor,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'For u'),
                            Tab(text: 'Performing arts'),
                            Tab(text: 'Visual arts'),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context)
                              .size
                              .height, //height of TabBarView
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
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
                              performingArts(),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget performingArts() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/dashboard_image.png',
                              height: 70,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Competition",
                                style: fontStyle(
                                    neutral6Color, FontWeight.w600, 16),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(context, '/selectCompetitionRoutes');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(1),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                height: 30,
                                width: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Select",
                                      style: appFontStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "OTHERS",
                      style: fontStyle(neutral6Color, FontWeight.w600, 18),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/addDetailsOfCompetitionRoutes');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(1),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      height: 30,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Add",
                            style: appFontStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
