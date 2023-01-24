import 'package:dycca_partner/bloc_controllers/eventtype_details_bloc.dart';
import 'package:dycca_partner/bloc_controllers/manage_audition_workflow_bloc.dart';
import 'package:dycca_partner/bloc_controllers/view_manage_auditionlist_bloc.dart';
import 'package:dycca_partner/custom_widget/bottom_pop_up.dart';
import 'package:dycca_partner/custom_widget/button2.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/modal_class/event_type_details_modalclass.dart';
import 'package:dycca_partner/modal_class/workflow_assignlist_modelclass.dart';
import 'package:dycca_partner/modal_class/workflow_modelclass.dart';
import 'package:dycca_partner/screens/dashboard/feed/performence_rating_screen.dart';
import 'package:dycca_partner/screens/manage_audition/create_and_manageaudition.dart';
import 'package:dycca_partner/screens/manage_audition/manage_audtion_add_judges.dart';
import 'package:dycca_partner/screens/manage_audition/manage_audtion_participant_list.dart';
import 'package:dycca_partner/screens/manage_audition/send_to_next_round.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomizeAudition extends StatefulWidget {
  final roundID;
  final roundType;
  const CustomizeAudition({Key? key,this.roundID,this.roundType}) : super(key: key);

  @override
  State<CustomizeAudition> createState() => _CustomizeAuditionState();
}

class _CustomizeAuditionState extends State<CustomizeAudition> {
  ViewManageAuditionlistBloc _bloc = ViewManageAuditionlistBloc();
  EventTypeDetailsBloc _eventBloc = EventTypeDetailsBloc();

  @override
  void initState() {
    //TODO: implement initState
    _bloc.getManageAuditionList(roundId:widget.roundID);
    super.initState();
  }

  @override
  void dispose() {
    //TODO: implement dispose
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Customize Audtion",
          style: appFontStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.roundType,
                style: appFontStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20,),
            // const SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   "Assign Partners and their Roles",
            //   style: appFontStyle(
            //     color: Colors.black,
            //     fontSize: 20,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            // Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 5.0),
            //     child: ListTile(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => ManageAuditionAddJudgesScreen(
            //                 titleName: "judges",
            //               ),
            //               maintainState: true,
            //             )).then((value) => _bloc.judgesListSink.add(value),);
            //       },
            //       title: Text(
            //         "TAG Judges",
            //         style: appFontStyle(
            //           color: Colors.black,
            //           fontSize: 12,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //       trailing: Icon(
            //         Icons.arrow_forward_ios_rounded,
            //         size: 14,
            //       ),
            //     )),
            //
            //   StreamBuilder<List<String>>(
            //     stream: _bloc.judgesList,
            //     builder: (context, snapshot) {
            //       return snapshot.hasData? SizedBox(
            //         height: 50,
            //         child: ListView.builder(
            //             scrollDirection: Axis.horizontal,
            //             physics: AlwaysScrollableScrollPhysics(),
            //             shrinkWrap: true,
            //             itemCount: snapshot.data?.length??0,
            //             itemBuilder: (context, index) => Card(
            //                     child: Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: Center(
            //                       child: Text(
            //                     snapshot.data?[index]??"",
            //                     style: appFontStyle(
            //                       color: Colors.black,
            //                       fontSize: 12,
            //                       fontWeight: FontWeight.w500,
            //                     ),
            //                   )),
            //                 ))),
            //       ):SizedBox();
            //     }
            //   ),

            // Divider(),
            // Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 5.0),
            //     child: ListTile(
            //       title: Text(
            //         "TAG Venus",
            //         style: appFontStyle(
            //           color: Colors.black,
            //           fontSize: 12,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //       trailing: Icon(
            //         Icons.arrow_forward_ios_rounded,
            //         size: 14,
            //       ),
            //     )),
            Text(
              "Audition Flow",
              style: appFontStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            auditionFlow(),
          ],
        ),
      ),
    );
  }

  Widget auditionFlow() {
    return StreamBuilder<List<Assignworkflow>?>(
        stream: _bloc.EventTypeListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          onTap: () {
                            if (snapshot.data?[index].workflowTitle ==
                                "Rating") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ManageAuditionParticipantList()));
                            } else if (snapshot.data?[index].workflowTitle ==
                                "Send to next audition") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           SendToNextRound()));
                            } else if (snapshot.data?[index].workflowTitle ==
                                "Choose Audition") {
                              _eventBloc.getEventCategoryList();

                              showBottomPopUp(context);
                            }

                            else if (snapshot.data?[index].workflowTitle ==
                                "Close Audition") {
                              closeAuditionShowBottomPopUp(context);

                            }
                          },
                          title: Text(
                            snapshot.data?[index].workflowTitle ?? "",
                            style: appFontStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                          ),
                        ),
                        const Divider()
                      ],
                    ));
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 0.9,
              ),
            );
          }
        });
  }

  showBottomPopUp(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StreamBuilder<List<EventRound>>(
              stream: _eventBloc.EventTypeListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageCustomizeAudition(roundID: snapshot.data?[index].roundid,roundType: snapshot.data?[index].round,)));
                              },
                              title: Text(
                                snapshot.data?[index].round.toString() ?? "",
                                style: appFontStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              trailing: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(color: primaryColor),
                                child: Center(
                                  child: Text(
                                    "Customize",
                                    style: appFontStyle(
                                      color: Colors.white,
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
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 0.9,
                    ),
                  );
                }
              });
        });
  }
  closeAuditionShowBottomPopUp(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height/3,
            child: Column(

              children: [
                SizedBox(height: 20,),

               Text(
                      "Are You Sure You Want to Close Audition?",
                      style: appFontStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
               ),
                SizedBox(height: 30,),

                Button2(placeholder: "Close", buttonClickCallback: (){},disabled: false,color: Colors.redAccent,),
                Button2(placeholder: "Don't Close", buttonClickCallback: (){Navigator.pop(context);},disabled: false,)
              ],
            ),
          );
        });
  }
}
