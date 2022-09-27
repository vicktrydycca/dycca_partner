import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/selectSendRoutes');
          },
          child: Container(
            height: 50,
            color: primaryColor,
            child: Center(
              child: Text(
                "Select and Sent to Semifinal",
                style: appFontStyle(
                  color: whiteColour,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Auditions",
                      style: appFontStyle(
                        color: neutral6Color,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Semi Final",
                      style: appFontStyle(
                        color: neutral6Color,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Finals",
                      style: appFontStyle(
                        color: neutral6Color,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(7)),
                          border: Border.all(width: 0.7, color: neutral4Color.withOpacity(0.5))),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/performanceRatingRoutes');
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/images/profile_details.png'),
                            ListTile(
                              leading: CircleAvatar(
                                radius: 20,
                                child: Image.asset("assets/images/profile.jpg"),
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nee Kavithaigala song",
                                    style: appFontStyle(
                                      color: neutral6Color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "Selva Lakshmi",
                                      style: appFontStyle(
                                        color: primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Text(
                                "06/10",
                                style: appFontStyle(
                                  color: neutral6Color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
