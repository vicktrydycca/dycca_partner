import 'package:dycca_partner/custom_widget/appbar_widget.dart';
import 'package:dycca_partner/custom_widget/drawer_widget.dart';

import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class SelectSerivceScreen extends StatefulWidget {
  const SelectSerivceScreen({Key? key}) : super(key: key);

  @override
  State<SelectSerivceScreen> createState() => _SelectSerivceScreenState();
}

class _SelectSerivceScreenState extends State<SelectSerivceScreen> {
  double progressCompletion = 0.6;
  List<String> names = [
    'Performing Arts',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      drawer: const DrawerWidget(),
      appBar: DashboardAppbarWidget.getAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: whiteColour,
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search Booking',
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: whiteColour),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            color: whiteColour,
                            size: 20,
                          ),
                          Text(
                            " Add",
                            style:
                                fontStyle(whiteColour, FontWeight.w500, 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          verifyYourService(),
        ],
      ),
    );
  }

  Widget verifyYourService() {
    return Column(
      children: [
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
                  color: neutral2Color.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/dashboard_image.png',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            names[index],
                            style:
                                fontStyle(neutral6Color, FontWeight.w600, 16),
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
                              color: neutral4Color,
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            height: 30,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Edit",
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
          padding: const EdgeInsets.only(left: 80.0, right: 70, top: 60),
          child: Text(
            " To Activate your listing Please Verify Your Service",
            style: fontStyle(neutral6Color, FontWeight.w500, 19),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
               Navigator.pushNamed(context, '/completeProfileProgress');
            });
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 70.0, vertical: 30),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Verify Your Service",
                    style: fontStyle(whiteColour, FontWeight.w500, 19),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


}
