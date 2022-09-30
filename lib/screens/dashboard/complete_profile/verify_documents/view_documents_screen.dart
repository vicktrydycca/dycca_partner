import 'dart:io';

import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ViewDocumentsScreen extends StatefulWidget {
  const ViewDocumentsScreen({Key? key}) : super(key: key);

  @override
  State<ViewDocumentsScreen> createState() => _ViewDocumentsScreenState();
}

class _ViewDocumentsScreenState extends State<ViewDocumentsScreen> {
  bool expand = false;

  final ImagePicker _picker = ImagePicker();
  XFile? adharFrontImage;
  XFile? panCardImage;
  XFile? gstImage;
  XFile? drivingImage;
  XFile? voterImage;
  XFile? passportImage;
  XFile? adharBackImage;
  String? imageStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: const Icon(
          Icons.arrow_forward,
          color: whiteColour,
        ),
        backgroundColor: primaryColor,
        onPressed: () {
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
                              style:
                                  fontStyle(whiteColour, FontWeight.w500, 14),
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
                adharFrontImage == null
                    ? InkWell(
                        onTap: () async {
                          adharFrontImage = await _picker.pickImage(
                              source: ImageSource.gallery);
                          imageStatus = adharFrontImage.toString();
                          setState(() {
                            SendData()
                                .uploadImageHTTP('eadharcard', adharFrontImage!);
                          });
                        },
                        child: Image.asset('assets/images/aadhar_front.jpg'))
                    : InkWell(
                        onTap: () async {
                          adharFrontImage = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            child: Image.file(File(adharFrontImage!.path)))),
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
                adharBackImage == null
                    ? InkWell(
                        onTap: () async {
                          adharBackImage = await _picker.pickImage(
                              source: ImageSource.gallery);
                          imageStatus = adharBackImage.toString();
                          setState(() {
                            SendData()
                                .uploadImageHTTP('eadharcardback', adharBackImage!);
                          });
                        },
                        child: Image.asset(
                          'assets/images/adhar_back.jpg',
                          scale: 0.6,
                          width: 250,
                        ))
                    : InkWell(
                        onTap: () async {
                          adharBackImage = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            child: Image.file(File(adharBackImage!.path)))),
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
                              style:
                                  fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                panCardImage == null
                    ? InkWell(
                        onTap: () async {
                          panCardImage = await _picker.pickImage(
                              source: ImageSource.gallery);

                          setState(() {
                            SendData()
                                .uploadImageHTTP('pancard', panCardImage!);
                          });
                        },
                        child: Image.asset('assets/images/pan_image.png'))
                    : InkWell(
                        onTap: () async {
                          panCardImage = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            child: Image.file(File(panCardImage!.path)))),
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
                              style:
                                  fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                gstImage == null
                    ? InkWell(
                        onTap: () async {
                          gstImage = await _picker.pickImage(
                              source: ImageSource.gallery);

                          setState(() {
                            SendData().uploadImageHTTP('gstnumber', gstImage!);
                          });
                        },
                        child: Image.asset('assets/images/gst.png'))
                    : InkWell(
                        onTap: () async {
                          gstImage = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            child: Image.file(File(gstImage!.path)))),
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
                              style:
                                  fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                drivingImage == null
                    ? InkWell(
                    onTap: () async {
                      drivingImage = await _picker.pickImage(
                          source: ImageSource.gallery);

                      setState(() {
                        SendData().uploadImageHTTP('drivinglicence', drivingImage!);
                      });
                    },
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Image.asset(
                        'assets/images/gst.png',
                        height: 150,
                      ),
                    ),)
                    : InkWell(
                    onTap: () async {
                      drivingImage = await _picker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        child: Image.file(File(drivingImage!.path)))),

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
                              style:
                                  fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                voterImage == null
                    ? InkWell(
                  onTap: () async {
                    voterImage = await _picker.pickImage(
                        source: ImageSource.gallery);

                    setState(() {
                      SendData().uploadImageHTTP('voteridcard', voterImage!);
                    });
                  },
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Image.asset(
                      'assets/images/gst.png',
                      height: 150,
                    ),
                  ),)
                    : InkWell(
                    onTap: () async {
                      voterImage = await _picker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        child: Image.file(File(voterImage!.path)))),
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
                              style:
                                  fontStyle(whiteColour, FontWeight.w500, 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                passportImage == null
                    ? InkWell(
                  onTap: () async {
                    passportImage = await _picker.pickImage(
                        source: ImageSource.gallery);

                    setState(() {
                      SendData().uploadImageHTTP('passport', passportImage!);
                    });
                  },
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Image.asset(
                      'assets/images/gst.png',
                      height: 150,
                    ),
                  ),)
                    : InkWell(
                    onTap: () async {
                      passportImage = await _picker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        child: Image.file(File(passportImage!.path)))),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50),
              child: ButtonWidget(
                  placeholder: 'Submit',
                  disabled: false,
                  buttonClickCallback: () {}),
            )
          ],
        ),
      ),
    );
  }
}
