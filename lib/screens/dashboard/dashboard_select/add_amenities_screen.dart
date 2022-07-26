import 'package:dycca_partner/bloc_controllers/amenity_bloc.dart';
import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/custom_widget/flutter_switch.dart';
import 'package:dycca_partner/custom_widget/stream_loader.dart';
import 'package:dycca_partner/modal_class/amenity_bloc.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class AddAmenitiesScreen extends StatefulWidget {
  const AddAmenitiesScreen({Key? key}) : super(key: key);

  @override
  State<AddAmenitiesScreen> createState() => _AddAmenitiesScreenState();
}

class _AddAmenitiesScreenState extends State<AddAmenitiesScreen> {
  final amentityController = AmenityBloc();

  @override
  void initState() {
    // TODO: implement initState
    amentityController.getAmetiesList();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    amentityController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool data = true;
    return Scaffold(
      backgroundColor: whiteColour,
      appBar:
      AppbarBackButton().AppbarBack(context, "Amenities"),


      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            StreamBuilder<List<Amenity>>(

              stream: amentityController.amenityListStream,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
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
                          Image.network(snapshot.data![index].image ?? 'https://cdn4.vectorstock.com/i/1000x1000/74/28/image-unavailable-icon-vector-30057428.jpg',height: 30,),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            snapshot.data![index].amentName ?? '',
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
                },);}else{
                  return streamLoader();
                }
              }
            ),
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
