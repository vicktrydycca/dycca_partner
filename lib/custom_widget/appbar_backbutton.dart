import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarBackButton{

  AppBar AppbarBack(context,title){
    return AppBar(
      elevation: 0,
      backgroundColor: whiteColour,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: neutral6Color,
        ),
      ),
      title:  Text(title, style: appbarConstFont),
    );
  }
}