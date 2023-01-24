import 'package:dycca_partner/bloc_controllers/send_to_next_rount_bloc.dart';
import 'package:dycca_partner/bloc_controllers/view_participant_myround_bloc.dart';
import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/modal_class/event_list_roundwise_model.dart';
import 'package:dycca_partner/screens/dashboard/feed/performence_rating_screen.dart';
import 'package:dycca_partner/screens/manage_audition/send_to_next_round.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class FeedDetailAcceptEntriesScreen extends StatefulWidget {
  final rounType;
  final roundID;
  const FeedDetailAcceptEntriesScreen({Key? key, this.rounType, this.roundID})
      : super(key: key);

  @override
  State<FeedDetailAcceptEntriesScreen> createState() =>
      _FeedDetailAcceptEntriesScreenState();
}

class _FeedDetailAcceptEntriesScreenState
    extends State<FeedDetailAcceptEntriesScreen> {
  final _bloc = ViewParticipantListBloc();
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _bloc.getEventCategoryList(roundID: widget.roundID);

    // _bloc.getEventCategoryList(roundID: widget.roundID);
    print("tiiii${widget.roundID}");
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

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: InkWell(
          onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SendToNextRound(roundID: widget.roundID,)));
          },
          child: Container(

            height: 50,
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: Center(
              child: Text(
                "Send To Next Round",
                style: appFontStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: whiteColour,
        appBar: AppbarBackButton().AppbarBack(context, widget.rounType),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              // Stack(
              //   children: [
              //     Image.asset('assets/images/profile_details.png'),
              //     Positioned(
              //
              //       bottom: 15,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(left: 20.0),
              //             child: Container(
              //               decoration: const BoxDecoration(
              //                 borderRadius: BorderRadius.all(Radius.circular(7)),
              //                 color: whiteColour
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
              //                 child: Text(
              //                   "Event info",
              //                   style: appFontStyle(
              //                     color: neutral6Color,
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           const SizedBox(width: 30,),
              //           Container(
              //             decoration: const BoxDecoration(
              //                 borderRadius: BorderRadius.all(Radius.circular(7)),
              //                 color: whiteColour
              //             ),
              //             child: Padding(
              //               padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
              //               child: Text(
              //                 "Manage",
              //                 style: appFontStyle(
              //                   color: neutral6Color,
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           const SizedBox(width: 30,),
              //           Padding(
              //             padding: const EdgeInsets.only(right: 20.0),
              //             child: Container(
              //               decoration: const BoxDecoration(
              //                   borderRadius: BorderRadius.all(Radius.circular(7)),
              //                   color: whiteColour
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
              //                 child: Text(
              //                   "Show case",
              //                   style: appFontStyle(
              //                     color: neutral6Color,
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 15),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Text(
          //         "Participants",
          //         style: appFontStyle(
          //           color: neutral6Color,
          //           fontSize: 16,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //       Text(
          //         "Judges",
          //         style: appFontStyle(
          //           color: neutral6Color,
          //           fontSize: 16,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //       Text(
          //         "Venue Partners",
          //         style: appFontStyle(
          //           color: neutral6Color,
          //           fontSize: 16,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
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
                        Navigator.pushNamed(
                            context, '/listOfParticipantsRoutes');
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          //   child: TextSearchWidget(
          //     controller: search,
          //     placeholder: "Search",
          //     prefixSvgImage: const Icon(Icons.search),
          //     fillColor: whiteColour,
          //   ),
          // ),
          StreamBuilder<EventListRoundwiseModelclass>(
              stream: _bloc.EventListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: (snapshot.data?.data?.auditions?.length) ?? 0,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var auditionData = snapshot.data?.data?.auditions;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7)),
                              border: Border.all(
                                  width: 0.7,
                                  color: neutral4Color.withOpacity(0.5))),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PerformanceRatingScreen(roundID:auditionData?[index].roundid??"",auditionID: auditionData?[index].audId.toString()??"",))).then((value) => _bloc.getEventCategoryList(roundID: widget.roundID));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                    'assets/images/profile_details.png'),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    child: Image.asset(
                                        "assets/images/profile.jpg"),
                                  ),


                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        auditionData?[index].title ?? "",
                                        style: appFontStyle(
                                          color: neutral6Color,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          auditionData?[index].user?.name ?? "",
                                          style: appFontStyle(
                                            color: primaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Rating:-  ",
                                            style: appFontStyle(
                                              color: neutral6Color,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ),),
                                          Text(
                                            auditionData?[index].auditrating?.rating.toString() ?? "",
                                            style: appFontStyle(
                                              color: neutral6Color,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),

                                          ),
                                          Icon(Icons.star,color: Colors.yellow,size: 14,),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
