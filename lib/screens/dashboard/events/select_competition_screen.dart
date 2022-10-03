import 'package:dycca_partner/bloc_controllers/event_subtype_bloc.dart';
import 'package:dycca_partner/bloc_controllers/event_type_bloc.dart';
import 'package:dycca_partner/custom_widget/appbar_widget.dart';
import 'package:dycca_partner/custom_widget/drawer_widget.dart';
import 'package:dycca_partner/custom_widget/stream_loader.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/modal_class/event_subtype_modalclass.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../modal_class/event_subcategory_type_modalclass.dart';

class SelectCompetitionScreen extends StatefulWidget {
  const SelectCompetitionScreen({Key? key}) : super(key: key);

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
  @override
  void initState() {
    // TODO: implement initState
    subcategoryBloc.getEventCategoryList();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subcategoryBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        backgroundColor: whiteColour,
        appBar: DashboardAppbarWidget.getAppBar(context),
        body: Column(
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
                                    selectedSubCategory[index] =
                                        !selectedSubCategory[index];

                                    if (selectedSubCategory[index] == true) {
                                      selectCardColor.add(primaryColor);
                                    } else {
                                      selectCardColor.add(Colors.white);
                                    }
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
                  return ListView.builder(
                    itemCount: 4,
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
                                      "Competition",
                                      style: fontStyle(
                                          neutral6Color, FontWeight.w600, 16),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.pushNamed(context, '/selectCompetitionRoutes');
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
                                              color:
                                                  Colors.white.withOpacity(0.9),
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
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/addDetailsOfCompetitionRoutes');
                    },
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
}
