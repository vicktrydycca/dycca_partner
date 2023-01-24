import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/bloc_controllers/eventtype_details_bloc.dart';
import 'package:dycca_partner/bloc_controllers/round_details_bloc.dart';
import 'package:dycca_partner/custom_widget/button2.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widget/appbar_widget.dart';
import '../../modal_class/event_type_details_modalclass.dart';
import '../../modal_class/round_details_modelclass.dart';

class SendToNextRound extends StatefulWidget {
  final roundID;
   SendToNextRound({Key? key,this.roundID}) : super(key: key);

  @override
  State<SendToNextRound> createState() => _SendToNextRoundState();
}

class _SendToNextRoundState extends State<SendToNextRound> {
  EventTypeDetailsBloc _eventBloc = EventTypeDetailsBloc();
  ManegeAuditionRoundDetailsBloc _bloc = ManegeAuditionRoundDetailsBloc();
  List selectedAudids = [];
  var eventID;
  @override
  void initState() {
    // TODO: implement initState
    _bloc.getAudition(context);

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
      bottomNavigationBar: GestureDetector(
        onTap: () {
          _eventBloc.getEventCategoryList();

          showBottomPopUp();
        },
        child: Container(
          height: 50,
          color: primaryColor,
          child: Center(
            child: Text(
              "Send To Next Round",
              style: appFontStyle(
                color: whiteColour,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      appBar: DashboardAppbarWidget.getAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [participantList()],
        ),
      ),
    );
  }

  participantList() {
    return StreamBuilder<Data>(
        stream: _bloc.judgesSponserPartnerListStream,
        builder: (context, snapshot) {

          debugPrint(snapshot.data?.isSelected.toString());

                for(int i = 0; i < (snapshot.data?.auditions?.length??0); i++){
                  snapshot.data?.isSelected.add(false);
                }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.auditions?.length ?? 0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7)),
                        border: Border.all(
                            width: 0.7, color: neutral4Color.withOpacity(0.5))),
                    child: Column(
                      children: [
                        Image.asset('assets/images/profile_details.png'),
                        ListTile(
                          trailing: Checkbox(

                                onChanged: (val){
                                  setState(() {
                                    snapshot.data?.isSelected[index] = val??false;

                                  });
                                  // List selectedAudIDs = [];

                                  saveSelectedIDs( snapshot.data,index,snapshot.data?.event?.eventId.toString()??"0");



                                  print("this is audID$selectedAudids");
                                },
                                value: snapshot.data?.isSelected[index],
                              ),
                          leading: CircleAvatar(
                            radius: 20,
                            child: Image.network(
                                "https://dyccapartner.com/${snapshot.data?.auditions?[index].user?.userImg ?? ""}"),
                          ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data?.auditions?[index].title ?? "",
                                style: appFontStyle(
                                  color: neutral6Color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  snapshot.data?.auditions?[index].user?.name ??
                                      "",
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
                );
              },
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

  showBottomPopUp() {
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
                                Navigator.pop(context);
                              },
                              title: Text(
                                snapshot.data?[index].round.toString() ?? "",
                                style: appFontStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              trailing: InkWell(
                                onTap: (){
                                  debugPrint(snapshot.data?[index].roundid.toString());

                                   SendData().sendToNextRound(roundId:snapshot.data?[index].roundid,audID:selectedAudids, context:context,eventID:eventID );
                                },
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(color: primaryColor),
                                  child: Center(
                                    child: Text(
                                      "Send",
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
  saveSelectedIDs(selectedData,index,userEventID){
    if(selectedData?.isSelected[index] == true){
      selectedAudids.add(selectedData?.auditions?[index].audId);
      eventID = userEventID;
    }
    else{
      selectedAudids.remove(selectedData?.auditions?[index].audId);

    }
    debugPrint(selectedAudids.toString());
  }
}
