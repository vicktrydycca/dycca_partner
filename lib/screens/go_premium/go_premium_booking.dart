import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class GoPremiumBookingScreen extends StatefulWidget {
  const GoPremiumBookingScreen({Key? key}) : super(key: key);

  @override
  State<GoPremiumBookingScreen> createState() => _GoPremiumBookingScreenState();
}

class _GoPremiumBookingScreenState extends State<GoPremiumBookingScreen> {
  List<String> bookingName = ['Tracking','Visibility on search','Customer Service',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
         Navigator.pushNamed(context, '/selectPlanRoute');
        },
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(1),

          ),
          height: 60,
          width: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Get Started",
                style: appFontStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: whiteColour,
      appBar:
      AppbarBackButton().AppbarBack(context, "Go Premium"),


      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    "For One Studio",
                    style: fontStyle(neutral6Color, FontWeight.w500, 19),
                  ),
                  const Spacer(),
                  Text(
                    "For Multi Studio",
                    style: fontStyle(neutral6Color, FontWeight.w500, 19),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 150,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "For Free",
                            style: fontStyle(neutral5Color, FontWeight.w100, 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              "INR 0",
                              style: fontStyle(neutral6Color, FontWeight.w500, 19),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 80,
                    width: 150,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Premium",
                            style: fontStyle(primaryColor, FontWeight.w100, 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              "INR 3999",
                              style: fontStyle(primaryColor, FontWeight.w500, 19),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [

                Text(
                  "Bookings (INR 500/Month)",
                  style:
                  fontStyle(neutral6Color, FontWeight.w500, 19),
                ),
                const Spacer(),
                Container(
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
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: bookingName.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  bookingName[index],
                  style: fontStyle(neutral5Color, FontWeight.w400, 16),
                ),
              );
            },)
          ],
        ),
      ),
    );
  }
}
