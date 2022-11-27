import 'package:dycca_partner/screens/auth/forgot_password_screen.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        width: 350,
        child: Drawer(
          backgroundColor: whiteColour,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('assets/images/profile.jpeg',height: 100,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/profileDetailsRoutes');

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Rockvick Studio",
                      style: fontStyle(neutral6Color, FontWeight.w600, 24),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/profileDetailsRoutes');

                  },
                  child: Text(
                    "View Profile",
                    style: fontStyle(primaryColor, FontWeight.w500, 13),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(1),
                      borderRadius: BorderRadius.circular(8.0),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            "Go Premium",
                            style: fontStyle(whiteColour, FontWeight.w500, 16),
                          ),
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Icon(Icons.arrow_right,color: whiteColour,size: 30,),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      const Icon(Icons.share,color: primaryColor,size: 30,),
                      const SizedBox(width: 30,),
                      Text(
                        "Refer & Earn",
                        style: fontStyle(neutral6Color, FontWeight.w400, 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 25),
                  child: Row(
                    children: [
                      Image.asset('assets/images/add_more.png',height: 30,),
                      const SizedBox(width: 30,),
                      Text(
                        "Target Audience",
                        style: fontStyle(neutral6Color, FontWeight.w400, 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Image.asset('assets/images/target.png',height: 30,),
                      const SizedBox(width: 30,),
                      Text(
                        "Add More Studio",
                        style: fontStyle(neutral6Color, FontWeight.w400, 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 25),
                  child: Row(
                    children: [
                      Image.asset('assets/images/documents.png',height: 30,),
                      const SizedBox(width: 30,),
                      Text(
                        "Documents",
                        style: fontStyle(neutral6Color, FontWeight.w400, 16),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        const Icon(Icons.settings,color: primaryColor,size: 30,),
                        const SizedBox(width: 30,),
                        Text(
                          "Settings",
                          style: fontStyle(neutral6Color, FontWeight.w400, 16),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap:() async => await launch(
          "https://wa.me/${7838316628}?text=Hello"),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 25),
                    child: Row(
                      children: [
                        const Icon(Icons.help,color: primaryColor,size: 30,),
                        const SizedBox(width: 30,),
                        Text(
                          "Help",
                          style: fontStyle(neutral6Color, FontWeight.w400, 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
