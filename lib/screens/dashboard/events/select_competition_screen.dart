import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/bloc_controllers/event_subtype_bloc.dart';
import 'package:dycca_partner/bloc_controllers/event_type_bloc.dart';
import 'package:dycca_partner/custom_widget/appbar_widget.dart';
import 'package:dycca_partner/custom_widget/drawer_widget.dart';
import 'package:dycca_partner/custom_widget/stream_loader.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/modal_class/event_subtype_modalclass.dart';
import 'package:dycca_partner/screens/dashboard/events/add_details_of_competition_screen.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../modal_class/event_subcategory_type_modalclass.dart';

class SelectCompetitionScreen extends StatefulWidget {
  final categoryID;
  const SelectCompetitionScreen({Key? key, this.categoryID}) : super(key: key);

  @override
  State<SelectCompetitionScreen> createState() =>
      _SelectCompetitionScreenState();
}

class _SelectCompetitionScreenState extends State<SelectCompetitionScreen> {
  TextEditingController search = TextEditingController();

  List<bool> selectedSubCategory = [];
  List<Color> selectCardColor = [];
  final subcategoryBloc = EventType_Bloc();
  final eventSubTypeBlocController = EventSubType_Bloc();
  int currentSubCategoryIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    subcategoryBloc.getEventCategoryList();
    eventSubTypeBlocController.getEventCategoryList();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subcategoryBloc.dispose();
    eventSubTypeBlocController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        backgroundColor: whiteColour,
        appBar: DashboardAppbarWidget.getAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: StreamBuilder<List<Category>>(
                    stream: subcategoryBloc.EventTypeListStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: snapshot.data![0].subcat!.length,
                            itemBuilder: (context, index) {
                              if (snapshot.hasData) {
                                selectedSubCategory.clear();
                                selectCardColor.clear();
                                for (int i = 0; i < snapshot.data!.length; i++) {
                                  selectedSubCategory.add(false);
                                  selectCardColor.add(Colors.white);
                                }
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentSubCategoryIndex = index;

                                      // selectedSubCategory[index] =
                                      //     !selectedSubCategory[index];
                                      //
                                      // if (selectedSubCategory[index] == true) {
                                      //   selectCardColor.add(primaryColor);
                                      // } else {
                                      //   selectCardColor.add(Colors.white);
                                      // }
                                    });
                                  },
                                  child: SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: Card(
                                      shape: Border(
                                        bottom: BorderSide(
                                          color: Colors.white,
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Center(
                                          child: Text(snapshot
                                              .data![0].subcat![index].catName
                                              .toString())),
                                    ),
                                  ),
                                );
                              } else {
                                return streamLoader();
                              }
                            });
                      } else {
                        return streamLoader();
                      }
                    }),
              ),
              performingArts()
            ],
          ),
        ));
  }

  Widget performingArts() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            StreamBuilder<List<EventSubTypeCategory>>(
                stream: eventSubTypeBlocController.EventSubTypeListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data![0]
                          .subcat![currentSubCategoryIndex].eventsub!.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/dashboard_image.png',
                                      height: 70,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        snapshot
                                            .data![0]
                                            .subcat![currentSubCategoryIndex]
                                            .eventsub![index]
                                            .typeName
                                            .toString(),
                                        style: fontStyle(
                                            neutral6Color, FontWeight.w600, 16),
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        showAlertDialog(context,     snapshot.data![0]
                                            .subcat![currentSubCategoryIndex]
                                            .eventsub![index].typeId
                                            .toString(),);
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             AddDetailsOfCompetitionScreen(competitionType: widget.categoryID,competitionSubType:  snapshot.data![0]
                                        //         .subcat![currentSubCategoryIndex]
                                        //         .eventsub![index].typeId
                                        //         .toString(),)));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: primaryColor.withOpacity(1),
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                        height: 30,
                                        width: 60,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Select",
                                              style: appFontStyle(
                                                color: Colors.white
                                                    .withOpacity(0.9),
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
                              const Divider(
                                thickness: 1,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return streamLoader();
                  }
                }),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "OTHERS",
                      style: fontStyle(neutral6Color, FontWeight.w600, 18),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(1),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      height: 30,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Add",
                            style: appFontStyle(
                              color: Colors.white.withOpacity(0.9),
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
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context,subTypeID) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed:  () {
             SendData().createEventCatIDSubCatID(eventNameController.text, eventDescController.text, widget.categoryID.toString(), subTypeID.toString(), context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      title: Text("Enter Studio Details"),
      content: Container(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: eventNameController,
                decoration: InputDecoration(
                  //labelText: title ,  // you can change this with the top text  like you want
                    hintText: "Event Name" ,
                    labelText: "Event Name" ,
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
            SizedBox(height: 20,),
            TextField(
              controller: eventDescController,
                decoration: InputDecoration(
                  //labelText: title ,  // you can change this with the top text  like you want
                    hintText: "Event Description" ,
                    labelText: "Event Description" ,
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  TextEditingController eventNameController  = TextEditingController();
  TextEditingController eventDescController  = TextEditingController();
}
