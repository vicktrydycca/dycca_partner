import 'dart:io';

import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/custom_widget/button_widget.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProfileDetails extends StatefulWidget {
  const AddProfileDetails({Key? key}) : super(key: key);

  @override
  State<AddProfileDetails> createState() => _AddProfileDetailsState();
}

class _AddProfileDetailsState extends State<AddProfileDetails> {
  final ImagePicker _picker = ImagePicker();

  XFile? image;
  String? imageStatus;
  TextEditingController studioName = TextEditingController();
  TextEditingController studioKeyword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              // color: neutral3Color.withOpacity(1),
              borderRadius: BorderRadius.circular(3.0),
            ),
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Studio Profile",
                    style: fontStyle(neutral6Color, FontWeight.w600, 20),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: studioName,
              decoration: InputDecoration(
                hintText: "Studio Name",

                labelText: "Studio Name",
                hintStyle: fontStyle(Colors.black45, FontWeight.w400, 14),
                labelStyle: fontStyle(Colors.black45, FontWeight.w400, 14),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: studioKeyword,
              decoration: InputDecoration(
                hintText: "Comma Seprated Keyword",
                labelText: "Add Keywords",
                hintStyle: fontStyle(Colors.black45, FontWeight.w400, 14),
                labelStyle: fontStyle(Colors.black45, FontWeight.w400, 14),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.image),
                ),
                Text(
                  "Add Logo",
                  style: fontStyle(Colors.black45, FontWeight.w600, 16),
                )
              ],
            ),
          ),
          imageStatus == null
              ? InkWell(
            onTap: () async {
              image =
              await _picker.pickImage(source: ImageSource.gallery);
              imageStatus = image.toString();
              setState(() {});
            },
            child: const Center(
                child: Icon(
                  Icons.camera_alt_sharp,
                  size: 100,
                  color: neutral4Color,
                )),
          )
              : InkWell(
              onTap: () async {
                image =
                await _picker.pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: Container(
                  height: 150,
                  width: 150,
                  child: Image.file(File(image!.path)))),
          SizedBox(
            height: 40,
          ),
          ButtonWidget(
              placeholder: "Submit",
              disabled: false,
              buttonClickCallback: () {
                SendData().studioProfileLogo(studioName.text,studioKeyword.text,"1",image!);
              })
        ],
      ),
    );
  }
}
