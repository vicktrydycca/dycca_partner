import 'package:dycca_partner/bloc_controllers/home_bloc.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/custom_widget/stream_loader.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/modal_class/services_list_modalclass.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfessionalScreen extends StatefulWidget {
  const ProfessionalScreen({Key? key}) : super(key: key);

  @override
  State<ProfessionalScreen> createState() => _ProfessionalScreenState();
}

class _ProfessionalScreenState extends State<ProfessionalScreen> {
  TextEditingController addStudio = TextEditingController();

  final homeController = HomeBloc();
  List<String> names = [
    'Dance Studio',
    'Music Studio',
    'Art Studio',
    'Acting Studio'
  ];

  @override
  void initState() {
    // TODO: implement initState
    homeController.getServicesList();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Space",
                  style: fontStyle(neutral6Color, FontWeight.w500, 20)),
            ),
          ),
          StreamBuilder<List<Service>>(
              stream: homeController.serviceListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ExpansionTile(
                    title: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(snapshot.data![0].catName.toString(),
                            style:
                                fontStyle(neutral6Color, FontWeight.w600, 18))),
                    subtitle: SizedBox(
                      height: 30,
                      child: ListView.builder(
                          itemCount: snapshot.data![0].subcat!.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Text(
                                  snapshot.data![0].subcat![index].catName!
                                      .split(",")
                                      .toString()
                                      .replaceAll("[", " ")
                                      .replaceAll("]", ", "),
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: fontStyle(
                                      neutral6Color, FontWeight.w600, 12),
                                ),
                              ],
                            );
                          }),
                    ),
                    children: <Widget>[
                      ListView.builder(
                        itemCount: snapshot.data![0].subcat!.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              color: neutral2Color,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, right: 20),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/dashboard_image.png',height: 60,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        snapshot.data![0].subcat![index].catName
                                            .toString(),
                                        style: fontStyle(
                                            neutral6Color, FontWeight.w600, 16),
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/dashboardSelectRoute');
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
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextSearchWidget(
                          controller: addStudio,
                          placeholder: "Other",
                          fillColor: whiteColour,
                          suffixSvgImage: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(1),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              height: 30,
                              width: 80,
                              child: Center(
                                child: Text(
                                  "+ Add Studio",
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
                      )
                    ],
                  );
                } else {
                  return streamLoader();
                }
              }),
        ],
      ),
    );
  }
}
