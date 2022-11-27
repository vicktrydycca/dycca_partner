import 'package:dycca_partner/bloc_controllers/eventtype_details_bloc.dart';
import 'package:dycca_partner/bloc_controllers/manage_audition_workflow_bloc.dart';
import 'package:dycca_partner/custom_widget/bottom_pop_up.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/modal_class/event_type_details_modalclass.dart';
import 'package:dycca_partner/modal_class/workflow_modelclass.dart';
import 'package:dycca_partner/screens/dashboard/feed/performence_rating_screen.dart';
import 'package:dycca_partner/screens/manage_audition/manage_audtion_add_judges.dart';
import 'package:dycca_partner/screens/manage_audition/manage_audtion_participant_list.dart';
import 'package:dycca_partner/screens/manage_audition/send_to_next_round.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomizeAudition extends StatefulWidget {
  const CustomizeAudition({Key? key}) : super(key: key);

  @override
  State<CustomizeAudition> createState() => _CustomizeAuditionState();
}

class _CustomizeAuditionState extends State<CustomizeAudition> {
  ManageAuditionWorkFlowBloc _bloc = ManageAuditionWorkFlowBloc();
  EventTypeDetailsBloc _eventBloc = EventTypeDetailsBloc();

  @override
  void initState() {
    //TODO: implement initState
    _bloc.getEventCategoryList();
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
            const SizedBox(
              height: 20,
            ),
            Text(
              "Assign Partners and their Roles",
              style: appFontStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageAuditionAddJudgesScreen(
                            titleName: "judges",
                          ),
                          maintainState: true,
                        )).then((value) => _bloc.judgesListSink.add(value),);
                  },
                  title: Text(
                    "TAG Judges",
                    style: appFontStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  ),
                )),

              StreamBuilder<List<String>>(
                stream: _bloc.judgesList,
                builder: (context, snapshot) {
                  return snapshot.hasData? SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length??0,
                        itemBuilder: (context, index) => Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                snapshot.data?[index]??"",
                                style: appFontStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ))),
                  ):SizedBox();
                }
              ),

            Divider(),
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
    return StreamBuilder<List<Workflow>>(
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
                                          const SendToNextRound()));
                            } else if (snapshot.data?[index].workflowTitle ==
                                "Choose Audition") {
                              _eventBloc.getEventCategoryList();

                              showBottomPopUp(context);
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
                              onTap: () {},
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
}
