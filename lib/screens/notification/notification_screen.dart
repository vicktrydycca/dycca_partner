import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColour,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: neutral6Color,
        ),
        title: const Text("Notification", style: appbarConstFont),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text(
                      "Saturday ,22 Feburary",
                      style: fontStyle(neutral6Color, FontWeight.w400, 16),
                    ),
                    const Spacer(),
                    Text(
                      " Clear All",
                      style: fontStyle(primaryColor, FontWeight.w400, 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    color: neutral2Color,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: Image.asset(
                                  'assets/images/notification_image.png',
                                  height: 70,
                                ),
                              )),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Jackman wants to collaborate with you on music video",
                                    style: fontStyle(neutral6Color, FontWeight.w400, 16),
                                  ),
                                  const SizedBox(height: 20,),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(color: primaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7.0, horizontal: 30),
                                      child: Text(
                                        "View profile",
                                        style:
                                        fontStyle(primaryColor, FontWeight.w400, 13),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Text(
                          "7:15 PM",
                          style:
                          fontStyle(neutral6Color, FontWeight.w500, 13),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },)
            ],
          ),
        ),
      ),
    );
  }
}
