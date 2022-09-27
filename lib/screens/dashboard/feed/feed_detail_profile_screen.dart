import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class FeedDetailProfileScreen extends StatefulWidget {
  const FeedDetailProfileScreen({Key? key}) : super(key: key);

  @override
  State<FeedDetailProfileScreen> createState() =>
      _FeedDetailProfileScreenState();
}

class _FeedDetailProfileScreenState extends State<FeedDetailProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      appBar: AppbarBackButton().AppbarBack(context, "Booking Details"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset(
              "assets/images/profile.jpg",
              height: 70,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shubham Kumar",
                    style: appFontStyle(
                      color: neutral6Color,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "Dancer & choreographer",
                      style: appFontStyle(
                        color: neutral4Color,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: primaryColor,
                          size: 14,
                        ),
                        Text(
                          " 4.4",
                          style: appFontStyle(
                            color: neutral6Color,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.inventory_2,
                            size: 14,
                            color: primaryColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 2),
                          child: Text(
                            "Product",
                            style:
                                fontStyle(neutral6Color, FontWeight.w400, 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            trailing: Column(
              children: [
                const Icon(
                  Icons.facebook,
                  color: primaryColor,
                ),
                Text(
                  "listed",
                  style: fontStyle(neutral6Color, FontWeight.w300, 10),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Date",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "22 Feb 2021",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Time",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "09:00 Am",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Event Name",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Dance Cover",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Event Type",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Competition, Dance",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Category",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Solo",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              "Payment Details",
              style: fontStyle(neutral6Color, FontWeight.w600, 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Total",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "INR 700",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Payment Through",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Paytm",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Transaction Id",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "xxxxxxxxxxxx098",
                    style: fontStyle(neutral6Color, FontWeight.w400, 15),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 12),
                  child: Text(
                    "Reject",
                    style: appFontStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/feedDetailAcceptEntriesRoutes');
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 12),
                    child: Text(
                      "Accept",
                      style: appFontStyle(
                        color: whiteColour,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
