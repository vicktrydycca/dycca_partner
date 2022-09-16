import 'package:dycca_partner/api_helper/send_reponse/send_reponse.dart';
import 'package:dycca_partner/bloc_controllers/amenity_bloc.dart';
import 'package:dycca_partner/bloc_controllers/equipment_bloc.dart';
import 'package:dycca_partner/custom_widget/appbar_backbutton.dart';
import 'package:dycca_partner/custom_widget/flutter_switch.dart';
import 'package:dycca_partner/custom_widget/stream_loader.dart';
import 'package:dycca_partner/modal_class/equipment_modalclass.dart';
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';

class AddEquipmentsScreen extends StatefulWidget {
  const AddEquipmentsScreen({Key? key}) : super(key: key);

  @override
  State<AddEquipmentsScreen> createState() => _AddEquipmentsScreenState();
}

class _AddEquipmentsScreenState extends State<AddEquipmentsScreen> {
  final equipmentsController = EquipmentBloc();
  List<bool> switchList = [];
  List equipmentIDList = [];
  @override
  void initState() {
    // TODO: implement initState
    equipmentsController.getEquipmentsList();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    equipmentsController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool data = true;
    return Scaffold(
      backgroundColor: whiteColour,
      appBar:
      AppbarBackButton().AppbarBack(context, "Equipments"),


      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            StreamBuilder<List<Equipment>>(

                stream: equipmentsController.equipmentListStream,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    for(int i = 0; i < snapshot.data!.length;i++){
                      switchList.add(false);
                    }
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
                                  snapshot.data![index].equipName ?? '',
                                  style: fontStyle(neutral6Color, FontWeight.w500, 16),
                                ),
                                const Spacer(),
                                Switch(value: switchList[index], onChanged: (val){
                                  setState(() {

                                  });
                                  switchList[index] = val;

                                  if(switchList[index] == true){
                                    equipmentIDList.add(snapshot.data![index].equipId);
                                  }
                                  else{
                                    equipmentIDList.remove(snapshot.data![index].equipId);
                                  }

                                })
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
                  InkWell(
                    onTap: (){
                      SendData().saveStudioEquipement("equipm",equipmentIDList,"equipment",context);

                    },
                    child: Container(
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
