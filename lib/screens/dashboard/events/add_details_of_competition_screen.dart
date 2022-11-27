import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class AddDetailsOfCompetitionScreen extends StatefulWidget {
  final competitionType;
  final competitionSubType;
  final eventName;
  final eventDesc;
  final eventID;
  const AddDetailsOfCompetitionScreen({Key? key,this.eventID,this.competitionType,this.competitionSubType,this.eventName,this.eventDesc}) : super(key: key);

  @override
  State<AddDetailsOfCompetitionScreen> createState() => _AddDetailsOfCompetitionScreenState();
}

class _AddDetailsOfCompetitionScreenState extends State<AddDetailsOfCompetitionScreen> {
  List<String> items = ['Venue Partners','Judges','Sponsors'];
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
        title: const Text("Rap Battle", style: appbarConstFont),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
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
                      primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Event info",
                    style: appFontStyle(
                      color:
                      neutral4Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
              const SizedBox(height: 10,),
            ListView.builder(
              itemCount: items.length,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 10,bottom: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            items[index],
                            style: fontStyle(
                                neutral6Color, FontWeight.w400, 16),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/addJudgesRoutes',arguments: {"appbar":items[index],"categoryType":widget.competitionType,"categorySubType":widget.competitionSubType,"eventName":widget.eventName,"eventDesc":widget.eventDesc,"eventID":widget.eventID});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(1),
                                borderRadius:
                                BorderRadius.circular(3.0),
                              ),
                              height: 30,
                              width: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "ADD",
                                    style: appFontStyle(
                                      color:
                                      Colors.white.withOpacity(0.9),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1,),

                ],
              );
            },),

          ],
        ),
      ),
    );
  }
}
