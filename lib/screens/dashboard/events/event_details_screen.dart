
import 'package:dycca_partner/bloc_controllers/event_detail_bloc.dart';
import 'package:dycca_partner/modal_class/event_info_modelclass.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  List<String> items = ['Venue Partners', 'Judges', 'Sponsors'];

  final _bloc = EventDetailsBloc();

  @override
  void initState() {
    // TODO: implement initState

    _bloc.getEventCategoryList();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: whiteColour,
      //   leading: const Icon(
      //     Icons.arrow_back_ios,
      //     color: neutral6Color,
      //   ),
      //   title: const Text("Dance Battle", style: appbarConstFont),
      // ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: StreamBuilder<AboutEvent>(
            stream: _bloc.EventListStream,
            builder: (context, snapshot) {
              var eventData = snapshot.data;
              return Column(
                children: [
                  // Image.asset('assets/images/profile_details.png'),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 20),
                    child: ListTile(
                      leading: Container(
                        height: 80,
                        width: 80,
                        color: Colors.red,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eventData?.eventName ?? "",
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
                                    (eventData?.mcat?.typeName ?? "")+" "+(eventData?.subcat?.typeName??""),
                                    style: appFontStyle(
                                      color: primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: primaryColor,
                                    size: 15,
                                  ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(5))),
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

                        InkWell(
                          onTap: (){
                            _onShare(context);
                          },
                          child: Row(children: [
                            Icon(Icons.share_outlined),
                            Text(
                              "Share",
                              style: appFontStyle(
                                color: Colors.black.withOpacity(0.9),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                          ],),
                        )


                      ],
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                    child: Divider(
                      thickness: 1,
                    ),
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
                          padding: const EdgeInsets.only(top: 8.0, bottom: 15),
                          child: Text(
                            eventData?.eventName ?? "",
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
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (eventData?.eventRound?.length) ?? 0,
                            itemBuilder: (context, index) => Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Text(
                                        eventData?.eventRound?[index].round ??
                                            "",
                                        style: appFontStyle(
                                          color: neutral4Color,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/audition.png',
                                          height: 15,
                                        ),
                                        Text(
                                          eventData?.eventRound?[index].onoff
                                                      .toString() ==
                                                  "0"
                                              ? "  Online"
                                              : "  Offline",
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
                                          Icon(
                                            Icons.calendar_today,
                                            size: 18,
                                            color: primaryColor,
                                          ),
                                          Text(
                                            "  ${eventData?.eventRound?[index].startdate ?? "NA"}, ${eventData?.eventRound?[index].starttime ?? "NA"} To ${eventData?.eventRound?[index].enddate ?? "NA"}, ${eventData?.eventRound?[index].endtime ?? "NA"}",
                                            style: appFontStyle(
                                              color: neutral4Color,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Venus Partner",
                            style: fontStyle(
                                neutral6Color, FontWeight.w400, 16),
                          ),
                        ),

                        venuPartnerList(eventData?.venuepartner??[]),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Judges",
                            style: fontStyle(
                                neutral6Color, FontWeight.w400, 16),
                          ),
                        ),

                        judgesList(eventData?.judges??[]),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Sponsors",
                            style: fontStyle(
                                neutral6Color, FontWeight.w400, 16),
                          ),
                        ),

                        sponsorList(eventData?.sponsors??[]),
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
                          eventData?.eventJudgement
                                  ?.toString()
                                  .replaceAll(",", "\n") ??
                              "",
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
                        ListView.builder(
                          itemCount: eventData?.eventReward?.length??0,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Text(
                            (eventData?.eventReward?[index].pcatName ?? "") + " : "+
                                (eventData?.eventReward?[index].reward ?? ""),
                            style: appFontStyle(
                              color: neutral4Color,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
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
                                "INR ${eventData?.eventPrice?[0].pricewithfriends??'0'}/each",
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
                                "INR ${eventData?.eventPrice?[0].price??'0'}/each",
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
              );
            }),
      ),
    );
  }

  Widget sponsorList(List<Judge> sponsorList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 155,
        child: ListView.builder(
          itemCount: sponsorList.length,
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 155,
                decoration: BoxDecoration(
                    border: Border.all(color: neutral4Color, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [

                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.blue,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          sponsorList[index].name??"",
                          style: fontStyle(neutral6Color, FontWeight.w400, 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5.0, left: 20, right: 20, top: 3),
                        child: Text(
                          sponsorList[index].username??"",
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
                                    neutral6Color, FontWeight.w400, 10),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                                      neutral6Color, FontWeight.w400, 10),
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
                                    neutral6Color, FontWeight.w400, 10),
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
  Widget judgesList(List<Judge> judgeList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 155,
        child: ListView.builder(
          itemCount: judgeList.length,
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 155,
                decoration: BoxDecoration(
                    border: Border.all(color: neutral4Color, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(

                    children: [
                      SizedBox(height: 10,),

                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.blue,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          judgeList[index].name??"",
                          style: fontStyle(neutral6Color, FontWeight.w400, 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5.0, left: 20, right: 20, top: 3),
                        child: Text(
                          judgeList[index].username??"",
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
                                    neutral6Color, FontWeight.w400, 10),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                                      neutral6Color, FontWeight.w400, 10),
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
                                    neutral6Color, FontWeight.w400, 10),
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
  Widget venuPartnerList(List<Venuepartner> venupatnerSnapshot) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 155,
        child: ListView.builder(
          itemCount: venupatnerSnapshot.length,
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 155,
                decoration: BoxDecoration(
                    border: Border.all(color: neutral4Color, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [

                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.blue,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          venupatnerSnapshot[index].studioName??"",
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
                                    neutral6Color, FontWeight.w400, 10),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                                      neutral6Color, FontWeight.w400, 10),
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
                                    neutral6Color, FontWeight.w400, 10),
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

  void _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;


      await Share.share("Event Detail",
          subject: "Please Checkout this Event.",
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);

  }
}
