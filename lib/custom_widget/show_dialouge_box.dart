import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class Singleton {
  static void showmsg(BuildContext context) {
    bool checkboxValue = true;

    showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: 180,
            child: AlertDialog(
              backgroundColor: Colors.white,
              elevation: 2,
              title: Text("Rules For Publishing Event",style: fontStyle(neutral6Color, FontWeight.w100, 18),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("1. Before sending for approval Profile of all event partners needs to be verified.",style: fontStyle(neutral4Color, FontWeight.w100, 16),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text("2. Event should have all necessary informations ",style: fontStyle(neutral4Color, FontWeight.w100, 16),),
                  ),
                  Text("3. Events should agree with our canc ellation or refund policy & payment policy.",style: fontStyle(neutral4Color, FontWeight.w100, 16),),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text("Incase of violations of any of the above event will not be published",style: fontStyle(neutral4Color, FontWeight.w100, 16),),
                  ),
                ],
              ),
              actions: <Widget>[
                Row(
                  children: [
                    Checkbox(
                      activeColor: primaryColor,
                        value: checkboxValue, onChanged: (val){
                      checkboxValue = val!;
                    }),
                    Text("I agree to the",style: fontStyle(neutral6Color, FontWeight.w100, 14),),
                    Text(" Rules For Publishing Event",style: fontStyle(primaryColor, FontWeight.w100, 14),),
                  ],
                ),
                GestureDetector(
                  onTap:  () {
                    Navigator.pushNamed(context, '/eventDetailsRoutes');
                  },
                  child: Container( 
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "DONE",
                        style: appFontStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}