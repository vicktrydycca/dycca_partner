import 'package:dycca_partner/bloc_controllers/round_details_bloc.dart';
import 'package:dycca_partner/modal_class/round_details_modelclass.dart';
import 'package:dycca_partner/screens/dashboard/feed/performence_rating_screen.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../custom_widget/appbar_widget.dart';

class ManageAuditionParticipantList extends StatefulWidget {
  const ManageAuditionParticipantList({Key? key}) : super(key: key);

  @override
  State<ManageAuditionParticipantList> createState() =>
      _ManageAuditionParticipantListState();
}

class _ManageAuditionParticipantListState
    extends State<ManageAuditionParticipantList> {
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
      appBar: DashboardAppbarWidget.getAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [participantList()],
        ),
      ),
    );
  }

  participantList() {
    return StreamBuilder<Data>(
      stream: _bloc.judgesSponserPartnerListStream,
      builder: (context, snapshot) {
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PerformanceRatingScreen(videoUrl: snapshot.data?.auditions?[index].videoUrl??"",videoTitle: snapshot.data?.auditions?[index].title??"",videoUserName: snapshot.data?.auditions?[index].user?.name??"",)));
                    // Navigator.pushNamed(context, '/performanceRatingRoutes');
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
      }
    );
  }
}
