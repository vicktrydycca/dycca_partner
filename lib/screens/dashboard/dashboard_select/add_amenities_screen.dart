import 'package:dycca_partner/custom_widget/flutter_switch.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class AddAmenitiesScreen extends StatelessWidget {
  const AddAmenitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool data = true;
    var amenities = [

      {
        'icon': 'assets/images/air_conditioner.png',
        'name': "Air Conditioner",
        'path': ''
      },
      {
        'icon': 'assets/images/door.png',
        'name': "Trial Room",
        'path': ''
      },
      {
        'icon': 'assets/images/wifi.png',
        'name': "Free Wifi",
        'path': ''
      },
      {
        'icon': 'assets/images/parking.png',
        'name': "Parking Facility",
        'path': ''
      },

      {
        'icon': 'assets/images/first_aid.png',
        'name': "FirstAid",
        'path': ''
      },
      {
        'icon': 'assets/images/charger.png',
        'name': "Power Backup",
        'path': ''
      },
      {
        'icon': 'assets/images/washroom.png',
        'name': "Washroom",
        'path': ''
      },

      {
        'icon': 'assets/images/fire.png',
        'name': "Fire Extinguisher",
        'path': ''
      },

    ];
    return Scaffold(
      backgroundColor: whiteColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColour,
        leading: const Icon(Icons.arrow_back_ios,color: neutral6Color,),
        title: Text("Amenities",style: fontStyle(neutral6Color, FontWeight.w500, 16),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: amenities.length,
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
                      Image.asset(amenities[index]['icon'] ?? '',height: 30,),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        amenities[index]['name'] ?? '',
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
                        "+ Add Amenities",
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
