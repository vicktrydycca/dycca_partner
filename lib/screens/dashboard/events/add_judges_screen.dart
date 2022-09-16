import 'package:dycca_partner/bloc_controllers/judges_sponsers_partner_bloc.dart';
import 'package:dycca_partner/custom_widget/stream_loader.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/modal_class/partner_sponser_judges.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class AddJudgesScreen extends StatefulWidget {
  const AddJudgesScreen({Key? key}) : super(key: key);

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
    if(titleName == "Venue Partners"){
      judgeSponserController.getVenusPartnerList();
    }
    else if(titleName == "Judges"){
      judgeSponserController.getJudgesList();

    }
    else {
      judgeSponserController.getSponsorsList();
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
          Navigator.pushNamed(context, '/hostEventRoutes');
        },
      ),
      backgroundColor: whiteColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColour,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: neutral6Color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(titleName, style: appbarConstFont),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Visibility(
              visible: seen,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: neutral4Color, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.cancel_rounded,
                            size: 15,
                          )),
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "JackMan",
                        style: fontStyle(neutral6Color, FontWeight.w100, 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 20, right: 20),
                      child: Text(
                        "@JackMan123",
                        style: fontStyle(neutral6Color, FontWeight.w100, 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                      physics: const ScrollPhysics(),
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
                          trailing: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  seen = true;
                                });
                                // Navigator.pushNamed(context, '/addJudgesRoutes');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(1),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                height: 30,
                                width: 70,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return streamLoader();
                }
              })
        ],
      ),
    );
  }
}
