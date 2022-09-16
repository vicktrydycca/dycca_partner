import 'package:dycca_partner/bloc_controllers/event_homepage_bloc.dart';
import 'package:dycca_partner/custom_widget/stream_loader.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/modal_class/event_category_modalclass.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  TextEditingController search = TextEditingController();

  final eventCategoryController = EventCategory_Bloc();

  @override
  void dispose() {
    // TODO: implement dispose
    eventCategoryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    eventCategoryController.getEventCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What Type Of Events",
                style: fontStyle(neutral6Color, FontWeight.w500, 19),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextSearchWidget(
                  controller: search,
                  placeholder: "Search",
                  prefixSvgImage: const Icon(Icons.search),
                  fillColor: whiteColour,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<List<Category>>(
                  stream: eventCategoryController.EventCategoryListStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
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
                                      Container(
                                        width: 100,
                                        height: 100,
                                        child: Image.network(
                                            "https://dyccapartner.com/" + snapshot.data![index].catimg.toString()

                                        )
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          snapshot.data![index].typeName.toString(),
                                          style: fontStyle(neutral6Color,
                                              FontWeight.w600, 16),
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              '/selectCompetitionRoutes');
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
                  })
            ],
          ),
        ),
      ),
    );
  }
}
