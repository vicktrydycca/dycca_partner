
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class DashboardAppbarWidget {
  static AppBar getAppBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: primaryColor),
      elevation: 0,
      title: headline,
      actions:  [
         const Icon(Icons.messenger_outlined,color: neutral4Color,size: 20,),
         const SizedBox(
          width: 15,
        ),
         IconButton(
           onPressed: () {
             print("ye");
             Navigator.pushNamed(context, '/notificationRoute');
           },
           icon: const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.notifications,color: neutral4Color,size: 25,)
        ),
         ),
      ],
    );
  }
}
