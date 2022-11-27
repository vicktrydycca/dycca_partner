import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/bloc_controllers/judges_sponsers_partner_bloc.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/custom_widget/stream_loader.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/modal_class/partner_sponser_judges.dart';
import 'package:dycca_partner/utils/SharedPrefHelper.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class AddJudgesScreen extends StatefulWidget {
  final competitionType;
  final competitionSubType;
  const AddJudgesScreen(
      {Key? key, this.competitionType, this.competitionSubType})
      : super(key: key);

  @override
  State<AddJudgesScreen> createState() => _AddJudgesScreenState();
}

class _AddJudgesScreenState extends State<AddJudgesScreen> {
  bool seen = false;
  bool hide = true;
  TextEditingController search = TextEditingController();
  final judgeSponserController = Judges_Sponsers_Partner_Bloc();

  @override
  void dispose() {
    // TODO: implement dispose
    judgeSponserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var titleName = arg["appbar"];
    var categoryTypeID = arg["categoryType"];
    var subCategoryTypeID = arg["categorySubType"];
    var eventName = arg["eventName"];
    var eventDesc = arg["eventDesc"];
    var eventID = arg["eventID"];
    var collobratintype;
    if (titleName == "Venue Partners") {
      judgeSponserController.getVenusPartnerList();
      collobratintype = "venuepartner";
    } else if (titleName == "judges") {
      judgeSponserController.getJudgesList();
      collobratintype = "venuepartner";
    } else {
      judgeSponserController.getSponsorsList();
      collobratintype = "sponsors";
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: const Icon(
          Icons.arrow_forward,
          color: whiteColour,
        ),
        backgroundColor: primaryColor,
        onPressed: () {
          debugPrint("aaaa${judgeSponserController.userID.toString()}");

          SendData().createEventJudgeVenusSponsorsAdd(
              collobratintype,
              eventName,
              eventDesc,
              eventID,
              categoryTypeID,
              subCategoryTypeID,
              judgeSponserController.userID.toString(),
              context);

        },
      ),
      backgroundColor: whiteColour,
      appBar: AppBar(

        actions: [
          ButtonWidget(
            buttonClickCallback: () {
               Navigator.pushNamed(context, '/hostEventRoutes',arguments: {"competitionName":eventName,"compDesc":eventDesc,"typeID":categoryTypeID,"subTypeID":subCategoryTypeID,"eventID":eventID});

            },
            placeholder: "Host Event",
            fontSize: 12,
            disabled: false,
          )
        ],
        elevation: 0,
        backgroundColor: whiteColour,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: neutral6Color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(titleName, style: appbarConstFont),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: TextSearchWidget(
                controller: search,
                placeholder: "Search",
                prefixSvgImage: const Icon(Icons.search),
                fillColor: whiteColour,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // for horizontal listview
            judgeSponserController.userID.isNotEmpty
                ? SizedBox(
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: judgeSponserController.userID.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: neutral4Color, width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      judgeSponserController
                                          .userNameList[index],
                                      style: fontStyle(
                                          neutral6Color, FontWeight.w100, 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 20, right: 20),
                                    child: Text(
                                      judgeSponserController.userEmail[index],
                                      style: fontStyle(
                                          neutral6Color, FontWeight.w100, 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),

            //verival listview
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15),
              child: Text(
                "Recently Tagged",
                style: fontStyle(neutral6Color, FontWeight.w100, 19),
              ),
            ),
            StreamBuilder<List<Judge>>(
                stream: judgeSponserController.judgesSponserPartnerListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: const CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.blue,
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name.toString(),
                                    style: fontStyle(
                                        neutral6Color, FontWeight.w100, 16),
                                  ),
                                  Text(
                                    snapshot.data![index].username.toString(),
                                    style: fontStyle(
                                        neutral4Color, FontWeight.w100, 14),
                                  )
                                ],
                              ),
                              trailing: judgeSponserController
                                      .addBtnVisibility[index]
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            final arg = ModalRoute.of(context)!
                                                .settings
                                                .arguments as Map;

                                            judgeSponserController
                                                    .addBtnVisibility[index] =
                                                false;
                                            judgeSponserController.userID.add(
                                                snapshot.data![index].userId
                                                    .toString());
                                            judgeSponserController.userNameList
                                                .add(snapshot
                                                    .data![index].username
                                                    .toString());
                                            // judgeSponserController.userImage.add(snapshot.data![index]..toString());
                                            judgeSponserController.userEmail
                                                .add(snapshot.data![index].name
                                                    .toString());

                                            if (titleName == "Venue Partners") {
                                              judgeSponserController
                                                  .addVenusIDList
                                                  .add(snapshot
                                                      .data![index].userId
                                                      .toString());
                                            } else if (titleName == "Judges") {
                                              judgeSponserController
                                                  .addJudgesIDList
                                                  .add(snapshot
                                                      .data![index].userId
                                                      .toString());
                                            } else {
                                              judgeSponserController
                                                  .addSponsorIDList
                                                  .add(snapshot
                                                      .data![index].userId
                                                      .toString());
                                            }
                                          });
                                          // Navigator.pushNamed(context, '/addJudgesRoutes');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: primaryColor.withOpacity(1),
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                          ),
                                          height: 30,
                                          width: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.add,
                                                  size: 15,
                                                  color: whiteColour,
                                                ),
                                                Text(
                                                  "  ADD",
                                                  style: appFontStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.9),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            judgeSponserController
                                                .addBtnVisibility[index] = true;
                                            judgeSponserController.userID
                                                .remove(snapshot
                                                    .data![index].userId
                                                    .toString());
                                            judgeSponserController.userNameList
                                                .remove(snapshot
                                                    .data![index].username
                                                    .toString());
                                            // judgeSponserController.userImage.add(snapshot.data![index]..toString());
                                            judgeSponserController.userEmail
                                                .remove(snapshot
                                                    .data![index].name
                                                    .toString());
                                          });
                                          // Navigator.pushNamed(context, '/addJudgesRoutes');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(1),
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                          ),
                                          height: 30,
                                          width: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.remove_circle_outline,
                                                  size: 15,
                                                  color: whiteColour,
                                                ),
                                                Text(
                                                  "  Remove",
                                                  style: appFontStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.9),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                        },
                      ),
                    );
                  } else {
                    return streamLoader();
                  }
                })
          ],
        ),
      ),
    );
  }
}
