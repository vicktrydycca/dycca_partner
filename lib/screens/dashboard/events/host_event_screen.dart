import 'package:dycca_partner/custom_widget/flutter_switch.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class HostEventScreen extends StatefulWidget {
  const HostEventScreen({Key? key}) : super(key: key);

  @override
  State<HostEventScreen> createState() => _HostEventScreenState();
}

class _HostEventScreenState extends State<HostEventScreen> {
  TextEditingController competitionName = TextEditingController();
  TextEditingController discription = TextEditingController();
  bool durationSwitch = true;
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
                      color:
                      primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
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
                      color:
                      Colors.white.withOpacity(0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
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
                      const Icon(Icons.camera_alt,color: whiteColour,size: 16,),
                      Text(
                        "   Add image",
                        style: appFontStyle(
                          color:
                          Colors.white.withOpacity(0.9),
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Collaboraters",
                    style: appFontStyle(
                      color:
                      neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Event info",
                    style: appFontStyle(
                      color:
                      primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Competition Name",
                    style: appFontStyle(
                      color:
                      neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
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
                  const SizedBox(height: 10,),
                  Text(
                    "Description",
                    style: appFontStyle(
                      color:
                      neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
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
                  const SizedBox(height: 10,),
                  Text(
                    "Duration",
                    style: appFontStyle(
                      color:
                      primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Ex:- Round 1',
                        
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FlutterSwitch(
                                height: 20,
                                width: 45,
                                value: durationSwitch, onToggle: (val) {
                                  durationSwitch = val;
                              },),
                              Text(
                                "  Online",
                                style: appFontStyle(
                                  color:
                                  neutral6Color,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                  Text(
                    "Judging criteria",
                    style: appFontStyle(
                      color:
                      neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
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
                          color:
                          primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "Rewards",
                    style: appFontStyle(
                      color:
                      neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
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
                          color:
                          primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "Participation fee",
                    style: appFontStyle(
                      color:
                      neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
