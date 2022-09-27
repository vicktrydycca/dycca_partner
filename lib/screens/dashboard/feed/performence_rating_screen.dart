import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class PerformanceRatingScreen extends StatefulWidget {
  const PerformanceRatingScreen({Key? key}) : super(key: key);

  @override
  State<PerformanceRatingScreen> createState() =>
      _PerformanceRatingScreenState();
}

class _PerformanceRatingScreenState extends State<PerformanceRatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/selectionScreenRoutes');
        },
        child: Container(
          height: 50,
          color: primaryColor,
          child: Center(
            child: Text(
              "Submit",
              style: appFontStyle(
                color: whiteColour,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: whiteColour,
      appBar: AppbarBackButton().AppbarBack(context, "List of participants"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  border: Border.all(
                      width: 0.7, color: neutral4Color.withOpacity(0.5))),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/performanceRatingRoutes');
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/profile_details.png'),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 17,
                        child: Image.asset("assets/images/profile.jpg"),
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nee Kavithaigala song",
                            style: appFontStyle(
                              color: neutral6Color,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "Selva Lakshmi",
                              style: appFontStyle(
                                color: primaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: Text(
              "Rate the Performence",
              style: appFontStyle(
                color: neutral6Color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: Text(
              "Team",
              style: appFontStyle(
                color: neutral6Color,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

          ),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  child: Image.asset("assets/images/profile.jpg"),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nee Kavithaigala song",
                      style: appFontStyle(
                        color: neutral6Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Selva Lakshmi",
                        style: appFontStyle(
                          color: primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
