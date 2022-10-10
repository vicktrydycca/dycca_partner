import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ViewProductsScreen extends StatefulWidget {
  const ViewProductsScreen({Key? key}) : super(key: key);

  @override
  State<ViewProductsScreen> createState() => _ViewProductsScreenState();
}

class _ViewProductsScreenState extends State<ViewProductsScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColour,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: neutral6Color,
        ),
        title: const Text("Select Products", style: appbarConstFont),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
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
              itemCount: 5,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20.0,bottom: 20),
                child: Row(
                  children: [
                   Container(
                     decoration: BoxDecoration(
                       border: Border.all(color: neutral4Color.withOpacity(0.5)),
                       color: whiteColour,
                       borderRadius: BorderRadius.circular(3.0),
                     ),

                     child: Image.asset('assets/images/image.png',height: 100,),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: [
                          Text(
                            "Red Bull Drink",
                            style: appFontStyle(
                              color: neutral6Color,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: neutral4Color.withOpacity(0.5)),
                              color: whiteColour,
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: [
                                  Text(
                                    "500 ML",
                                    style: appFontStyle(
                                      color: neutral6Color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Icon(Icons.arrow_drop_down_sharp)
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              "300 INR",
                              style: appFontStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0,right: 20),
                      child: GestureDetector(
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
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "ADD",
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
                    ),
                  ],
                ),
              );
            },)
          ],
        ),
      ),
    );
  }
}
