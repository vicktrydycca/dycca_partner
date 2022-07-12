import 'package:dycca_partner/custom_widget/appbar_widget.dart';
import 'package:dycca_partner/custom_widget/drawer_widget.dart';

import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class DashboardSelectScreen extends StatefulWidget {
  const DashboardSelectScreen({Key? key}) : super(key: key);

  @override
  State<DashboardSelectScreen> createState() => _DashboardSelectScreenState();
}

class _DashboardSelectScreenState extends State<DashboardSelectScreen> {
  double progressCompletion = 0.6;
  List<String> names = [
    'Performing Arts',
  ];
  bool visibleVerifyService = true;
  bool visibleCompleteProfile = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColour,
        drawer: const DrawerWidget(),
        appBar: DashboardAppbarWidget.getAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: whiteColour,
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search Booking',
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: whiteColour),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              color: whiteColour,
                              size: 20,
                            ),
                            Text(
                              " Add",
                              style:
                                  fontStyle(whiteColour, FontWeight.w500, 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            verifyYourService(),
            completeYourProfile()
          ],
        ),
      ),
    );
  }

  Widget verifyYourService() {
    return Visibility(
      visible: visibleVerifyService,
      child: Column(
        children: [
          Container(
            height: names.length * 80,
            child: ListView.builder(
              itemCount: names.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    color: neutral2Color.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/dashboard_image.png',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              names[index],
                              style:
                                  fontStyle(neutral6Color, FontWeight.w600, 16),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/dashboardSelectRoute');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: neutral4Color,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              height: 30,
                              width: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Edit",
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
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80.0, right: 70, top: 60),
            child: Text(
              " To Activate your listing Please Verify Your Service",
              style: fontStyle(neutral6Color, FontWeight.w500, 19),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                visibleCompleteProfile = true;
                visibleVerifyService = false;
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 30),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Verify Your Service",
                      style: fontStyle(whiteColour, FontWeight.w500, 19),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget completeYourProfile() {
    return Visibility(
      visible: visibleCompleteProfile,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 50, top: 20),
              child: Text(
                "To Activate your listing Please complete following Process",
                style: fontStyle(neutral6Color, FontWeight.w500, 19),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: LinearProgressIndicator(
                backgroundColor: neutral2Color,
                valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
                value: progressCompletion,
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: primaryColor,
                    child: Icon(
                      Icons.check,
                      color: whiteColour,
                      size: 15,
                    ),
                  ),
                  Text(
                    "    Complete Your Profile",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/completeProfileRoute');
                    },
                    child: Text(
                      "Go to my Profile",
                      style: fontStyle(primaryColor, FontWeight.w400, 14),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 10,bottom: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: primaryColor,
                    child: Icon(
                      Icons.check,
                      color: whiteColour,
                      size: 15,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      "    Submit Documents & Sign Agreement",
                      style: fontStyle(neutral6Color, FontWeight.w500, 16),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "View Documents & Agreements",
                      style: fontStyle(primaryColor, FontWeight.w400, 14),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: primaryColor,
                    child: Icon(
                      Icons.check,
                      color: whiteColour,
                      size: 15,
                    ),
                  ),
                  Text(
                    "    Start a free trial",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                  const Spacer(),
                  Text(
                    "Start Now",
                    style: fontStyle(primaryColor, FontWeight.w400, 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
