import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ViewDocumentsScreen extends StatefulWidget {
  const ViewDocumentsScreen({Key? key}) : super(key: key);

  @override
  State<ViewDocumentsScreen> createState() => _ViewDocumentsScreenState();
}

class _ViewDocumentsScreenState extends State<ViewDocumentsScreen> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  FloatingActionButton(
          elevation: 0.0,
          child:  const Icon(Icons.arrow_forward,color: whiteColour,),
          backgroundColor:  primaryColor,
          onPressed: (){
Navigator.pushNamed(context, '/refundPolicyRoutes');
          },
      ),
      backgroundColor: whiteColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColour,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: neutral6Color,
        ),
        title: const Text("View your Documents", style: appbarConstFont),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            ExpansionTile(
              key: GlobalKey(),
              // initiallyExpanded: expand,
              // onExpansionChanged: (value) {
              //   expand = value;
              // },
              iconColor: whiteColour,
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/adhar_card.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Aadhar Card",
                        style: fontStyle(neutral6Color, FontWeight.w500, 17),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(1),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              " Update",
                              style: fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    " Front Image of Aadhar Card",
                    style: fontStyle(neutral6Color, FontWeight.w400, 16),
                  ),
                ),
                Image.asset('assets/images/aadhar_front.jpg'),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    " Back Image of Aadhar Card",
                    style: fontStyle(neutral6Color, FontWeight.w400, 16),
                  ),
                ),
                Image.asset('assets/images/adhar_back.jpg',scale: 0.6,width: 250,),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            ExpansionTile(
              key: GlobalKey(),
              // initiallyExpanded: expand,
              // onExpansionChanged: (value) {
              //   expand = value;
              // },
              iconColor: whiteColour,
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/pan_card.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Pan Card",
                        style: fontStyle(neutral6Color, FontWeight.w500, 17),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(1),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              " Update",
                              style: fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    " Front Image of Pan Card",
                    style: fontStyle(neutral6Color, FontWeight.w400, 16),
                  ),
                ),
                Image.asset('assets/images/pan_image.png'),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    " Back Image of Pan Card",
                    style: fontStyle(neutral6Color, FontWeight.w400, 16),
                  ),
                ),
                Image.asset('assets/images/pan_image.png'),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            ExpansionTile(
              key: GlobalKey(),
              iconColor: whiteColour,
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/gst_no.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "GST Number",
                        style: fontStyle(neutral6Color, FontWeight.w500, 17),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(1),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              " Update",
                              style: fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Image.asset(
                    'assets/images/gst.png',
                    height: 150,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              key: GlobalKey(),
              iconColor: whiteColour,
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/driving_license.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Driving Licence",
                        style: fontStyle(neutral6Color, FontWeight.w500, 17),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(1),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              " Update",
                              style: fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Image.asset(
                    'assets/images/gst.png',
                    height: 150,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              key: GlobalKey(),
              iconColor: whiteColour,
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/voter_id.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Voter ID Card",
                        style: fontStyle(neutral6Color, FontWeight.w500, 17),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(1),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              " Update",
                              style: fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Image.asset(
                    'assets/images/gst.png',
                    height: 150,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              key: GlobalKey(),
              iconColor: whiteColour,
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/passport.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Passport",
                        style: fontStyle(neutral6Color, FontWeight.w500, 17),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(1),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              " Update",
                              style: fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Image.asset(
                    'assets/images/gst.png',
                    height: 150,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 50),
              child: ButtonWidget(placeholder: 'Submit', disabled: false, buttonClickCallback: (){}),
            )
          ],
        ),
      ),
    );
  }
}
