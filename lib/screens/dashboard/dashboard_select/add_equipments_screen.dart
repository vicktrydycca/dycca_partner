import 'package:dycca_partner/custom_widget/flutter_switch.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class AddEquipmentsScreen extends StatelessWidget {
  const AddEquipmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool data = true;
    var equipments = [

      {
        'icon': 'assets/images/speaker.png',
        'name': "Music System",
        'path': ''
      },
      {
        'icon': 'assets/images/floor.png',
        'name': "Wooden Floor",
        'path': ''
      },
      {
        'icon': 'assets/images/mirror.png',
        'name': "Mirror",
        'path': ''
      },

    ];
    return Scaffold(
      backgroundColor: whiteColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColour,
        leading: const Icon(Icons.arrow_back_ios,color: neutral6Color,),
        title: Text("Equipments",style: fontStyle(neutral6Color, FontWeight.w500, 16),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: equipments.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, amenities[index]['path'] ?? '');
                  },
                  child:Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(equipments[index]['icon'] ?? '',height: 30,),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          equipments[index]['name'] ?? '',
                          style: fontStyle(neutral6Color, FontWeight.w500, 16),
                        ),
                        const Spacer(),
                        FlutterSwitch(
                          width: 40.0,
                          height: 19.0,
                          valueFontSize: 30.0,
                          toggleSize: 15.0,
                          value: data,
                          borderRadius: 10.0,
                          padding: 4.0,
                          showOnOff: false,
                          activeColor: primaryColor,
                          onToggle: (val) {

                          },
                        ),
                      ],
                    ),
                  ),
                );
              },),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  Text(
                    "Not in list ?",
                    style: fontStyle(neutral6Color, FontWeight.w500, 16),
                  ),
                  Spacer(),
                  Container(
                    height: 30,
                    width: 130,
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(3))
                    ),
                    child: Center(
                      child: Text(
                        "+ Add Equipments",
                        style: fontStyle(whiteColour, FontWeight.w400, 16),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
