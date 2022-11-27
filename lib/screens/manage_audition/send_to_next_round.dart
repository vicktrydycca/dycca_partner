import 'package:dycca_partner/bloc_controllers/eventtype_details_bloc.dart';
import 'package:dycca_partner/bloc_controllers/round_details_bloc.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widget/appbar_widget.dart';
import '../../modal_class/event_type_details_modalclass.dart';
import '../../modal_class/round_details_modelclass.dart';

class SendToNextRound extends StatefulWidget {
  const SendToNextRound({Key? key}) : super(key: key);

  @override
  State<SendToNextRound> createState() => _SendToNextRoundState();
}

class _SendToNextRoundState extends State<SendToNextRound> {
  EventTypeDetailsBloc _eventBloc = EventTypeDetailsBloc();
  ManegeAuditionRoundDetailsBloc _bloc = ManegeAuditionRoundDetailsBloc();

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
          if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data?.auditions?.length??0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(

                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      border: Border.all(
                          width: 0.7, color: neutral4Color.withOpacity(0.5))),
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Column(
                      children: [
                        Image.asset('assets/images/profile_details.png'),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: Image.network("https://dyccapartner.com/${snapshot.data?.auditions?[index].user?.userImg??""}"),
                          ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data?.auditions?[index].title??"",
                                style: appFontStyle(
                                  color: neutral6Color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  snapshot.data?.auditions?[index].user?.name??"",
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
          );
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 0.9,
              ),
            );
          }
        }
    );
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
