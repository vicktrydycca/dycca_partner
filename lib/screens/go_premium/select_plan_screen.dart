import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({Key? key}) : super(key: key);

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar:  GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, '/selectPlanRoute');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 3,
               // changes position of shadow
              ),
            ]
          ),
          height: 70,

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "INR 3999 (Per year)",
                      style: appFontStyle(
                        color: neutral6Color,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "All Bookings Features",
                      style: appFontStyle(
                        color: neutral6Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Pay",
                  style: appFontStyle(
                    color: primaryColor,
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(Icons.arrow_forward_ios,size: 15,color: primaryColor,)
              ],
            ),
          ),
        ),
      ),
      backgroundColor: whiteColour,
      appBar:
      AppbarBackButton().AppbarBack(context, "Go Premium"),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    "For One Studio",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                  const Spacer(),
                  Text(
                    "For Multi Studio",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Select Your Plan",
              style: fontStyle(neutral6Color, FontWeight.w600, 21),
            ),
            const SizedBox(
              height: 20,
            ),
           ListView.builder(
             itemCount: 2,
             shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             itemBuilder: (context, index) {
             return  Container(
               height: 200,
               width: MediaQuery.of(context).size.width,
               child: Card(
                 elevation: 4,
                 shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10))
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text(
                       "INR 3999",
                       style: fontStyle(neutral6Color, FontWeight.w600, 26),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 6.0),
                       child: Text(
                         "Per Month",
                         style: fontStyle(neutral5Color, FontWeight.w100, 15),
                       ),

                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 30.0),
                       child: Text(
                         "All Booking Features",
                         style: fontStyle(neutral6Color, FontWeight.w400, 18),
                       ),

                     ),
                   ],
                 ),
               ),
             );
           },)
          ],
        ),
      ),
    );
  }
}
