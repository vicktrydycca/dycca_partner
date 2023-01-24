import 'dart:convert';

import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/bloc_controllers/eventtype_details_bloc.dart';
import 'package:dycca_partner/bloc_controllers/manage_audition_workflow_bloc.dart';
import 'package:dycca_partner/custom_widget/bottom_pop_up.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/modal_class/event_type_details_modalclass.dart';
import 'package:dycca_partner/modal_class/workflow_modelclass.dart';
import 'package:dycca_partner/screens/dashboard/feed/performence_rating_screen.dart';
import 'package:dycca_partner/screens/manage_audition/customizeAudition.dart';
import 'package:dycca_partner/screens/manage_audition/manage_audtion_add_judges.dart';
import 'package:dycca_partner/screens/manage_audition/manage_audtion_participant_list.dart';
import 'package:dycca_partner/screens/manage_audition/send_to_next_round.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ManageCustomizeAudition extends StatefulWidget {
  final roundID;
  final roundType;
  const ManageCustomizeAudition({Key? key, required this.roundID,this.roundType})
      : super(key: key);

  @override
  State<ManageCustomizeAudition> createState() =>
      _ManageCustomizeAuditionState();
}

class _ManageCustomizeAuditionState extends State<ManageCustomizeAudition> {
  ManageAuditionWorkFlowBloc _bloc = ManageAuditionWorkFlowBloc();
  EventTypeDetailsBloc _eventBloc = EventTypeDetailsBloc();
  String? _dropDownValue;

  @override
  void initState() {
    //TODO: implement initState
    _bloc.getEventCategoryList();
    getWorkFlowList();

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             // FeedDetailAcceptEntriesScreen(rounType: snapshot.data?[index].round,)));
    // CustomizeAudition()));
    // // CustomizeAudition(roundID: snapshot.data?[index].roundid,roundType:snapshot.data?[index].round)));
    super.initState();
  }

  @override
  void dispose() {
    //TODO: implement dispose
    _bloc.dispose();
    super.dispose();
  }


   getWorkFlowList(){
    setState(() {
      _bloc.getManageAuditionList(roundId: widget.roundID);

    });

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:
                    Text(
                      widget.roundType,
                      style: appFontStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),

                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Assign Partners and their Roles",
                style: appFontStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              tagJudges(),
              tagVenus(),

          Text("Audition Flow",
          style: appFontStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
              SizedBox(height: 10,),

              AuditionDropdown(),
              auditionFlow(),

            ],
          ),
        ),
      ),
    );
  }

  Widget tagJudges() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ManageAuditionAddJudgesScreen(
                    titleName: "judges",
                    roundID: widget.roundID,
                  ),
                  maintainState: true,
                )).then(
              (value) => _bloc.judgesListSink.add(value),
            );
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
        ));
  }
  Widget tagVenus() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: ListTile(
          onTap: () {

          },
          title: Text(
            "TAG Venus",
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
        ));
  }

  Widget AuditionDropdown() {
    return StreamBuilder<List<Workflow>>(
        stream: _bloc.EventTypeListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List dropDownList = [];
            for (int i = 0; i < snapshot.data!.length; i++) {
              dropDownList.add(snapshot.data?[i].workflowTitle ?? "");
            }


            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      hint: _dropDownValue == null
                          ? Text('Manage Audition')
                          : Text(
                              _dropDownValue!,
                              style: appFontStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: appFontStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      items: dropDownList.map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(
                              val,
                              style: appFontStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (String? val) {
                        setState(
                          () {
                            _dropDownValue = val;
                          },
                        );
                      },
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        for (int i = 0; i < snapshot.data!.length; i++) {
                          if (snapshot.data?[i].workflowTitle ==
                              _dropDownValue) {
                            _bloc.auditionIDList
                                .add(snapshot.data?[i].id.toString() ?? "");
                          }
                        }
                        _bloc.auditionList.add(_dropDownValue ?? "");
                      });
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                    ))
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 0.9,
              ),
            );
          }
        });
  }

  Widget auditionFlow() {

    return Column(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _bloc.auditionList.length ?? 0,
            itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: Text(
                        'Step:${index + 1}',
                        style: appFontStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      title: Text(
                        _bloc.auditionList[index] ?? "",
                        style: appFontStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            _bloc.auditionList
                                .remove(_bloc.auditionList[index] ?? "");
                            _bloc.auditionIDList
                                .remove(_bloc.auditionIDList[index] ?? "");
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ),
                    const Divider()
                  ],
                )),
        _bloc.auditionList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(30.0),
                child: ButtonWidget(
                  placeholder: 'Save',
                  buttonClickCallback: () {
                    final List<Map<String, dynamic>> _worflowList = [];

                    for (int i = 0; i < _bloc.auditionIDList.length; i++) {
                      _worflowList.add({
                       "workflowId": _bloc.auditionIDList[i],
                       "seq": (i + 1).toString()
                      });
                    }

                    SendData().ManageAuditionRoundSave(
                      roundId: widget.roundID,
                        workflows:_worflowList, context: context);
                  },
                  disabled: false,
                ),
              )
            : SizedBox()
      ],
    );
  }
}

