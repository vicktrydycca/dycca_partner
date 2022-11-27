import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class ListOfParticipantsScreen extends StatefulWidget {
  const ListOfParticipantsScreen({Key? key}) : super(key: key);

  @override
  State<ListOfParticipantsScreen> createState() => _ListOfParticipantsScreenState();
}

class _ListOfParticipantsScreenState extends State<ListOfParticipantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: whiteColour,
      appBar: AppbarBackButton().AppbarBack(context, "List of participants"),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric( vertical: 7),
                  child: ListTile(
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
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Dancer & choreographer",
                            style: appFontStyle(
                              color: neutral5Color,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 10,
                            backgroundColor: primaryColor,
                            child: Icon(Icons.check,color: whiteColour,size: 15,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Submitted",
                              style: appFontStyle(
                                color: primaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
