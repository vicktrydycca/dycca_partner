import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/custom_widget/textfield_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController writeComment = TextEditingController();
    return Scaffold(
      backgroundColor: whiteColour,
      appBar: AppbarBackButton().AppbarBack(context, "About Us"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          children: [
            TextSearchWidget(controller: writeComment, placeholder: "Write comment here...",maxLines: 5,minLines: 5,fillColor: whiteColour,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: neutral3Color,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: Center(
                      child: Text(
                        "Add Later",
                        style: fontStyle(neutral6Color, FontWeight.w400, 19),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: (){
                      SendData().saveStudioProfile("studioAbout",writeComment.text,"about",context);
                      },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: fontStyle(whiteColour, FontWeight.w400, 19),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
