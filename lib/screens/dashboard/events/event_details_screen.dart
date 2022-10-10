import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
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
        title: const Text("Dance Battle", style: appbarConstFont),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Image.asset('assets/images/profile_details.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 20),
              child: ListTile(
                leading: Container(
                  height: 80,
                  width: 80,
                  color: Colors.red,
                ),
                title:  Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dance Dilse 2021",
                        style: appFontStyle(
                          color: neutral6Color,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Text(
                              "Competition Dance Battle   ",
                              style: appFontStyle(
                                color: primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Icon(Icons.star,color: primaryColor,size: 15,),
                            Text(
                              " 4.5",
                              style: appFontStyle(
                                color: neutral6Color,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Edit Event",
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
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
              child: Divider(thickness: 1,),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: appFontStyle(
                      color: neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,bottom: 15),
                    child: Text(
                      "We'll be hosting 10,000+ engineers, software architects, develop ecutives & professionals from 90+ countries for 3 days of technic essions from 150+ speakers, a 2-day Virtual Expo, spe…...More",
                      style: appFontStyle(
                        color: neutral4Color,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "Duration",
                    style: appFontStyle(
                      color: neutral6Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Audition",
                      style: appFontStyle(
                        color: neutral4Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/audition.png',height: 15,),
                      Text(
                        "    Online Event",
                        style: appFontStyle(
                          color: neutral4Color,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today,size: 18,color: primaryColor,),
                        Text(
                          "     Feb 17, 2021, 8:30 PM - Feb 20, 2021, 5:30 AM",
                          style: appFontStyle(
                            color: neutral4Color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Semifinal",
                      style: appFontStyle(
                        color: neutral4Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/audition.png',height: 15,),
                      Text(
                        "    Online Event",
                        style: appFontStyle(
                          color: neutral4Color,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined,size: 23,color: primaryColor,),
                        Text(
                          "   Dance Vickrock Studio, ECR, Chennai",
                          style: appFontStyle(
                            color: neutral4Color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today,size: 18,color: primaryColor,),
                        Text(
                          "     Feb 17, 2021, 8:30 PM - Feb 20, 2021, 5:30 AM",
                          style: appFontStyle(
                            color: neutral4Color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Final",
                      style: appFontStyle(
                        color: neutral4Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/audition.png',height: 15,),
                      Text(
                        "    Online Event",
                        style: appFontStyle(
                          color: neutral4Color,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined,size: 23,color: primaryColor,),
                        Text(
                          "   Dance Vickrock Studio, ECR, Chennai",
                          style: appFontStyle(
                            color: neutral4Color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today,size: 18,color: primaryColor,),
                        Text(
                          "     Feb 17, 2021, 8:30 PM - Feb 20, 2021, 5:30 AM",
                          style: appFontStyle(
                            color: neutral4Color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ListView.builder(
                    itemCount: items.length,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              items[index],
                              style: fontStyle(
                                  neutral6Color, FontWeight.w400, 16),
                            ),
                          ),

                          createEvent(),
                          const SizedBox(height: 20,),
                        ],
                      );
                    },),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Judging Criteria",
                      style: appFontStyle(
                        color: neutral6Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "1) No Smoking",
                    style: appFontStyle(
                      color: neutral4Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "2) No explosives allowed ",
                      style: appFontStyle(
                        color: neutral4Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "3) maintenance is must",
                    style: appFontStyle(
                      color: neutral4Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Rewards",
                      style: appFontStyle(
                        color: neutral6Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "1) No Smoking",
                    style: appFontStyle(
                      color: neutral4Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "2) No explosives allowed ",
                      style: appFontStyle(
                        color: neutral4Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "3) maintenance is must",
                    style: appFontStyle(
                      color: neutral4Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Participation fee",
                      style: appFontStyle(
                        color: neutral6Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Text(
                          "Book Alone",
                          style: appFontStyle(
                            color: neutral6Color,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "INR 500/each",
                          style: appFontStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      children: [
                        Text(
                          "Book With Friend",
                          style: appFontStyle(
                            color: neutral6Color,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "INR 500/each",
                          style: appFontStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
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
  Widget createEvent(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 150,
        child: ListView.builder(
          itemCount: 3,
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(

                width: 140,
                decoration: BoxDecoration(
                    border: Border.all(color: neutral4Color,width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 120.0),
                        child: GestureDetector(
                            onTap: (){},
                            child: const Icon(Icons.cancel_rounded,size: 13,)),
                      ),
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.blue,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Mithali Raj",
                          style: fontStyle(neutral6Color, FontWeight.w400, 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0,left: 20,right: 20,top: 3),
                        child: Text(
                          "Choreographer",
                          style: fontStyle(primaryColor, FontWeight.w400, 8),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star,color: primaryColor,size: 15,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "4.5",
                                      style: fontStyle(primaryColor, FontWeight.w400, 8),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Rating",
                                style: fontStyle(neutral6Color, FontWeight.w400, 10),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person,color: primaryColor,size: 15,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "89",
                                        style: fontStyle(primaryColor, FontWeight.w400, 8),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Collaborated",
                                  style: fontStyle(neutral6Color, FontWeight.w400, 10),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person,color: primaryColor,size: 15,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "23",
                                      style: fontStyle(primaryColor, FontWeight.w400, 8),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Created",
                                style: fontStyle(neutral6Color, FontWeight.w400, 10),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },),
      ),
    );
  }
}
