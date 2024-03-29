import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class CreateEventSaveContinueScreen extends StatefulWidget {
  const CreateEventSaveContinueScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventSaveContinueScreen> createState() =>
      _CreateEventSaveContinueScreenState();
}

class _CreateEventSaveContinueScreenState
    extends State<CreateEventSaveContinueScreen> {
  List<String> items = ['Venue Partners', 'Judges', 'Sponsors'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/hostEventRoutes');
        },
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(1),
            borderRadius: BorderRadius.circular(3.0),
          ),
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Save & Continue",
                style: appFontStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
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
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/profile_details.png'),
                Positioned(
                  right: 8,
                  bottom: 8,
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
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Row(
                children: [
                  Text(
                    "Collaboraters",
                    style: appFontStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Event info",
                    style: appFontStyle(
                      color: neutral4Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.builder(
              itemCount: items.length,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              items[index],
                              style:
                                  fontStyle(neutral6Color, FontWeight.w400, 16),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/addJudgesRoutes');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(1),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                height: 30,
                                width: 70,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "ADD",
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
                          ),
                        ],
                      ),
                    ),
                    createEvent(),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget createEvent() {
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
                decoration: BoxDecoration(
                    border: Border.all(color: neutral4Color, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 120.0),
                        child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.cancel_rounded,
                              size: 13,
                            )),
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
                        padding: const EdgeInsets.only(
                            bottom: 5.0, left: 20, right: 20, top: 3),
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
                                  Icon(
                                    Icons.star,
                                    color: primaryColor,
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "4.5",
                                      style: fontStyle(
                                          primaryColor, FontWeight.w400, 8),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Rating",
                                style: fontStyle(
                                    neutral6Color, FontWeight.w400, 8),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: primaryColor,
                                      size: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "89",
                                        style: fontStyle(
                                            primaryColor, FontWeight.w400, 8),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Collaborated",
                                  style: fontStyle(
                                      neutral6Color, FontWeight.w400, 8),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: primaryColor,
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "23",
                                      style: fontStyle(
                                          primaryColor, FontWeight.w400, 8),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Created",
                                style: fontStyle(
                                    neutral6Color, FontWeight.w400, 8),
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
          },
        ),
      ),
    );
  }
}
