import 'package:dycca_partner/custom_widget/appbar_widget.dart';
import 'package:dycca_partner/custom_widget/drawer_widget.dart';

import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class CompleteProfileProgress extends StatefulWidget {
  const CompleteProfileProgress({Key? key}) : super(key: key);

  @override
  State<CompleteProfileProgress> createState() =>
      _CompleteProfileProgressState();
}

class _CompleteProfileProgressState extends State<CompleteProfileProgress> {
  double progressCompletion = 0.6;
  List<String> names = [
    'Performing Arts',
  ];
  bool visibleVerifyService = true;
  bool visibleCompleteProfile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      drawer: const DrawerWidget(),
      appBar: DashboardAppbarWidget.getAppBar(context),
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
                            style: fontStyle(whiteColour, FontWeight.w500, 16),
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
          completeYourProfile()
        ],
      ),
    );
  }

  Widget completeYourProfile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60.0, right: 50, top: 20),
            child: Text(
              "To Activate your listing Please complete following Process",
              style: fontStyle(neutral6Color, FontWeight.w500, 19),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: LinearProgressIndicator(
              backgroundColor: neutral2Color,
              valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
              value: progressCompletion,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const CircleAvatar(
              radius: 10,
              backgroundColor: primaryColor,
              child: Icon(
                Icons.check,
                color: whiteColour,
                size: 15,
              ),
            ),
            title: Text(
              "Complete Your Profile",
              style: fontStyle(neutral6Color, FontWeight.w500, 16),
            ),
            trailing: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/completeProfileRoute');
              },
              child: Text(
                "Go to my Profile",
                style: fontStyle(primaryColor, FontWeight.w400, 14),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 0, bottom: 10),
            child: Text(
              "|",
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 0, bottom: 10),
            child: Text("|",
                style: TextStyle(
                  color: primaryColor,
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 0, bottom: 10),
            child: Text("|",
                style: TextStyle(
                  color: primaryColor,
                )),
          ),
          ListTile(
            leading: const CircleAvatar(
              radius: 10,
              backgroundColor: primaryColor,
              child: Icon(
                Icons.check,
                color: whiteColour,
                size: 15,
              ),
            ),
            title: Text(
              "Document & Sign Agreement",
              style: fontStyle(neutral6Color, FontWeight.w500, 16),
            ),
            trailing: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/submitDocumentsRoutes');
              },
              child: Container(
                width: 100,
                child: Text(
                  "View Documents & Agreements",
                  style: fontStyle(primaryColor, FontWeight.w400, 14),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 0, bottom: 10),
            child: Text("|"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 0, bottom: 10),
            child: Text("|"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 0, bottom: 10),
            child: Text("|"),
          ),
          ListTile(
            leading: const CircleAvatar(
              radius: 10,
              backgroundColor: greyColour,
              child: Icon(
                Icons.lock,
                color: whiteColour,
                size: 15,
              ),
            ),
            title: Text(
              "Start a free trial",
              style: fontStyle(neutral6Color, FontWeight.w500, 16),
            ),
            trailing: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profileDetailsRoutes');
              },
              child: Text(
                "Start Now",
                style: fontStyle(primaryColor, FontWeight.w400, 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
