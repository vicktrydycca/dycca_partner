import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  TextEditingController search = TextEditingController();
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
              ListView.builder(
                itemCount: 3,
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
                                'assets/images/dashboard_image.png',height: 70,
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
                                  Navigator.pushNamed(context, '/selectCompetitionRoutes');
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
                        const Divider(thickness: 1,),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
