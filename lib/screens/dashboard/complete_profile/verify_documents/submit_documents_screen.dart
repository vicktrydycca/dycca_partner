import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class SubmitDocumentsScreen extends StatefulWidget {
  const SubmitDocumentsScreen({Key? key}) : super(key: key);

  @override
  State<SubmitDocumentsScreen> createState() => _SubmitDocumentsScreenState();
}

class _SubmitDocumentsScreenState extends State<SubmitDocumentsScreen> {
  var documents = [
    {
      'icon': 'assets/images/adhar_card.png',
      'name': "E-Adhar Card",
      'path': viewDocumentsRoutes
    },
    {
      'icon': 'assets/images/pan_card.png',
      'name': "Pan Card",
      'path': ''
    },
    {
      'icon': 'assets/images/gst_no.png',
      'name': "GST Number",
      'path': ''
    },
    {
      'icon': 'assets/images/driving_license.png',
      'name': "Driving Licence",
      'path': ''
    },
    {
      'icon': 'assets/images/voter_id.png',
      'name': "Voter ID Card",
      'path': ''
    },
    {
      'icon': 'assets/images/passport.png',
      'name': "Passport",
      'path': ''
    }
  ];
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
        title: const Text("Submit any two Documents", style: appbarConstFont),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: documents.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      Image.asset(documents[index]['icon'] ?? ''),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          documents[index]['name'] ?? '',
                          style: fontStyle(neutral6Color, FontWeight.w500, 17),
                        ),
                      ),
                  ],),
                ),
              );
            },),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, documents[index]['path'] ?? '');
                Navigator.pushNamed(context,  '/viewDocumentsRoutes');
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: whiteColour,
                        size: 16,
                      ),
                      Text(
                        " Add",
                        style:
                        fontStyle(whiteColour, FontWeight.w500, 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
