import 'dart:io';

import 'package:data_table_2/data_table_2.dart';
import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/custom_widget/dropdown_widget.dart';
import 'package:dycca_partner/custom_widget/select_time_dropdown.dart';
import 'package:dycca_partner/custom_widget/select_time_format_widget.dart';
import 'package:dycca_partner/screens/profile/add_profile_details.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  String? selectStartTime;
  String? selectEndTime;
  List<String> weekdaysList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

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


  List<bool> openCloseSwitch = [true, true, true, true, true, true, false];
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String? imageStatus;
  TimeOfDay startTime = TimeOfDay.now();
  List<String> selectedStartTimeValue = ["Select","Select","Select","Select","Select","Select","Select"];
  List<String> selectedEndTimeValue = ["Select","Select","Select","Select","Select","Select","Select"];

  @override
  void initState() {
    //    TODO: implement initState
    super.initState();
  }

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

            imageStatus == null
                ? InkWell(
                    onTap: () async {
                      image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      imageStatus = image.toString();
                      setState(() {});
                    },
                    child: const Center(
                        child: Icon(
                      Icons.camera_alt_sharp,
                      size: 100,
                      color: neutral4Color,
                    )),
                  )
                : InkWell(
                    onTap: () async {
                      image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        child: Image.file(File(image!.path)))),

            imageStatus == null
                ? Text(
                    "+ Add Image",
                    style: fontStyle(primaryColor, FontWeight.w400, 14),
                  )
                : InkWell(
                    onTap: () {
                      debugPrint("aa");
                      SendData().uploadImageHTTP("profileimg", image!);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Upload Image",
                        style: fontStyle(primaryColor, FontWeight.w900, 16),
                      ),
                    ),
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
                    "Studio Profile",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProfileDetails()));
                    },
                    child: Text(
                      "+ Add Profile",
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
            studioTimimg(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget(
                buttonClickCallback: () {
                   List<String> openCloseSwitchFlag = [];
                  for(int i =0; i< openCloseSwitch.length;i++){
                    if(openCloseSwitch[i]==true){
                      openCloseSwitchFlag.add("1");
                    }
                    else{
                      openCloseSwitchFlag.add("0");

                    }
                  }

                   SendData().saveStudioTiming(openCloseSwitchFlag,selectedStartTimeValue,selectedEndTimeValue,context);
                  debugPrint(openCloseSwitchFlag.toString());
                },
                placeholder: 'Submit',
                disabled: false,
              ),
            )
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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.date_range),
                  Text(
                    "  Date",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                ],
              ),
              Container(
                child: Text("From",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  child: Text("Till",
                      style: fontStyle(neutral6Color, FontWeight.w500, 16)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                  )
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      //                    <--- top side
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  )),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      //                    <--- top side
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  )),
                  child: Center(
                    child: Row(
                      children: [
                        Text("21/2/22",
                            style:
                                fontStyle(neutral8Color, FontWeight.w500, 12)),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )),
            ],
          ),
          studioTiming()
        ],
      ),
    );
  }

  Widget studioTiming() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: DataTable2(
          columnSpacing: 0,
          horizontalMargin: 0,
          minWidth: MediaQuery.of(context).size.width,
          columns: [
            DataColumn2(
              label: Row(
                children: const [
                  Icon(Icons.watch_later),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Time'),
                ],
              ),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('Open/Close'),
            ),
            DataColumn(
              label: Text('      From   '),
            ),
            DataColumn(
              label: Text(
                '      Till',
                style: fontStyle(neutral8Color, FontWeight.w500, 12),
              ),
            ),
          ],
          rows: List<DataRow>.generate(weekdaysList.length, (index) {

            return DataRow(cells: [
              DataCell(Text(weekdaysList[index])),
              DataCell(
                Switch(
                    onChanged: (value) {
                      setState(() {
                        openCloseSwitch[index] = value;
                        //todo: can show toast on open/close
                      });
                    },
                    value: openCloseSwitch[index]),
              ),
              DataCell(
                SizedBox(
                    height: 40,
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: DropdownButton(
                        onTap: () {
                          //   if(widget.value.toString().isEmpty){
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text('Enter Occassion'),
                          //     backgroundColor: Colors.red));
                          //   }
                        },
                        isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Text(
                            "Select",
                            style:
                            fontStyle(neutral4Color, FontWeight.w100, 12),
                          ),
                        ),
                        value: selectedStartTimeValue[index].toString(),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        onChanged: (value) {
                          setState(() {
                            selectedStartTimeValue[index] = value.toString();
                          });
                        },
                        items: timeList.map(
                              (valueItem) {
                            return DropdownMenuItem(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Text(
                                    valueItem,
                                    style: fontStyle(
                                        neutral8Color, FontWeight.w500, 12),
                                  ),
                                ));
                          },
                        ).toList(),
                      ),
                    )),
              ),

              DataCell(
                SizedBox(
                    height: 40,
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: DropdownButton(
                        onTap: () {
                          //   if(widget.value.toString().isEmpty){
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text('Enter Occassion'),
                          //     backgroundColor: Colors.red));
                          //   }
                        },
                        isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Text(
                            "Select",
                            style:
                                fontStyle(neutral4Color, FontWeight.w100, 12),
                          ),
                        ),
                        value: selectedEndTimeValue[index].toString(),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        onChanged: (value) {
                          setState(() {
                            selectedEndTimeValue[index] = value.toString();
                          });
                        },
                        items: timeList.map(
                          (valueItem) {
                            return DropdownMenuItem(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Text(
                                    valueItem,
                                    style: fontStyle(
                                        neutral8Color, FontWeight.w500, 12),
                                  ),
                                ));
                          },
                        ).toList(),
                      ),
                    )),
              ),
            ]);
          })),
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

  Widget showDialogBoxStudioRules() {
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
