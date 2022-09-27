import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class FeedDetailAcceptEntriesScreen extends StatefulWidget {
  const FeedDetailAcceptEntriesScreen({Key? key}) : super(key: key);

  @override
  State<FeedDetailAcceptEntriesScreen> createState() =>
      _FeedDetailAcceptEntriesScreenState();
}

class _FeedDetailAcceptEntriesScreenState
    extends State<FeedDetailAcceptEntriesScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColour,
        appBar: AppbarBackButton().AppbarBack(context, "Dance Battle"),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/profile_details.png'),
                  Positioned(

                    bottom: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                              color: whiteColour
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                              child: Text(
                                "Event info",
                                style: appFontStyle(
                                  color: neutral6Color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30,),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                              color: whiteColour
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                            child: Text(
                              "Manage",
                              style: appFontStyle(
                                color: neutral6Color,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                                color: whiteColour
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                              child: Text(
                                "Show case",
                                style: appFontStyle(
                                  color: neutral6Color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              audition()
            ],
          ),
        ),
      ),
    );
  }

  Widget audition() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Participants",
                  style: appFontStyle(
                    color: neutral6Color,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Judges",
                  style: appFontStyle(
                    color: neutral6Color,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Venue Partners",
                  style: appFontStyle(
                    color: neutral6Color,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/listOfParticipantsRoutes');
                      },
                      child: CircleAvatar(
                        radius: 20,
                        child: Image.asset("assets/images/profile.jpg"),
                      ),
                    ),

                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Auditions",
                  style: appFontStyle(
                    color: neutral6Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Semi Final",
                  style: appFontStyle(
                    color: neutral6Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Finals",
                  style: appFontStyle(
                    color: neutral6Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextSearchWidget(
              controller: search,
              placeholder: "Search",
              prefixSvgImage: const Icon(Icons.search),
              fillColor: whiteColour,
            ),
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      border: Border.all(width: 0.7, color: neutral4Color.withOpacity(0.5))),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/performanceRatingRoutes');
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/images/profile_details.png'),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: Image.asset("assets/images/profile.jpg"),
                          ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nee Kavithaigala song",
                                style: appFontStyle(
                                  color: neutral6Color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Selva Lakshmi",
                                  style: appFontStyle(
                                    color: primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
