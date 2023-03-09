import 'dart:io';

import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/custom_widget/dropdown_widget.dart';
import 'package:dycca_partner/custom_widget/flutter_switch.dart';
import 'package:dycca_partner/custom_widget/select_time_format_widget.dart';
import 'package:dycca_partner/custom_widget/show_dialouge_box.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class HostEventScreen extends StatefulWidget {
  var eventName;
  var eventDesc;
  var categoryTypeID;
  var subCategoryTypeID;

  var eventID;
   HostEventScreen({Key? key,this.eventName,this.eventDesc,this.eventID,this.subCategoryTypeID,this.categoryTypeID}) : super(key: key);

  @override
  State<HostEventScreen> createState() => _HostEventScreenState();
}

class _HostEventScreenState extends State<HostEventScreen> {
  List<String> timeList = [
    "Select",
    "1AM",
    "2AM",
    "3AM",
    "4AM",
    "5AM",
    "6AM",
    "7AM",
    "8AM",
    "9AM",
    "10AM",
    "11AM",
    "12AM",
    "1PM",
    "2PM",
    "3PM",
    "4PM",
    "5PM",
    "6PM",
    "7PM",
    "8PM",
    "9PM",
    "10PM",
    "11PM",
    "12PM"
  ];
  String? privateEvent;
  List<String> privateEv = ['Private Event', 'Public Event'];
  TextEditingController competitionName = TextEditingController();
  TextEditingController discription = TextEditingController();
  TextEditingController duration = TextEditingController();
  List<TextEditingController> judgeCriteriaList = [];
  List<TextEditingController> rewardsList = [];
  XFile? adharFrontImage;
  String? imageStatus;
  final ImagePicker _picker = ImagePicker();

  TextEditingController entryWithFriendCost =
      TextEditingController(text: "800");
  TextEditingController entrySingleCost = TextEditingController(text: "500");
  bool durationSwitch = true;
  DateTime startDate = DateTime.now().add(const Duration(days: 5));
  TimeOfDay startTime = TimeOfDay.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 10));
  TimeOfDay endTime = TimeOfDay.now();
  DateTime enrollmentEndDate = DateTime.now();
  TimeOfDay enrollmentEndTime = TimeOfDay.now();
  String singleEntry = "";
  String doubleEntry = "false";
  Future<void> _selectTime(BuildContext context, type) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: type == 'StartDate'
          ? startTime
          : type == 'EndDate'
              ? endTime
              : enrollmentEndTime,
    );
    if (pickedTime != null) {
      if (type == 'StartDate') {
        startTime = pickedTime;
      }
      setState(() {});
    }
  }

  getformattedTime(TimeOfDay time) {
    return '${time.hour}:${time.minute} ${time.period.toString().split('.')[1]}';
  }

  eventData() {
    setState(() {});
    // final arg = ModalRoute.of(context)!.settings.arguments as Map;

    // var categoryTypeID = arg["categoryType"];
    // var subCategoryTypeID = arg["categorySubType"];
    // var eventName = arg["eventName"];
    // var eventDesc = arg["eventDesc"];
    // var eventID = arg["eventID"];
    competitionName.text = widget.eventName;
    discription.text = widget.eventDesc;
  }

  @override
  void initState() {
    // TODO: implement initState
    judgeCriteriaList.add(TextEditingController());
    rewardsList.add(TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final arg = ModalRoute.of(context)!.settings.arguments as Map;
    //
    // var categoryTypeID = arg["typeID"];
    // var subCategoryTypeID = arg["subTypeID"];
    // var eventName = arg["competitionName"];
    // var eventDesc = arg["compDesc"];
    // var eventID = arg["eventID"];

    competitionName.text = widget.eventName;
    discription.text = widget.eventDesc;
    return Scaffold(
      // "competitionName":eventName,"compDesc":eventDesc,"typeID":categoryTypeID,"subTypeID":subCategoryTypeID,"eventID":eventID
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
              ),
              height: 55,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Publish For Partners",
                    style: appFontStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                SendData().hostEventAdd(

                    widget.eventName,
                    widget.eventDesc,
                    widget.eventID,
                    widget.categoryTypeID,
                    widget.subCategoryTypeID,
                    context);
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Host this event",
                      style: appFontStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: whiteColour,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: whiteColour,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: neutral6Color,
      //     ),
      //   ),
      //   title: const Text("Create Event", style: appbarConstFont),
      // ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                adharFrontImage == null
                    ? InkWell(
                        onTap: () async {
                          adharFrontImage = await _picker.pickImage(
                              source: ImageSource.gallery);
                          imageStatus = adharFrontImage.toString();
                          setState(() {});
                        },
                        child: Image.asset('assets/images/profile_details.png'))
                    : InkWell(
                        onTap: () async {
                          adharFrontImage = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: Container(
                            height: 200,
                            child: Image.file(File(adharFrontImage!.path))),
                      ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.camera_alt,
                        color: whiteColour,
                        size: 16,
                      ),
                      Text(
                        "   Add image",
                        style: appFontStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Competition Name",
                    style: appFontStyle(
                      color: neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextSearchWidget(
                      controller: competitionName,
                      placeholder: "Enter the name of competition",
                      fillColor: whiteColour,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Description",
                    style: appFontStyle(
                      color: neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextSearchWidget(
                      controller: discription,
                      placeholder: "Describe your competiiton",
                      maxLines: 5,
                      minLines: 5,
                      fillColor: whiteColour,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Duration",
                        style: appFontStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FlutterSwitch(
                              height: 20,
                              width: 45,
                              activeColor: primaryColor,
                              value: durationSwitch,
                              onToggle: (val) {
                                setState(() {});
                                durationSwitch = val;
                              },
                            ),
                            Text(
                              "  Online",
                              style: appFontStyle(
                                color: neutral6Color,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextField(
                      controller: duration,
                      decoration: InputDecoration(
                        hintText: 'Ex:- Round 1',
                        hintStyle:
                            fontStyle(Colors.black45, FontWeight.w500, 14),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Start Date",
                          style: fontStyle(neutral4Color, FontWeight.w400, 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Text(
                            "End Date",
                            style:
                                fontStyle(neutral4Color, FontWeight.w400, 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                              _selectDate(context, 'StartDate');
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      startDate
                                          .toString()
                                          .split(" ")
                                          .first
                                          .toString(),
                                      style: fontStyle(
                                          neutral4Color, FontWeight.w400, 14),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Icon(
                                      Icons.calendar_today_rounded,
                                      color: primaryColor,
                                      size: 15,
                                    )
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _selectTime(context, 'EndDate');
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      endDate
                                          .toString()
                                          .split(" ")
                                          .first
                                          .toString(),
                                      style: fontStyle(
                                          neutral4Color, FontWeight.w400, 14),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Icon(
                                      Icons.date_range,
                                      color: primaryColor,
                                      size: 15,
                                    )
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Start Time",
                          style: fontStyle(neutral4Color, FontWeight.w400, 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Text(
                            "End Time",
                            style:
                                fontStyle(neutral4Color, FontWeight.w400, 14),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _selectTime(context, 'StartDate');
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      startTime.hour.toString() +
                                          ":" +
                                          startTime.minute.toString(),
                                      style: fontStyle(
                                          neutral4Color, FontWeight.w400, 14),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(
                                      Icons.access_time,
                                      color: primaryColor,
                                      size: 15,
                                    )
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _selectTime(context, 'EndDate');
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      endTime.hour.toString() +
                                          ":" +
                                          endTime.minute.toString(),
                                      style: fontStyle(
                                          neutral4Color, FontWeight.w400, 14),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(
                                      Icons.access_time,
                                      color: primaryColor,
                                      size: 15,
                                    )
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: 'Select Venue Partner',
                          hintStyle:
                              fontStyle(neutral4Color, FontWeight.w500, 14),
                          prefixIcon: const Icon(
                            Icons.location_on_outlined,
                            color: primaryColor,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Judging criteria",
                    style: appFontStyle(
                      color: neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: judgeCriteriaList.isEmpty
                        ? 1
                        : (judgeCriteriaList.length),
                    itemBuilder: (context, index) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextSearchWidget(
                          controller: judgeCriteriaList[index],
                          placeholder: "Enter judging criteria",
                          fillColor: whiteColour,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {});
                          judgeCriteriaList.add(TextEditingController());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "+ Add More",
                              style: appFontStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {});
                          judgeCriteriaList.remove(judgeCriteriaList[judgeCriteriaList.length - 1]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "- Remove",
                              style: appFontStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rewards",
                    style: appFontStyle(
                      color: neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: rewardsList.isEmpty ? 1 : (rewardsList.length),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextSearchWidget(
                        controller: rewardsList[index],
                        placeholder: "Enter Rewards",
                        fillColor: whiteColour,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {});
                          rewardsList.add(TextEditingController());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "+ Add More",
                              style: appFontStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {});
                          judgeCriteriaList.remove(rewardsList[judgeCriteriaList.length - 1]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "- Remove",
                              style: appFontStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Participation fee",
                    style: appFontStyle(
                      color: neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ///todo:this dynamic is
                  InkWell(
                    onTap: () {
                      setState(() {});
                      doubleEntry = "false";
                      singleEntry = "";
                    },
                    child: Row(
                      children: [
                        Radio(
                            value: singleEntry,
                            groupValue: "",
                            activeColor: primaryColor,
                            onChanged: (val) {
                              setState(() {});
                              doubleEntry = "false";
                              singleEntry = "";
                            }),
                        Text(
                          "Single Entry",
                          style: appFontStyle(
                            color: neutral6Color,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextFormField(
                      enabled: false,
                      controller: entrySingleCost,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(
                            Icons.currency_rupee,
                            color: neutral6Color,
                            size: 15,
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        doubleEntry = "";
                        singleEntry = "false";
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                            value: doubleEntry,
                            groupValue: "",
                            activeColor: primaryColor,
                            onChanged: (val) {
                              setState(() {
                                doubleEntry = "";
                                singleEntry = "false";
                              });
                            }),
                        Text(
                          "Entry with friend",
                          style: appFontStyle(
                            color: neutral6Color,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextFormField(
                      enabled: false,
                      controller: entryWithFriendCost,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(
                            Icons.currency_rupee,
                            color: neutral6Color,
                            size: 15,
                          )),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 25.0),
                  //   child: TextFormField(
                  //     controller: duration,
                  //     decoration: const InputDecoration(
                  //         prefixIcon: Icon(
                  //       Icons.currency_rupee,
                  //       color: neutral6Color,
                  //       size: 15,
                  //     )),
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     Radio(
                  //         value: "",
                  //         groupValue: "",
                  //         activeColor: primaryColor,
                  //         onChanged: (val) {}),
                  //     Text(
                  //       "Entry With Sponsors",
                  //       style: appFontStyle(
                  //         color: neutral6Color,
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: neutral4Color.withOpacity(0.4)),
                  //     borderRadius: const BorderRadius.all(Radius.circular(5)),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 5.0, vertical: 5),
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           flex: 3,
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(5.0),
                  //             child: Container(
                  //
                  //               decoration: BoxDecoration(
                  //                   border: Border.all(
                  //                       color: neutral4Color, width: 1),
                  //                   borderRadius: const BorderRadius.all(
                  //                       Radius.circular(4))),
                  //               child: Padding(
                  //                 padding: const EdgeInsets.all(3.0),
                  //                 child: Column(
                  //                   children: [
                  //                     Row(
                  //                       children: [
                  //                         const Text(''),
                  //                         const Spacer(),
                  //                         GestureDetector(
                  //                             onTap: () {},
                  //                             child: const Icon(
                  //                               Icons.cancel_rounded,
                  //                               size: 10,
                  //                             )),
                  //                       ],
                  //                     ),
                  //
                  //                     const CircleAvatar(
                  //                       radius: 18,
                  //                       backgroundColor: Colors.blue,
                  //                     ),
                  //                     Padding(
                  //                       padding:
                  //                           const EdgeInsets.only(top: 5.0),
                  //                       child: Text(
                  //                         "Mithali Raj",
                  //                         style: fontStyle(neutral6Color,
                  //                             FontWeight.w400, 12),
                  //                       ),
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.only(
                  //                           bottom: 5.0,
                  //                           left: 20,
                  //                           right: 20,
                  //                           top: 3),
                  //                       child: Text(
                  //                         "Choreographer",
                  //                         style: fontStyle(
                  //                             primaryColor, FontWeight.w400, 8),
                  //                       ),
                  //                     ),
                  //                     Row(
                  //                       children: [
                  //                         Column(
                  //                           children: [
                  //                             Row(
                  //                               children: [
                  //                                 const Icon(
                  //                                   Icons.star,
                  //                                   color: primaryColor,
                  //                                   size: 15,
                  //                                 ),
                  //                                 Padding(
                  //                                   padding:
                  //                                       const EdgeInsets.only(
                  //                                           top: 5.0),
                  //                                   child: Text(
                  //                                     "4.5",
                  //                                     style: fontStyle(
                  //                                         primaryColor,
                  //                                         FontWeight.w400,
                  //                                         8),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             Text(
                  //                               "Rating",
                  //                               style: fontStyle(neutral6Color,
                  //                                   FontWeight.w400, 8),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         Padding(
                  //                           padding: const EdgeInsets.symmetric(
                  //                               horizontal: 10.0),
                  //                           child: Column(
                  //                             children: [
                  //                               Row(
                  //                                 children: [
                  //                                   const Icon(
                  //                                     Icons.person,
                  //                                     color: primaryColor,
                  //                                     size: 15,
                  //                                   ),
                  //                                   Padding(
                  //                                     padding:
                  //                                         const EdgeInsets.only(
                  //                                             top: 8.0),
                  //                                     child: Text(
                  //                                       "89",
                  //                                       style: fontStyle(
                  //                                           primaryColor,
                  //                                           FontWeight.w400,
                  //                                           8),
                  //                                     ),
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                               Text(
                  //                                 "Collaborated",
                  //                                 style: fontStyle(
                  //                                     neutral6Color,
                  //                                     FontWeight.w400,
                  //                                     8),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         Column(
                  //                           children: [
                  //                             Row(
                  //                               children: [
                  //                                 const Icon(
                  //                                   Icons.person,
                  //                                   color: primaryColor,
                  //                                   size: 15,
                  //                                 ),
                  //                                 Padding(
                  //                                   padding:
                  //                                       const EdgeInsets.only(
                  //                                           top: 8.0),
                  //                                   child: Text(
                  //                                     "23",
                  //                                     style: fontStyle(
                  //                                         primaryColor,
                  //                                         FontWeight.w400,
                  //                                         8),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             Text(
                  //                               "Created",
                  //                               style: fontStyle(neutral6Color,
                  //                                   FontWeight.w400, 8),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         Expanded(
                  //           flex: 2,
                  //           child: Text(
                  //             "Rachel Mcled",
                  //             style: appFontStyle(
                  //               color: neutral6Color,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w400,
                  //             ),
                  //           ),
                  //         ),
                  //         Expanded(
                  //           flex: 2,
                  //           child: GestureDetector(
                  //             onTap: () {
                  //               Navigator.pushNamed(
                  //                   context, '/viewProductsRoutes');
                  //             },
                  //             child: Container(
                  //               decoration: BoxDecoration(
                  //                 color: primaryColor.withOpacity(1),
                  //                 borderRadius: BorderRadius.circular(3.0),
                  //               ),
                  //               height: 30,
                  //
                  //               child: Center(
                  //                 child: Text(
                  //                   "View Products",
                  //                   style: appFontStyle(
                  //                     color: Colors.white.withOpacity(0.9),
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.w700,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Event Visibility",
                      style: appFontStyle(
                        color: neutral6Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_sharp),
                        hint: const Text(
                            'Private Event'), // Not necessary for Option 1
                        value: privateEvent,
                        onChanged: (newValue) {
                          setState(() {
                            newValue = privateEv;
                          });
                        },
                        items: privateEv.map((location) {
                          return DropdownMenuItem(
                            child: Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, type) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: type == 'StartDate'
          ? startDate
          : type == 'EndDate'
              ? endDate
              : enrollmentEndDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      if (type == 'StartDate') {
        startDate = picked;
      } else if (type == 'EndDate') {
        endDate = picked;
      }
    } else {
      enrollmentEndDate = picked!;
    }
    setState(() {});
  }
}
