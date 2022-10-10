import 'package:dycca_partner/custom_widget/dropdown_widget.dart';
import 'package:dycca_partner/custom_widget/flutter_switch.dart';
import 'package:dycca_partner/custom_widget/select_time_format_widget.dart';
import 'package:dycca_partner/custom_widget/show_dialouge_box.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HostEventScreen extends StatefulWidget {
  const HostEventScreen({Key? key}) : super(key: key);

  @override
  State<HostEventScreen> createState() => _HostEventScreenState();
}

class _HostEventScreenState extends State<HostEventScreen> {
  String? privateEvent;
  List<String> privateEv = ['INR','BTC'];
  TextEditingController competitionName = TextEditingController();
  TextEditingController discription = TextEditingController();
  TextEditingController duration = TextEditingController();
  bool durationSwitch = true;
  DateTime startDate = DateTime.now().add(const Duration(days: 5));
  TimeOfDay startTime = TimeOfDay.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 10));
  TimeOfDay endTime = TimeOfDay.now();
  DateTime enrollmentEndDate = DateTime.now();
  TimeOfDay enrollmentEndTime = TimeOfDay.now();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Singleton.showmsg(context,

                );

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColour,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: neutral6Color,
        ),
        title: const Text("Create Event", style: appbarConstFont),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/profile_details.png'),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Collaboraters",
                    style: appFontStyle(
                      color: neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Event info",
                    style: appFontStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
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
                      controller: competitionName,
                      placeholder: "Describe your competiiton",
                      maxLines: 5,
                      minLines: 5,
                      fillColor: whiteColour,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Duration",
                    style: appFontStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextFormField(
                      controller: duration,
                      decoration: InputDecoration(
                          hintText: 'Ex:- Round 1',
                          hintStyle:
                              fontStyle(neutral4Color, FontWeight.w500, 14),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
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
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextFormField(
                      controller: duration,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _selectDate(context, 'StartDate');
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      getformattedTime(startTime),
                                      style: fontStyle(
                                          neutral4Color, FontWeight.w400, 16),
                                    ),
                                    const SizedBox(
                                      width: 20,
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
                              _selectTime(context, 'startDate');
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      getformattedTime(startTime),
                                      style: fontStyle(
                                          neutral4Color, FontWeight.w400, 16),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _selectDate(context, 'StartDate');
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      getformattedTime(startTime),
                                      style: fontStyle(
                                          neutral4Color, FontWeight.w400, 16),
                                    ),
                                    const SizedBox(
                                      width: 20,
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
                              _selectTime(context, 'startDate');
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      getformattedTime(startTime),
                                      style: fontStyle(
                                          neutral4Color, FontWeight.w400, 16),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextSearchWidget(
                      controller: competitionName,
                      placeholder: "Enter judging criteria",
                      fillColor: whiteColour,
                    ),
                  ),
                  Padding(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextSearchWidget(
                      controller: competitionName,
                      placeholder: "Enter judging criteria",
                      fillColor: whiteColour,
                    ),
                  ),
                  Padding(
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
                  Row(
                    children: [
                      Radio(
                          value: "",
                          groupValue: "",
                          activeColor: primaryColor,
                          onChanged: (val) {}),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextFormField(
                      controller: duration,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(
                        Icons.currency_rupee,
                        color: neutral6Color,
                        size: 15,
                      )),
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "",
                          groupValue: "",
                          activeColor: primaryColor,
                          onChanged: (val) {}),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextFormField(
                      controller: duration,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                        Icons.currency_rupee,
                        color: neutral6Color,
                        size: 15,
                      )),
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "",
                          groupValue: "",
                          activeColor: primaryColor,
                          onChanged: (val) {}),
                      Text(
                        "Entry With Sponsors",
                        style: appFontStyle(
                          color: neutral6Color,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: neutral4Color.withOpacity(0.4)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(

                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: neutral4Color, width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4))),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text(''),
                                          const Spacer(),
                                          GestureDetector(
                                              onTap: () {},
                                              child: const Icon(
                                                Icons.cancel_rounded,
                                                size: 10,
                                              )),
                                        ],
                                      ),

                                      const CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.blue,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "Mithali Raj",
                                          style: fontStyle(neutral6Color,
                                              FontWeight.w400, 12),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5.0,
                                            left: 20,
                                            right: 20,
                                            top: 3),
                                        child: Text(
                                          "Choreographer",
                                          style: fontStyle(
                                              primaryColor, FontWeight.w400, 8),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: primaryColor,
                                                    size: 15,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0),
                                                    child: Text(
                                                      "4.5",
                                                      style: fontStyle(
                                                          primaryColor,
                                                          FontWeight.w400,
                                                          8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "Rating",
                                                style: fontStyle(neutral6Color,
                                                    FontWeight.w400, 8),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.person,
                                                      color: primaryColor,
                                                      size: 15,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: Text(
                                                        "89",
                                                        style: fontStyle(
                                                            primaryColor,
                                                            FontWeight.w400,
                                                            8),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "Collaborated",
                                                  style: fontStyle(
                                                      neutral6Color,
                                                      FontWeight.w400,
                                                      8),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.person,
                                                    color: primaryColor,
                                                    size: 15,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      "23",
                                                      style: fontStyle(
                                                          primaryColor,
                                                          FontWeight.w400,
                                                          8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "Created",
                                                style: fontStyle(neutral6Color,
                                                    FontWeight.w400, 8),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Rachel Mcled",
                              style: appFontStyle(
                                color: neutral6Color,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/viewProductsRoutes');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(1),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                height: 30,

                                child: Center(
                                  child: Text(
                                    "View Products",
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
                        hint: const Text('Private Event'), // Not necessary for Option 1
                        value: privateEvent,
                        onChanged: (newValue) {
                          setState(() {
                            newValue = privateEv;
                          });
                        },
                        items: privateEv.map((location) {
                          return DropdownMenuItem(
                            child:  Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20,)
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
