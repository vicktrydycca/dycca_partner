import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class SelectSendScreen extends StatefulWidget {
  const SelectSendScreen({Key? key}) : super(key: key);

  @override
  State<SelectSendScreen> createState() => _SelectSendScreenState();
}

class _SelectSendScreenState extends State<SelectSendScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/');
        },
        child: Container(
          height: 50,
          color: primaryColor,
          child: Center(
            child: Text(
              "Select and Sent to Semifinal",
              style: appFontStyle(
                color: whiteColour,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: whiteColour,
      appBar: AppbarBackButton().AppbarBack(context, "Select and Send"),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal:5.0, vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/performanceRatingRoutes');
                    },
                    child: Column(
                      children: [

                        ListTile(
                          leading: CircleAvatar(
                            radius: 25,
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
