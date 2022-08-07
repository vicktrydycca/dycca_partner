import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/custom_widget/select_time_format_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      appBar: AppbarBackButton().AppbarBack(context, "Profile Completion"),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
                child: Icon(
              Icons.camera_alt_sharp,
              size: 100,
              color: neutral4Color,
            )),
            Text(
              "+ Add Image",
              style: fontStyle(primaryColor, FontWeight.w400, 14),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: neutral3Color.withOpacity(1),
                borderRadius: BorderRadius.circular(3.0),
              ),
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Rockvick Studio",
                  style: fontStyle(neutral6Color, FontWeight.w600, 21),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Row(
                children: [
                  Text(
                    "Location",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                  const Spacer(),
                  Text(
                    "+ Add Location",
                    style: fontStyle(primaryColor, FontWeight.w400, 14),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Row(
                children: [
                  Text(
                    "About Us",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/aboutUsRoute');
                    },
                    child: Text(
                      "+ Add About us",
                      style: fontStyle(primaryColor, FontWeight.w400, 14),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Row(
                children: [
                  Text(
                    "Amenities",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return showDialougeBoxAmenities();
                        },
                      );
                    },
                    child: Text(
                      "+ Add Amenities",
                      style: fontStyle(primaryColor, FontWeight.w400, 14),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Row(
                children: [
                  Text(
                    "Equipments",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return showDialougeBoxEquipment();
                        },
                      );
                    },
                    child: Text(
                      "+ Add Equipments",
                      style: fontStyle(primaryColor, FontWeight.w400, 14),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Studio Rules",
            //         style: fontStyle(neutral6Color, FontWeight.w500, 16),
            //       ),
            //       const Spacer(),
            //       InkWell(
            //         onTap: () {
            //           showDialog(
            //             context: context,
            //             builder: (BuildContext context) {
            //               return showDialougeBoxEquipment();
            //             },
            //           );
            //         },
            //         child: Text(
            //           "+ Add Rules",
            //           style: fontStyle(primaryColor, FontWeight.w400, 14),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(
            //   thickness: 2,
            // ),
            studioTimimg()
          ],
        ),
      ),
    );
  }

  Widget studioTimimg() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Studio Timings",
                style: fontStyle(neutral6Color, FontWeight.w500, 16),
              ),
              const Spacer(),
              Text(
                "",
                style: fontStyle(neutral6Color, FontWeight.w500, 16),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Row(
                   children: [
                     Icon(
                      Icons.calendar_today_rounded,
                      color: primaryColor,
                ),
                     Text(
                       "   Date",
                       style: fontStyle(neutral6Color, FontWeight.w500, 16),
                     ),
                   ],
                 ),


                Text(
                  "From",
                  style: fontStyle(neutral6Color, FontWeight.w500, 16),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(
                    "Till",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const[


              SelectTimeFormatWidget(),
              SizedBox(width: 10,),
              SelectTimeFormatWidget(),
            ],
          ),
          Row(
            children: [

              Column(
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Sunday",
                          style: fontStyle(neutral6Color, FontWeight.w500, 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Monday",
                          style: fontStyle(neutral6Color, FontWeight.w500, 16),
                        ),
                      ),
                      Text(
                        "Tuesday",
                        style: fontStyle(neutral6Color, FontWeight.w500, 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Wednesday",
                          style: fontStyle(neutral6Color, FontWeight.w500, 16),
                        ),
                      ),
                      Text(
                        "Thrusday",
                        style: fontStyle(neutral6Color, FontWeight.w500, 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Friday",
                          style: fontStyle(neutral6Color, FontWeight.w500, 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          "Saturday",
                          style: fontStyle(neutral6Color, FontWeight.w500, 16),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget showDialougeBoxEquipment() {
    return AlertDialog(
      backgroundColor: neutral3Color,
      title: Row(
        children: [
          Text(
            "Add Equipments    ",
            style: fontStyle(neutral6Color, FontWeight.w600, 19),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
                radius: 12,
                backgroundColor: neutral5Color,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    'assets/images/close.png',
                    color: whiteColour,
                  ),
                )),
          )
        ],
      ),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 45,
                  width: 230,
                  decoration: BoxDecoration(
                      border: Border.all(color: neutral6Color),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                ),
                const Spacer(),
                Image.asset('assets/images/close.png')
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/addEquipmentsRoute');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "+ Add Equipments",
                  style: fontStyle(primaryColor, FontWeight.w400, 16),
                ),
              ),
            ),
            Container(
              height: 30,
              width: 100,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(
                  "Done",
                  style: fontStyle(whiteColour, FontWeight.w400, 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showDialougeBoxAmenities() {
    return AlertDialog(
      backgroundColor: neutral3Color,
      title: Row(
        children: [
          Text(
            "Add Amenities    ",
            style: fontStyle(neutral6Color, FontWeight.w600, 19),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
                radius: 12,
                backgroundColor: neutral5Color,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    'assets/images/close.png',
                    color: whiteColour,
                  ),
                )),
          )
        ],
      ),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 45,
                  width: 230,
                  decoration: BoxDecoration(
                      border: Border.all(color: neutral6Color),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                ),
                const Spacer(),
                Image.asset('assets/images/close.png')
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/addAmenitiesRoute');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "+ Add Amenities",
                  style: fontStyle(primaryColor, FontWeight.w400, 16),
                ),
              ),
            ),
            Container(
              height: 30,
              width: 100,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(
                  "Done",
                  style: fontStyle(whiteColour, FontWeight.w400, 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showDialougeBoxStudioRules() {
    return AlertDialog(
      backgroundColor: neutral3Color,
      title: Row(
        children: [
          Text(
            "Studio Rules    ",
            style: fontStyle(neutral6Color, FontWeight.w600, 19),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
                radius: 12,
                backgroundColor: neutral5Color,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    'assets/images/close.png',
                    color: whiteColour,
                  ),
                )),
          )
        ],
      ),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 45,
                  width: 230,
                  decoration: BoxDecoration(
                      border: Border.all(color: neutral6Color),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                ),
                const Spacer(),
                Image.asset('assets/images/close.png')
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/addAmenitiesRoute');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "+ Add Rules",
                  style: fontStyle(primaryColor, FontWeight.w400, 16),
                ),
              ),
            ),
            Container(
              height: 30,
              width: 100,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(
                  "Done",
                  style: fontStyle(whiteColour, FontWeight.w400, 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
