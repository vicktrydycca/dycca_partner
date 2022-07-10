import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfessionalScreen extends StatefulWidget {
  const ProfessionalScreen({Key? key}) : super(key: key);

  @override
  State<ProfessionalScreen> createState() => _ProfessionalScreenState();
}

class _ProfessionalScreenState extends State<ProfessionalScreen> {
  TextEditingController addStudio = TextEditingController();
  List<String> names = [
    'Dance Studio',
    'Music Studio',
    'Art Studio',
    'Acting Studio'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("STUDIO",
                  style: fontStyle(neutral6Color, FontWeight.w600, 18)),
              subtitle: Text(
              names.toString(),
              style:
              fontStyle(neutral6Color, FontWeight.w600, 12),
            ),
            ),
          ),
          children: <Widget>[
            Container(
              height: names.length * 80,
              child: ListView.builder(
                itemCount: names.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      color: neutral2Color,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 20),
                        child: Row(
                          children: [
                            Image.asset('assets/images/dashboard_image.png',),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                names[index],
                                style:
                                    fontStyle(neutral6Color, FontWeight.w600, 16),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/dashboardSelectRoute');
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
                                      "Select",
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
                    ),
                  );
                },
              ),
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
        ),
      ],
    );
  }
}
